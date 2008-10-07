From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: IP forwarding with MASQUERADE
Date: Tue, 07 Oct 2008 13:15:07 -0500
Message-ID: <48EBA72B.80306@riverviewtech.net>
References: <c88e466f0810030507x7e601d09q1034c7cc18be9b57@mail.gmail.com>	 <48E62AD3.9060001@riverviewtech.net> <c88e466f0810070858o18687b09yabd9cc7e5a46391@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c88e466f0810070858o18687b09yabd9cc7e5a46391@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/07/08 10:58, Michel Benoit wrote:
> Thanks for the quick reply.  I'm still stumped by this problem.

You are welcome.

> Here is the combined output from the netfilter LOG and tcpdump on ppp0 
> when i ping 10.0.0.1 from (2):
> 
> fwd:IN=eth0 OUT=ppp0 SRC=192.168.0.183 DST=10.0.0.1 LEN=84 TOS=0x00 
> PREC=0x00 TTL=63 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=2
> 
> msk:IN= OUT=ppp0 SRC=192.168.0.183 DST=10.0.0.1 LEN=84 TOS=0x00 
> PREC=0x00 TTL=63 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=259 SEQ
> 
> 17:36:59.835282 IP 10.146.92.12 > mail1.telia.com: ICMP echo request, id 
> 259, seq 1, length 64

Am I correct in presuming that "mail1.telia.com" is 10.0.0.1?

> in:IN=ppp0 OUT= MAC= SRC=10.0.0.1 DST=10.146.92.12 LEN=84 TOS=0x08 
> PREC=0x80 TTL=57 ID=33913 PROTO=ICMP TYPE=0 CODE=0 ID=259
> 
> 17:37:00.597894 IP mail1.telia.com > 10.146.92.12: ICMP echo reply, id 
> 259, seq 1, length 64

Hum...

> On the first line we see the LOG output from the FORWARD rule from eth0 
> to ppp0 catch the packet.
> 
> In the 2nd line we see that the MASQUERADE rule is taking effect and 
> swaping the source address.
> 
> We then see in the 3rd line the tcpdump output where the ping packet 
> gets sent to the destination machine.

*nod*

> The two last lines show that the ping reply is being received and that 
> for some reason it is not being DE-MASQUERADED because it ends up being 
> processed by the INPUT LOG rule.  The correct behaviour would have been 
> to swap back the destination adress and apply the FORWARD rule to 
> forward the ping reply to 192.168.0.183.

Agreed.

> I setup the iptables after the ppp0 interface is up.

Ok.  I just had to double check.

> Where can I go from here to debug the problem? Can I be missing a CONFIG 
> option in linux?  Attached is my linux .config file.

I'm not sure what to tell you to do.  I've never had connection tracking 
fail on me like that.

> I've set CONFIG_NETFILTER_DEBUG to y but I don't see any extra debug 
> info.  Is there something else that I need to do to get the netfilter 
> code to give me some more information?

Not that I know of.

> What could be causing the de-MASQUERADE operation to fail when the 
> MASQUERADE operation succeeds?  Is there any way to look at the 
> masquerade tables or whatever place netfilter saves its masqueraded 
> address+connections information?

I believe the connections that connection tracking is keeping track of 
are listed somewhere in /proc, but I don't know where off hand.

> Can the combination of iptables v1.3.8 and linux kernel v2.6.25 be out 
> of synch or corrupted?

I would not think.  Usually if you have a mis-match between the iptables 
binary and the kernel you will get an error indicating such, not a weird 
mis-behavior like you are seeing.

> My root file system is read-only?  Could that cause problems?  Does the 
> netfilter code generate any files in the root filesystem?

No, that should not make a difference.  Technically you can run a router 
in run level 0 with all file systems mounted read only and never have a 
problem.

The only thing that comes to mind is that there is something stale in 
your IPTables rules in memory.  Will you please do an iptables-save and 
show us the output?



Grant. . . .
