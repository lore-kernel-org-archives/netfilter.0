From: Gladson George <georgc@FARMINGDALE.EDU>
Subject: RE: how to filter kazaa
Date: Wed, 21 May 2003 11:15:09 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2CE951F1A7DC0644A33B9F763D2029C0012A2884@mail.it.farmingdale.edu>
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
To: tracker <jaws@skyinet.net>, netfilter@lists.netfilter.org

The following rule has worked for me. =0D=0A=0D=0Ahttp://www.security=
focus.com/infocus/1531=0D=0A=0D=0A=0D=0A$IPTABLES -A FORWARD -p tcp -=
m string --string X-Kazaa-Username: -j REJECT=0D=0A--reject-with tcp-=
reset=0D=0A=0D=0A$IPTABLES -A FORWARD -p tcp -m string --string X-Kaz=
aa-Network: -j REJECT=0D=0A--reject-with tcp-reset=0D=0A=0D=0A$IPTABL=
ES -A FORWARD -p tcp -m string --string X-Kazaa-IP: -j REJECT=0D=0A--=
reject-with tcp-reset=0D=0A=0D=0A$IPTABLES -A FORWARD -p tcp -m strin=
g --string X-Kazaa-SupernodeIP: -j -j=0D=0AREJECT --reject-with tcp-r=
eset=0D=0A=0D=0A-----Original Message-----=0D=0AFrom: tracker [mailto=
:jaws@skyinet.net] =0D=0ASent: Wednesday, May 21, 2003 3:20 PM=0D=
=0ATo: netfilter@lists.netfilter.org=0D=0ASubject: how to filter kaza=
a=0D=0A=0D=0AHi all,=0D=0A=0D=0AIm new to this list and iptables. I w=
ould like to know how to filter kazaa.=0D=0A=0D=0AThanks.=0D=0A=0D=
=0AJaws=0D=0A=0D=0A=0D=0A=

