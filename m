From: "Paul Clark" <paul@xmill.com>
Subject: RE: REDIRECT after SNAT?
Date: Tue, 27 May 2003 21:17:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <EIEMLBOIBLCDHIEMFNPCAEOPCDAA.paul@xmill.com>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6CC8@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A0D6CC8@wardrive.citadelcomputer.com.au>
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
To: netfilter@lists.netfilter.org
Cc: George Vieira <georgev@citadelcomputer.com.au>

I wrote:
> Is there any way to force a REDIRECT to (e.g.) a local Web
> server _after_ SNAT has been done?  I have a Truly Evil Scheme
> to map VLANs to SNAT address ranges, and I want it to work with a
> transparent proxy -on the same device-
> (I'm pretty sure it would work fine split across two devices).
> ...

George Vieira wrote:
> I know what your trying to do.. there is no way really as even
> large ISPs who use TProxies don't do this and when you browse
> some sites they say "Hey, your from <insert IP here>" and it's
> not yours...
>
> The reason it won't work is that once REDIRECT runs it enters
> Squid immediately and squid then takes over and you can't change
> the address.
> If you SNAT it first, then it just goes out and the REDIRECT
> won't activate..

Thanks for this, but I'm guessing that your guess of what I'm trying to do,
while most interesting itself, isn't actually what I'm doing... ;-)  You
seem to be suggesting a totally-transparent-proxy which preserves the
client's IP (a problem that hadn't occurred to me, but still worthy of a
fix!)

Ironically, I'm not so much trying to preserve the client's IP as obliterate
it altogether!  The scenario is a 'public access' network in which I don't
trust the clients even to have correct IP settings (nor Do The Right Thing
by requesting DHCP) - not even to avoid clashing IP addresses!  The only
thing I can trust about them is they all appear on different VLANs at my
firewall, because I built the switched network that way.  With Geneva
Convention-breaking (ab)use of Proxy-ARP, I can at least get them to talk to
me, but I need a way of routing back to them in a way that a conventional
server can use.

Hence what I'm thinking of is a VLAN-marked-SNAT scheme where I map incoming
VLANs to non-overlapping (private) IP ranges - a kind of mummy-knows-best
network-fixer.  I'm pretty sure this would work fine as a pure router device
talking to some other servers, but I'm also a cheapskate and want to run
local services (including, but not limited to, squid) on the same machine.

Hence I need squid (and other local services) to see the same SNAT-ted
addresses as the outside world - and also, of course, for their output to be
de-SNAT-ted back to the VLANs.  And for Christmas, I also want another level
of SNAT again to do a conventional NAT-ted public IP interface, all in the
same box...  Not asking much, am I?

I was considering doing something with a DNAT to another external (virtual?)
interface address on the same machine (as opposed to the usual localhost
REDIRECT), but I suspect the routing code would spot this and deliver it
unmunged to INPUT before SNAT gets to it.

What seems to be needed is a way of wrapping the entire netfilter process in
a lump and 'calling' it from the MANGLE stage of an outer one - 'recursive
netfilter', if you like.  Just a thought - would LVS help here, or is
netfilter still shared between virtual servers?

           ---------------------------------------
          | Top-level netfilter                   |
          |                                       |
          |   --------      -----        ------   |
 dumb     |  |sub-nf  |    /ROUTE\      |POSTR |  |
 clients -|--|VLAN<>IP|----\     /------| more |--|-> World
 VLAN 1-n |  | SNAT   |     --|--       | SNAT |  |
          |   --------     ---|-----     ------   |
          |               | local   |             |
          |               | services|             |
          |                ---------              |
           ---------------------------------------

I guess I could write a new iptables module (more likely low-level netfilter
module) to do all this, but I'm also very lazy and like building things from
kits ;-)

Thanks

Paul



