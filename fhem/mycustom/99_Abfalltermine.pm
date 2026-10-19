#
# Hilfsfunktion für Kalenderauswertungen
#

use Time::Local;

sub
KalenderDatum($$)
{
   my ($KalenderName, $KalenderUid) = @_;
   my $dt = fhem("get $KalenderName start uid=$KalenderUid 1");
   my $ret = time - (2*86400);  #falls kein Datum ermittelt wird Rückgabewert auf "vorgestern" -> also vergangener Termin;

   if ($dt and $dt ne "")
   {
      my @SplitDt = split(/ /,$dt);
      my @SplitDate = split(/\./,$SplitDt[0]);
      $ret = timelocal(0,0,0,$SplitDate[0],$SplitDate[1]-1,$SplitDate[2]);
   }

   return $ret;
}


#
# Abfall Kalender auswerten / Google Kalender: "Abfall"
#

sub
Abfalltermine()
{
   my $t  = time;
   my @Tonnen = ("Papiersammlung", "Wertstoffsammlung", "Restabfallsammlung", "BioTonne");
   my @SuchTexte = (".*Papier.*", ".*Wertstoff.*", ".*Restabfall.*", ".*Bio.*");
   my $uid;
   my $dayDiff;

   for(my $i=0; $i<4; $i++)
   {
      $dayDiff = -1; #BUG behoben
      my @uids = split(/;/,fhem("get Abfall find $SuchTexte[$i]"));

      # den nächsten Termine finden
      foreach $uid (@uids)
      {
         my $eventDate = KalenderDatum('Abfall', $uid);
         my $dayDiffNeu = floor(($eventDate - $t) / 60 / 60 / 24 + 1);
         if ($dayDiffNeu >= 0 && ($dayDiffNeu < $dayDiff || $dayDiff == -1)) #BUG behoben
         {
            $dayDiff = $dayDiffNeu;
         }
      }

      fhem("setreading MuellterminDummy $Tonnen[$i] $dayDiff");
   }
}

