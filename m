From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Multiple client VPN - where to put conntrack?
Date: Mon, 8 Nov 2004 20:10:12 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F0197B3@pxtvjoexd01.pxt.primeexalia.com>
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
To: Lists account <lists@jcitc.com>, netfilter@lists.netfilter.org

You need to add pptp-conntrack to your kernel (requiring a recompile).

I followed the instructions for pptp-client kernel compile as well as
added a few of the options patch-o-matic options while I was there
(killing two birds with one stone).

Gary

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Lists
account
Sent: Monday, November 08, 2004 2:44 PM
To: netfilter@lists.netfilter.org
Subject: Multiple client VPN - where to put conntrack?

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




