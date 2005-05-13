From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Tarpit usage question
Date: Fri, 13 May 2005 00:01:59 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE58290738C@pxtbenexd01.pxt.primeexalia.com>
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
To: "Taylor, Grant" <gtaylor@riverviewtech.net>, netfilter@lists.netfilter.org

Grant,=20

We're on the same page here.  Just one more question to confirm my
complete understanding.  We're natting some IP's in which we have
special rules and tables for.  This is all handled in the post/pre nat
table and the forward filter table.

I'm assuming that the input chain of the raw table is for locally
destined requests to the firewall itself.=20

Ex.  The firewall external IP is 22.33.44.1 and I also assign 2-6 to the
firewall and NAT them in locally to 10.0.0.2-6 accordingly.  With this
said, if I setup the rules below on the raw table I'm assuming that it
will only be caught on the 22.33.44.1 IP.  Is this assumption wrong or
should I also qualify the addresses that I care about on the raw table.


Like this:

iptables -t raw -A INPUT -d 22.33.44.55 -p tcp --dport 22 -j ACCEPT
iptables -t raw -A INPUT -d 22.33.44.55 -p tcp --dport 443 -j ACCEPT
iptables -t raw -A INPUT -d 22.33.44.55 -p tcp -j NOTRACK
iptables -t filter -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -t filter -A INPUT -p tcp -j TARPIT


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Taylor,
Grant
Sent: Thursday, May 12, 2005 4:37 PM
To: netfilter@lists.netfilter.org
Subject: Re: Tarpit usage question

> Hi guys,=20
>=20
> I had a usage question about tarpit in respects to connection
tracking.
> We have a firewall that has a fairly heavy usage so we have put a
> separate box external of the firewall to do tarpitting of port
scanners.
> Anyways, we are still being hit pretty hard by many things on this
> firewall.  I was thinking about configuration tarpit on the firewall
> cluster but wanted to ensure that connection tracking wasn't a
problem.
>=20
> Is it as simple as just sending the connection to the NOTRACK chain
> before sending it to tarpit?
>=20
> iptaables -t raw -A INPUT -p tcp -m tcp --dport 80 -j NOTRACK
> iptables -A INPUT -p tcp -m tcp --dport 80 -j TARPIT
>=20
> Is there a better approach to this?  Will this even work?  The rules
> above are more or less just a sample.  I would want to block almost
all
> traffic destined for the input chain on the firewall on the external
> interface unless it is related traffic.

If you were worried about just one port, as in your example, I would do
what you have done.  However if you are planing on TARPITing a lot of
ports (the majority of them) I would be tempted to do something like the
following:

iptables -t raw -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -t raw -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -t raw -A INPUT -p tcp -j NOTRACK
iptables -t filter -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -t filter -A INPUT -p tcp -j TARPIT

This should cause any traffic that is not destined to known good ports
to be not tracked and thus safe to send to the TARPIT.



Grant. . . .


