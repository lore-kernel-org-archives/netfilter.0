From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: udp port 135
Date: Thu, 14 Aug 2003 09:16:36 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0308140908540.11099@dns.toxicfilms.tv>
References: <3F3B0EF9.5040002@belfordhk.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F3B0EF9.5040002@belfordhk.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cc <cc@belfordhk.com>
Cc: Netfilter Group <netfilter@lists.netfilter.org>

> iptables -A INPUT -i $EXT_DEV -p tcp -d $EXT_DEV --dport 135 -j DROP
> iptables -A INPUT -i $EXT_DEV -p udp -d $EXT_DEV --dport 135 -j DROP
>
> iptables -A OUTPUT -o $EXT_DEV -p tcp -d $EXT_DEV --dport 135 -j DROP
> iptables -A OUTPUT -o $EXT_DEV -p udp -d $EXT_DEV --dport 135 -j DROP
These are fine to block it.

But you might consider using -j REJECT for UDP, because it is the nature
of UDP that you do not get confirmation of received packets (as with TCP),
you only get confirmation of closed ports (with ICMP dest-unreach).
So by using DROP on udp you are making it look as it is really open.
By using DROP on tcp you are making sure the scanner that you actually
_are_ filtering.

> nmap -sT -P0 -p 135 <ext ip>,
>
> I get a (135/tcp filtered).  (Good news?)
Good. nmap says filtered, when you can ping a host, but do not
get any replies for TCP packets. (when you use DROP).
nmap says closed when it receives TCP-RST for TCP packets or ICMP
dest-unreach for UDP packets.
When you are not giving responses, nmap knows there's something going on:)
Anyway, there are two schools on that.
One says to DROP, to allow as little packet flow as possible, and data
leakage (especially OS fingerprinting)
One says to REJECT with RST for TCP and ICMP for UDP, to go along with the
RFCs.

> But with :
>
> nmap -sU -P0 -p 135 <ext ip>,
>
> I get a (135/udp open).
>
> Can someone explain to me what I'm doing wrong or what
> information I have forgotten?    Does it even matter
> if the udp 135 port is open?

>  I'm currently in the process of closing all unneccessary ports
> (be it tcp or udp).
That's standard security procedure.

> Thanks.
Regards,
Maciej


