From: Gladson George <georgc@FARMINGDALE.EDU>
Subject: RE: how to filter kazaa
Date: Sun, 25 May 2003 21:57:05 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2CE951F1A7DC0644A33B9F763D2029C0016FB0E2@mail.it.farmingdale.edu>
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
To: Esteban Ribicic <eribicic@UolSinectis.com>, jaws <jaws@skyinet.net>
Cc: kisero@uolsinectis.com.ar, netfilter@lists.netfilter.org

If you want to use tc take a look at this link, I haven't tried it my=
 self=0D=0Abut it looks promising.  =0D=0A=0D=0A-----Original Message=
-----=0D=0AFrom: Esteban Ribicic [mailto:eribicic@UolSinectis.com] =
=0D=0ASent: Thursday, May 22, 2003 7:08 AM=0D=0ATo: jaws=0D=0ACc: kis=
ero@uolsinectis.com.ar; Gladson George; netfilter@lists.netfilter.org=
=0D=0ASubject: RE: how to filter kazaa=0D=0A=0D=0Aso i could use this=
 on the prerouting table and marks paqeuts so then=0D=0Aapplyen them =
a tc filter? =0D=0A=0D=0Ain that case, you've save my life!=0D=0A=
=0D=0A=0D=0AOn Thu, 2003-05-22 at 07:10, jaws wrote:=0D=0A> but filte=
ring port 1214 will not solve the problem coz kazza can use other =
=0D=0A> ports.=0D=0A> =0D=0A> At 12:58 PM 5/21/2003 -0300, eribicic@s=
inectis.com wrote:=0D=0A> >isnt it easyer to filter ports 1214?=0D=
=0A> >=0D=0A> > > The following rule has worked for me.=0D=0A> > >=
=0D=0A> > > http://www.securityfocus.com/infocus/1531=0D=0A> > >=0D=
=0A> > >=0D=0A> > > $IPTABLES -A FORWARD -p tcp -m string --string X-=
Kazaa-Username: -j=0D=0AREJECT=0D=0A> > > --reject-with tcp-reset=
=0D=0A> > >=0D=0A> > > $IPTABLES -A FORWARD -p tcp -m string --string=
 X-Kazaa-Network: -j=0D=0AREJECT=0D=0A> > > --reject-with tcp-reset=
=0D=0A> > >=0D=0A> > > $IPTABLES -A FORWARD -p tcp -m string --string=
 X-Kazaa-IP: -j REJECT=0D=0A> > > --reject-with tcp-reset=0D=0A> > >=
=0D=0A> > > $IPTABLES -A FORWARD -p tcp -m string --string X-Kazaa-Su=
pernodeIP: -j=0D=0A-j=0D=0A> > > REJECT --reject-with tcp-reset=0D=
=0A> > >=0D=0A> > > -----Original Message-----=0D=0A> > > From: track=
er [mailto:jaws@skyinet.net]=0D=0A> > > Sent: Wednesday, May 21, 2003=
 3:20 PM=0D=0A> > > To: netfilter@lists.netfilter.org=0D=0A> > > Subj=
ect: how to filter kazaa=0D=0A> > >=0D=0A> > > Hi all,=0D=0A> > >=
=0D=0A> > > Im new to this list and iptables. I would like to know ho=
w to filter=0D=0Akazaa.=0D=0A> > >=0D=0A> > > Thanks.=0D=0A> > >=0D=
=0A> > > Jaws=0D=0A> > >=0D=0A> > >=0D=0A> > >=0D=0A> >--=0D=0A> >Sld=
s.=0D=0A> =0D=0A> =0D=0A> =0D=0A> =0D=0A> =0D=0A-- =0D=0AEsteban Ribi=
cic <eribicic@UolSinectis.com>=0D=0A=0D=0AUOL-Sinectis - Network Oper=
ation Center=0D=0AFlorida 537 6to - Capital Federal - Argentina=0D=
=0A(tel directo) 54+011-4321-9107=0D=0A=0D=0A=0D=0A=

