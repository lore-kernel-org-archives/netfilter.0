From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: multiple nat'd clients to poptop
Date: Tue, 14 Dec 2004 18:05:26 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F1BBD@pxtvjoexd01.pxt.primeexalia.com>
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
To: Craig Nellist <nellistc@gmail.com>
Cc: netfilter@lists.netfilter.org

v1.2.11.  This is on RHEL3v3.  I figured if I had to recompile iptables =
I might as well upgrade while I was at it. =20
=20
It could also be that the hardware device does not support multiple =
NAT'd GRE packets.  I've had problems with some clients using some (not =
all) Linksys devices.  Some others that are based on the Linux kernel =
are more likely to fail as well (from what I've been told and found in =
some news groups). =20
=20
Gary
=20

________________________________

From: Craig Nellist [mailto:nellistc@gmail.com]
Sent: Tue 12/14/2004 5:02 PM
To: Gary W. Smith
Cc: netfilter@lists.netfilter.org
Subject: Re: multiple nat'd clients to poptop



On Tue, 14 Dec 2004 15:02:43 -0800, Gary W. Smith <gary@primeexalia.com> =
wrote:
> >trying to connect to a server which is itself behind a router and =
NAT'd
>
> You mentioned that you applied the conntrack patch.  Did you do this =
on both the firewalls?  I have had success with the following.  Note =
that I have disabled ip_nat_pptp.  If I load ip_nat_pptp then only one =
person can connect and on the first time only.  Subsequent attempts =
fail.  I have asked but received no feedback on this as well.  But =
hopefully this will help you as well.

I have the conntrack patch applied on the server machine. The clients
are behind a hardware router/firewall (not a PC).

> Anyways, here's what I run and the order that I run them in.  The =
firewall currently has two active incoming connections I did test =
multiple outgoing connections when I configured it.

Ok, thanks for the info. Which iptables rules do you have running in
conjunction with this?


cheers,
 Craig


