From: Gladson George <georgc@FARMINGDALE.EDU>
Subject: RE: how to filter kazaa
Date: Wed, 21 May 2003 12:08:35 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2CE951F1A7DC0644A33B9F763D2029C0012A2886@mail.it.farmingdale.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: kisero@uolsinectis.com.ar, jaws@skyinet.net, netfilter@lists.netfilter.org

Kazaa has the ability to run on port 80 if port 1214 is blocked.  =
=0D=0A=0D=0A-----Original Message-----=0D=0AFrom: eribicic@sinectis.c=
om [mailto:kisero@uolsinectis.com.ar] =0D=0ASent: Wednesday, May 21, =
2003 11:58 AM=0D=0ATo: Gladson George; jaws@skyinet.net; netfilter@li=
sts.netfilter.org=0D=0ASubject: RE: how to filter kazaa=0D=0A=0D=0Ais=
nt it easyer to filter ports 1214?=0D=0A=0D=0A=0D=0A=0D=0A> The follo=
wing rule has worked for me. =0D=0A=0D=0A> =0D=0A=0D=0A> http://www.s=
ecurityfocus.com/infocus/1531=0D=0A=0D=0A> =0D=0A=0D=0A> =0D=0A=0D=
=0A> $IPTABLES -A FORWARD -p tcp -m string --string X-Kazaa-Username:=
 -j REJECT=0D=0A=0D=0A> --reject-with tcp-reset=0D=0A=0D=0A> =0D=0A=
=0D=0A> $IPTABLES -A FORWARD -p tcp -m string --string X-Kazaa-Networ=
k: -j REJECT=0D=0A=0D=0A> --reject-with tcp-reset=0D=0A=0D=0A> =0D=
=0A=0D=0A> $IPTABLES -A FORWARD -p tcp -m string --string X-Kazaa-IP:=
 -j REJECT=0D=0A=0D=0A> --reject-with tcp-reset=0D=0A=0D=0A> =0D=0A=
=0D=0A> $IPTABLES -A FORWARD -p tcp -m string --string X-Kazaa-Supern=
odeIP: -j -j=0D=0A=0D=0A> REJECT --reject-with tcp-reset=0D=0A=0D=
=0A> =0D=0A=0D=0A> -----Original Message-----=0D=0A=0D=0A> From: trac=
ker [mailto:jaws@skyinet.net] =0D=0A=0D=0A> Sent: Wednesday, May 21, =
2003 3:20 PM=0D=0A=0D=0A> To: netfilter@lists.netfilter.org=0D=0A=
=0D=0A> Subject: how to filter kazaa=0D=0A=0D=0A> =0D=0A=0D=0A> Hi al=
l,=0D=0A=0D=0A> =0D=0A=0D=0A> Im new to this list and iptables. I wou=
ld like to know how to filter kazaa.=0D=0A=0D=0A> =0D=0A=0D=0A> Thank=
s.=0D=0A=0D=0A> =0D=0A=0D=0A> Jaws=0D=0A=0D=0A> =0D=0A=0D=0A> =0D=
=0A=0D=0A> =0D=0A=0D=0A-- =0D=0ASlds.=0D=0A=

