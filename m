From: "Preston Wade" <Preston_Wade@hilton.com>
Subject: RE: Should i be worried?
Date: Tue, 28 Jan 2003 23:11:27 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0B2759D401C1D211ACA500805FFE2C3F0860BE24@cmxserv3.hilton.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Actually a rule will not pass through both the INPUT chain and the FORWARD
chain.  The INPUT chain will be consulted if the packet is destined for the
firewall itself.  If the packet is to be routed through the firewall then
the FORWARD chain will be used.

Thanks,
Preston

-----Original Message-----
From: Athan [mailto:netfilter@miggy.org] 
Sent: Tuesday, January 28, 2003 5:24 PM
To: Erik Ahlner
Cc: netfilter@lists.netfilter.org
Subject: Re: Should i be worried?

On Tue, Jan 28, 2003 at 11:29:36PM +0100, Erik Ahlner wrote:
> Hello!
> 
> I just happened to do a dmesg, and got this output:
> 
> IN=eth0 OUT=eth0 SRC=192.168.0.186 DST=130.236.230.9 LEN=74 TOS=0x00
> PREC=0x00 TTL=127 ID=14459 PROTO=UDP SPT=137 DPT=53 LEN=54
> IN=eth0 OUT=eth0 SRC=192.168.0.186 DST=130.236.230.9 LEN=74 TOS=0x00
> PREC=0x00 TTL=127 ID=14715 PROTO=UDP SPT=137 DPT=53 LEN=54
> IN=eth0 OUT=eth0 SRC=192.168.0.88 DST=217.209.28.135 LEN=48 TOS=0x00
> PREC=0x00 TTL=127 ID=37469 DF PROTO=TCP SPT=2418 DPT=80 WINDOW=16384
> RES=0x00 SYN URGP=0
> 
> 
> As you can see, i get some message about traffic from 192.168.0.186 and
.88
> .. these two computers are NOT in my home network, so i guess that someone
> has named his computers like that on the university network, even though
the
> university network has 130.236.x.x.
> Is this a problem for me?
> And what does this output actually mean?
> Has someone used my computer as a router?
> If they have, how is that possible?
> This is what my iptable looks like:
> 
> $IPTABLES -P INPUT ACCEPT
> $IPTABLES -F INPUT
> $IPTABLES -P OUTPUT ACCEPT
> $IPTABLES -F OUTPUT
> $IPTABLES -P FORWARD DROP
> $IPTABLES -F FORWARD
> $IPTABLES -t nat -F
> 
> $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT
> $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
> $IPTABLES -A FORWARD -j LOG
                       ^^^^^^
This is what causes the messages in dmesg.  You probably want to change
the INPUT rule below to be a FORWARD one.  Make sure to put it ABOVE the
two other FORWARD rules above, otherwise they'll get the packet first
and just pass it anyway.

> $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
> $IPTABLES -A INPUT -s 192.168.0.0/24 -i eth0 -j DROP

  Actually, just go find a DECENT fw script and use that ;).

HTH,

-Ath
-- 
- Athanasius = Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME


