From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Multiple client VPN - where to put conntrack?
Date: Tue, 9 Nov 2004 20:18:50 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F0197B7@pxtvjoexd01.pxt.primeexalia.com>
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
To: ?? <zping@founderbn.com>, netfilter@lists.netfilter.org

I replied to this yesterday.  You need to put pptp-conntrack (different
from normal conntrack) into your kernel.  It can be found at the
netfilter respository.

I did just this last month on RHEL3r3. =20

Gary Wayne Smith


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of
zping@founderbn.com
Sent: Tuesday, November 09, 2004 4:00 PM
To: netfilter@lists.netfilter.org
Subject: Re:Multiple client VPN - where to put conntrack?

Hi there,

This may be a very stupid question, but I haven't found the information=20
anywhere, so here goes - I have a working VPN client-server set-up that=20
works through an iptables masquerading NAT configuration but only for=20
one client at a time - and I need to expand it. The VPN is:
- Server - running PPTP (poptop) on Redhat 9 connected directly to the=20
internet via iptables.
- Client(s) - A small network of workstations (Debian, win2k, mac OSX)=20
connected to the internet with ADSL via a Debian router running iptables

doing NAT. Currently, tunnels are created from the workstations to the=20
server through the router and internet successfully, but only one=20
machine can connect at a time and I would like to improve on this.

I understand that I need to install PPTP and GRE connection tracking on=20
the Debian router...(and here's the silly question...) will the RH9 PPTP

server need conntrack too?

One further question, the ADSL connection at the client end uses PPPoA=20
with LLC - would it be possible for this to stuff up the connection=20
tracking or unlikely? And what about PPPoE? Or is it all just completely

dependent on the ISP?

Thanks,

James


I should update your ppp server=20




