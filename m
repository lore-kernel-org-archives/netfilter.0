From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Help! problem with PPTPD and pptp nat helper
Date: Mon, 27 Dec 2004 14:15:56 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F1BDC@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: Radien Radien <radien@gmail.com>, netfilter@lists.netfilter.org

I found an oddity while experimenting with ip_nat_pptp.  If it's loaded =
I cannot make an outgoing pptp call from the server.  If I unload it =
will make the call just fine.  After the call has been established I can =
then reload the module and then connect from workstations.
=20
If a workstation is connected to an external VPN it's connection is not =
broken.  Another oddity is that lsmod shows that module loaded, but not =
being used even when there are multiple active conenctions behind the =
firewall.
=20
I'm still looking for a better solution to this problem.  The temporary =
work around is to script the outgoing pptp calls with an rmmod and =
modprobe before and after.
=20
Gary Smith
=20

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Radien Radien
Sent: Sun 12/26/2004 4:15 AM
To: netfilter@lists.netfilter.org
Subject: Help! problem with PPTPD and pptp nat helper



But based on netfilter pom-ng documentation its needed for NAT working =
properly

http://www.netfilter.org/patch-o-matic/pom-extra.html#pom-extra-pptp-conn=
track-nat

I have great successfull experiment using these 4 p-o-m modules, they
work perfect in my cases multiple session for DNAT and SNAT even both
at the same time. But when the last one is loaded part of pptpd(when
uses pppd) cannot negotiate using LCP, it seems so in logfiles. And if
I unload it, pptpd works fine!!

#This adds CONFIG_IP_NF_PPTP:
#Connection tracking and NAT support for PPTP.  Using this, you can =
track
#PPTP/GRE connections and do SNAT/DNAT.  You have to load the following =
modules
#for connection tracking:
#       ip_conntrack_proto_gre
#       ip_conntrack_pptp
#for NAT:
#       ip_nat_proto_gre
#       ip_nat_pptp
#

It seems to be a conflict of using ppp, with ip_nat_pptp module and =
pptpd.




