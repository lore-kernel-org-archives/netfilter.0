From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Internal ip exiting network on firewall external nic despight rule
Date: Fri, 20 Sep 2002 23:43:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020920224321.VUFI295.mta06-svc.ntlworld.com@there>
References: <000001c260f0$e8e7fb50$0801a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c260f0$e8e7fb50$0801a8c0@s3ac>
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

On Friday 20 September 2002 10:58 pm, Rowan Reid wrote:

> > The INPUT chain is for packets addressed to the firewall itself.
> > The FORWARD chain is for packets going through the firewall
> > to some other machine.
> >
> > Destination NAT is performed in the PREROUTING chain, which comes
> > before either INPUT or FORWARD, therefore it is the "real" destination
> > which determines whether a packet traverses the INPUT or the FORWARD
> > chain.
>
> Just when I thought I understood. So returning masqaraded traffic hits
> the input rule set no ?

No :-)

> Then gets routed through POSTROUTING

No :-)

> is it then routed to the forward ruleset, or is it just sent out.

Okay - this is how it works:

The *original* packet (the first one) in what is going to be a natted 
connection gets to the firewall, enters the PREROUTING chain, and the 
destination address gets changed.   The packet then goes on to the FORWARD 
chain (where it might get blocked, but in this example is allowed through), 
goes on further to the POSTROUTING chain, where nothing happens to it in our 
example, and it then exits the machine and goes to the real destination.

Something which is not obvious happened in the middle of that - when the 
packet went through the PREROUTING chain and the destination address got 
changed, an entry got placed in the connection tracking table to say where 
the packet came from and where it was going to, so that reply packets (which 
have the source & destination addresses the other way round) will get 
recognised when they come back through the firewall.....

So, sometime a little later on, a reply packet comes back.   Immediately it 
gets to the PREROUTING chain (before it traverses any rules) it gets 
recognised as a reply packet to an existing connection, and it simply 
bypasses the nat rules in the PREROUTING chain, goes through the normal rules 
in the FORWARD chain (hopefully gets matched by the first rule, which is for 
ESTABLISHED,RELATED packets), and then gets automagically reverse-natted 
instead of going through any rules you might have put in the POSTROUTING 
chain, so that the source address is now whatever the destination address of 
the first packet was.

Basically what this all means is:

1. You do not have to specify nat rules to process reply packets - the 
reverse of the rules you specified for the outgoing packets will 
automatically be applied.

2. You *cannot* specify nat rules to process reply packets - because they 
bypass the rules in the nat chains as soon as they are recognised as reply 
packets by the entry in the connection tracking table.

> What I'm realizing is to stop internal machines from accessing the external
> interface I need to put drop rule for all internal traffic on the FORWARD
> chain such as below ?

Correct.

The rules are quite simple:

1. The INPUT chain is *only* for packets which terminate on this machine.

2. The FORWARD chain is *only* for packets which are going through this 
machine.

3. The OUTPUT chain is *only* for packets which originate on this machine.

If you have seen diagrams of the way ipchains used to work, where some 
packets would go through all three of the INPUT, FORWARD and OUTPUT chains, 
then forget it - iptables does not work like that.

If you have not seen those diagrams, then do not be distracted by the INPUT 
chain or think "packets have to come IN to this machine even if they're then 
going to go OUT again" - the rule is that packets which go *through* a 
netfilter box traverse the FORWARD chain but do not traverse either the INPUT 
or the OUTPUT chains.

> Then figure out why exactly my local net machines are accessing my
> external IP to exit the net. This confuses me because all these machines
> are setup with the gateway being the internal ip
> (192.168.1.1/255.255.255.0) as the gateway so these machines shouldn't
> even know my external ip/interface exists.

You have physically plugged the internal and external interfaces of your 
firewall into the same switch / hub, therefore the machines on your internal 
network are plugged into your external interface, and unfortunately Linux 
responds to ARP requests in ways you might not expect....  (I think Tom 
Eastep mentioned this in an earlier posting).

Connect your external interface to your Internet link, using a switch / hub 
which also has any other machines with true (non-nat) public IPs.

Connect your internal interface to your internal LAN, using another switch / 
hub which is not connected to anything with a true public IP.

Then let us know if you have any further problems.

Antony.

-- 

There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.

