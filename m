From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: Translating between local and global IP address
Date: Wed, 22 Jan 2003 09:28:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019AF6@hslex01.hslbz.local>
References: <FD8F124A387AD6119F7900A0D218B321562093@hslex01.hslbz.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B321562093@hslex01.hslbz.local>
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

>                     internet
>                        |
>                       eth0
>                   GATEWAY (Linux)
>                       eth1
>                        |
>                  COMPUTER (Windows)
> 
> COMPUTER has a local IP address ($IN), but I'd like to mangle 
> packets going through GATEWAY so COMPUTER appears to have 
> another IP address
> ($OUT) on the internet.  It seems I've had some success with this:
> 
>   iptables -t nat -A POSTROUTING -o eth0 -s $IN  -j SNAT 
> --to-source $OUT
>   iptables -t nat -A PREROUTING  -i eth0 -d $OUT -j DNAT 
> --to-destination $IN
> 
> And to fool GATEWAY into accepting packets for $OUT, I've done this:
> 
>   ifconfig eth0:1 $OUT
> 
> However, it doesn't seem to work when trying to play a 
> network game on COMPUTER.  It times out trying to connect to 
> another machine on the internet.  It probably uses UDP packets.

You are not specifying any protocol, so protocol is any, not just tcp.
You should probably do this :

# Close your gateway.
iptables -P INPUT DROP
iptables -P FORWARD DROP

# Accept forwarding and related.
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -s $IN -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -s $IN -j SNAT --to-source $OUT

And maybe you need a helper for your network game. You didn't mention
"the name of the game".
Btw, mangling is something else. You are NAT-ing.

I don't know what you are trying to achieve with "ifconfig eth0:1 $OUT"
? You can't match eth0:1, but you can match eth0. Let's say you don't do
this and eth0 has $OUT.
When SNAT-ing, the packets will appear to be coming from eth0 on the
gateway with IP address $OUT which is your internet IP address. $OUT
must be your internet IP address otherwise the reply packet will not be
sent back to you.


Rob


