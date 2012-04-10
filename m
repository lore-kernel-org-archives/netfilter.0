From: Toralf =?utf-8?q?F=C3=B6rster?= <toralf.foerster@gmx.de>
Subject: big time stamps in /proc/net/xt_recent/
Date: Tue, 10 Apr 2012 20:15:58 +0200
Message-ID: <201204102015.58424.toralf.foerster@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

I'm wondering about about the big time stamps of the ip address 121.130=
=2E59.25:

$ cat /proc/net/xt_recent/MAX_CONN_PER_IP
src=3D92.53.20.66 ttl: 122 last_seen: 743433 oldest_pkt: 2 740470, 7434=
33
src=3D216.172.178.24 ttl: 53 last_seen: 714346 oldest_pkt: 1 714346
src=3D121.130.59.25 ttl: 113 last_seen: 4294768081 oldest_pkt: 1 429476=
8081
src=3D2.90.50.179 ttl: 110 last_seen: 257432 oldest_pkt: 1 257432
src=3D92.224.122.219 ttl: 64 last_seen: 175404 oldest_pkt: 1 175404


The background is that I use this perl 1-liner to convert the times int=
o readable local time strings :

$> perl -wane 'foreach my $i (4..$#F) {$r =3D \$F[$i]; next unless ($$r=
); $$r =3D~ s/,//g; next unless ($$r =3D~ m/\d+$/); next unless ($$r > =
100000); $$r =3D localtime (time() - $$r/1000); } print join ("   ", @F=
), "\n"'=20
/proc/net/xt_recent/MAX_CONN_PER_IP

and getting this output:

src=3D92.53.20.66   ttl:   122   last_seen:   Tue Apr 10 20:01:22 2012 =
  oldest_pkt:   2   Tue Apr 10 20:01:25 2012   Tue Apr 10 20:01:22 2012
src=3D216.172.178.24   ttl:   53   last_seen:   Tue Apr 10 20:01:51 201=
2   oldest_pkt:   1   Tue Apr 10 20:01:51 2012
src=3D121.130.59.25   ttl:   113   last_seen:   Tue Feb 21 02:14:17 201=
2   oldest_pkt:   1   Tue Feb 21 02:14:17 2012
src=3D2.90.50.179   ttl:   110   last_seen:   Tue Apr 10 20:09:28 2012 =
  oldest_pkt:   1   Tue Apr 10 20:09:28 2012
src=3D92.224.122.219   ttl:   64   last_seen:   Tue Apr 10 20:10:50 201=
2   oldest_pkt:   1   Tue Apr 10 20:10:50 2012

 and I do know that the dates from February can't be correct due to an =
uptime of less than 1 day.

--=20
MfG/Sincerely
Toralf F=C3=B6rster
pgp finger print: 7B1A 07F4 EC82 0F90 D4C2 8936 872A E508 7DB6 9DA3
