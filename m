From: Jakub Wartak <vnulllists@pcnet.com.pl>
Subject: Re: packets loging
Date: Sat, 22 Apr 2006 15:47:31 +0200
Message-ID: <200604221547.31612.vnulllists@pcnet.com.pl>
References: <002d01c66445$01dd28f0$0e01050a@CyberAdmin>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002d01c66445$01dd28f0$0e01050a@CyberAdmin>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Dnia czwartek, 20 kwietnia 2006 08:38, robee napisa=B3:
> when i use -j LOG target, netfilter writes so many information to syslog.
> what can i use to write only IN and OUT interface, SRC and DST host?

Get a syslog-ng up && running.=20
Create filter to match only entries you are interested in ( iptables=20
=2D-log-prefix "something-unique"  + filter { } definition in syslog-ng.con=
f )
Try to catch this "prefix" and direct it into pipe ( you can feed some SQL=
=20
backend with it or write small daemon/script that will read this pipe line =
by=20
line and extract information that you want to store/you are interested in ).

And also try NOT to log netfilter messages info messages/kernel and so on=20
( performance reasons ).  This can be achived by using "not=20
match(somestring)" in log {} section.

=2D-=20
Jakub Wartak
=2Dvnull
Abstrakcyjna plciowosc szczekoczulek Konstantego.
http://vnull.pcnet.com.pl/

