From: Ian Laurie <iml@zip.com.au>
Subject: Re: Hi!
Date: Sun, 12 Jun 2005 23:48:10 +0000
Message-ID: <1118620090l.11527l.0l@server.moose.blogdns.org>
References: <2e51be410506111000557ddca1@mail.gmail.com>
	<Pine.LNX.4.53.0506111202260.9775@altaica>
	<1118512593.18567.6.camel@debianbox>
	<Pine.LNX.4.53.0506111321350.9775@altaica>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0506111321350.9775@altaica> (from
	tib@tigerknight.org on Sun Jun 12 04:22:52 2005)
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
Content-Type: text/plain; charset="us-ascii"; format="Flowed"
To: Tib <tib@tigerknight.org>, netfilter@lists.netfilter.org

On 06/12/2005 04:22:52 AM, Tib wrote:
>=20
> Caveat to what I just said - if you are doing masquerading behind a singl=
e
> IP, then you don't need to worry about the FORWARD ruleset. Only packets
> associated with connections  that are being masqueraded will get sent on
> to internal networks - unless you have specific ports that are translated
> to internal services.
>=20
> <EOL>
> Tib

Actually that isn't quite correct.  With ip_forward on, network bridging is=
=20
enabled. Running NAT does not disable the bridging function.  If a box on t=
he=20
outside port sends a packet addressed to a box on the inside port, using th=
e=20
firewall as its gateway, the packet will get through NAT.  NAT runs on top=20
of the bridging function, so bridging still works, though only in one direc=
tion
since in the other direction packets will get NATed.

You need to specifically use rules in the firewall to stop unsolicited
packets from getting through, like ESTABLISHED/RELATED etc.

The idea that running NAT disables bridging is a common and dangerous
misconception.  Showing this isn't so is a simple experiment, and one
I have done many times to the astonishment of onlookers.

You can block packets addressed to the inside of a firewall by a rule in
your PREROUTING chain like so:

-A PREROUTING -i eth0 -d 10.1.1.0/24 -j DROP

Where 10.1.1.* is the inside range and eth0 is the outside port.  Basically
this DROPs anything appearing on the outside interface addressed to
something on the inside interface.

Technically though this rule is unnecessary if the rest of your firewall
is set up right, since you would ordinarily be using rules to ensure that
only response packets get back through the FORWARD chain.  For example:

-A FWD_INBOUND_TCPUDP -m state --state RELATED,ESTABLISHED -j ACCEPT

Ian

PS - Another misconception some have is that setting rp_filter stops this,
it doesn't, since rp_filter works on a packet's source IP, not destination
IP.  However, I for one would be in favor of another kernel flag that
*would* work on the destination IP.





