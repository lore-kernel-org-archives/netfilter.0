From: Jasbir Khehra <jasbir.k@gmail.com>
Subject: Re: drop by mac address, but only to packets to other interface
Date: Wed, 08 Nov 2006 13:22:31 +0530
Message-ID: <45518CBF.2010907@gmail.com>
References: <91ff8a190611071639s27882dfatdc39cdcb8f222e5d@mail.gmail.com>
Reply-To: jasbir.k@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <91ff8a190611071639s27882dfatdc39cdcb8f222e5d@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Branko Kokanovic <branko.kokanovic@gmail.com>
Cc: netfilter@lists.netfilter.org

Branko Kokanovic wrote:

> hi all,
> I'm pretty layman on this topic. I have two interfaces, one in local
> network (192.168.0.0) and other to isp. Now, I want to block certain
> mac address from local network from reaching internet, but i want to
> allow him to reach server (for samba, etc...). I tried several
> commands, read on manuals, but all I can get is either all or none
> (either that mac address have internet access and server access, or he
> can't get to internet and server at all ("server" is at 192.168.0.1))
>
> I hope I said all relevant details, if not, ask me and I'll try to tell
>
> Here is my script I use, if that can help a bit:
> ................
> $IPTABLES -P INPUT ACCEPT
> $IPTABLES -F INPUT
> $IPTABLES -P OUTPUT ACCEPT
> $IPTABLES -F OUTPUT
> $IPTABLES -P FORWARD DROP
> $IPTABLES -F FORWARD
> $IPTABLES -t nat -F
>
> $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
> $IPTABLES -A FORWARD -j LOG
>
> $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
>
>
> # I tried this
> #iptables -A PREROUTING -t nat -p ALL -m mac --mac-source
> 00:15:F2:33:B5:92 -j DROP

No need for this rule .This drops all packets both inbound for your 
server and outbound through your server to the Internet

> # and this
> #iptables -A FORWARD -p ALL -m mac --mac-source 00:15:F2:33:B5:92 -j DROP

The rule is correct  but it wont match any packets because packets 
matching this mac address are also matching the earlier "-i $INTIF -o 
$EXTIF -j ACCEPT" rule. Just be careful of the flow. Change "-A" to "-I"
HTH,
Jasbir.

>
>
> Thanks in advance, Branko Kokanovic
>
>


