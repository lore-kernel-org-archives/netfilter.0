From: Mike Williams <mike@v6.gaima.co.uk>
Subject: Re: problem with (incorrectly?) INVALID packets
Date: Wed, 13 Dec 2006 12:39:34 +0000
Message-ID: <200612131239.35043.mike@v6.gaima.co.uk>
References: <200612121942.19276.mike@v6.gaima.co.uk>
	<457F6F58.3010005@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <457F6F58.3010005@riverviewtech.net>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wednesday 13 December 2006 03:11, Grant Taylor wrote:
> > The bridge has a rule for traffic from 90.1...1.64/27 to go via a default
> > gateway of 81.1...7.49, as it can route to that.
>
> What do you mean by "... bridge has a rule ..."?  What sort of rule are
> you talking about?  Are you referring to a route, or an IPTables rule,
> or an EBTables rule, or something else?  Or is this part of your question?

Oh, sorry.
# ip rule add from 90.1...1.65/27 table temp90
# ip route add default via 81.1...7.49 dev br2 table temp90

> > To add a bit more difficultly, the interface on LFW with public IPs is
> > also a bridge, some may remember my question about bridging and NATting,
> > this is the machine which will be doing that.
>
> Do you mean to say that the interface on LFW with the public ip is the
> bridge port (i.e. bri0) of the bridge that contains the 81.1...7.48/28
> and 90.1...1.64/27 networks?

br2 is the bridge on "bridge" in the diagram, and has a 90... and 81... IP.
br0 is the bridge on LFW, it has several 90... IPs.

> > When I ping things from LFW I get an ICMP redirect to 81.1...7.49, but I
> > don't see anyway I can reach it directly from 90.1...1.67. This is
> > however a minor annoyance.
>
> What "things" per say are you trying to ping?  Where are you trying to
> ping them from?  What IP address is used during your pinging?

Anything on the internet. LFW. Any of the 90... IPs assigned to it.

> This leads me to believe that you don't have your routing set up quite
> right.

I'd love some suggestions on how to make it right :)

> > 0.0/24 can do all the things they are supposed to be able to do to
> > 136.0/24. 136.0/24 can do all they things they are supposed to be able to
> > do against the internet.
> > 136.0/24 however can't do anything to 0.0/24, as the packets coming back
> > from 0.0/24 get blocked by rules designed to stop non-authorised traffic
> > being initiated from 0.0/24 to 136.0/24.
>
> I'll presume that you are talking IPTables rules here.  It sounds like
> there is a slight problem in your rules.

Yes, rules here are iptables.
The rule set is basically the same as the rule set we currently use in 
production. It's modified to change interface names, public side IP address, 
add an additional internal zone, and add some more limits on what zones can 
do to each other.
On all the other firewalls I run using fwbuilder you allow packets from here 
to there, and the ACCEPT on ESTABLISHED or RELATED automatically allows the 
returning packets.

> > Pretty much the first rules I have say any ESTABLISHED or RELATED packets
> > get accepted. Which should match these returning packets, and does on the
> > more "normal" firewalls I run.
>
> VPNs make things more complicated.  Depending on which VPN technology
> and / or implementation there of, you may or may not get devices to use
> in your IPTables rules.  The existence or lack there of can complicate
> things.  Usually the lack of the devices means you will have to open up
> your firewall rules on interfaces that the traffic does come in to be
> able to match based on IP address.

Openswan on 2.6 native IPsec, so no ipsec devices.
On the other firewalls I run firewalling is done on IP addresses.

> > For some reason I have failed to fathom, all the returning packets that
> > come in over any of the VPNs (there are 3), are INVALID not the
> > ESTABLISHED or RELATED they should be.
>
> 3 VPNs?  Where are they too?  What VPN technology and version there of
> are you using?  Where do these other VPNs connect to?  What subnets are
> on the other ends of the VPNs?

At the moment, yes 3, later to be 5. Our other office across the Pennines, my 
house. All openswan, all linux 2.6, all native ipsec. All VPNs terminate at 
90.1...1.67. 192.168.0.0/24, 192.168.22.0/24, 192.168.30.0/24.

> > Can anyone help?
>
> Can / will you please provide us with some more information to be able
> to help you?  Namely, all the subnets you are trying to connect together
> as well as your full IPTables rules.  You can easily get your IPTables
> rules for us via via iptables-save command.

Yep, I will provide as much information as I can.

Here's an example of what is blocked, incorrectly

192.168.136.203 ~ # wget -S -O /dev/null 192.168.0.210
....
Connecting to 192.168.0.210:80...

LFW ~ # tail -f /var/log/blah
.... RULE 35 -- REJECT IN=br0 OUT=bond2 
MAC=00:04:23:d7:f3:33:00:02:a5:60:0f:52:08:00 SRC=192.168.0.210 
DST=192.168.136.203 LEN=60 TOS=00 PREC=0x00 TTL=62 ID=0 DF PROTO=TCP SPT=80 
DPT=50067 SEQ=1894035948 ACK=1130147629 WINDOW=5792 ACK SYN URGP=0

(br0 is bond0 and bond4, bond0 connects to the internet, bond4 has nothing on 
it yet. bond2 is the 136.0/24 network)

192 168.0.210 does run a webserver. 192.168.136.0/24 has no restriction, at 
either end, to 192.168.0.0/24. Rule 35 boils down to:
{INPUT,FORWARD} -s 192.168.0.0/16 -d 192.168.136.0/24 -j REJECT
However, the very first rules added are:
$IPTABLES -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
And inbetween there are rules to allow packets in to 136.0/24 from some /24s 
in 0.0/16, like I can ssh from 0.228 to 136.203.

Obviously I could remove that REJECT rule, but the packets reach the end of 
the rule set and get DENY'd by the catch all at the end, as the packets 
coming back are INVALID, not RELATED to an existing connection like they 
should be.
Hmm, which suggests they aren't being tracked properly... And after some 
investigation traffic going to any of the VPN networks from 136.0/24 aren't 
being conntrack'd, whereas on the other firewalls I run they are (i.e. the 
VPN between 0.0/24 and 30.0/24). Is there any peculiar about conntrack'ing 
packets over/out a bridge?

-- 
Mike Williams

