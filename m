From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: FORWARD question
Date: Thu, 20 Nov 2003 20:51:06 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311202051.hAKKp8723558@onyx.rockstone.co.uk>
References: <20031120202717.74020.qmail@web40803.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031120202717.74020.qmail@web40803.mail.yahoo.com>
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

On Thursday 20 November 2003 8:27 pm, Nick wrote:

> Hi everyone,
>
> I have a question about PREROUTING and FORWARD.
>
> I use those rules(amongst others) to reach the FTP
> server on the LAN:
>
>  $IPTABLES -t nat -A PREROUTING -p tcp -d $INET_IP -i
> ppp0 --dport 21 -j DNAT --to $FTPSRVIP
>
>  $IPTABLES -A FORWARD -i ppp0 -o $LAN_IFACE -p tcp -d
> $FTPSRVIP--dport 21 -m state --state NEW -j ACCEPT
> $IPTABLES -A FORWARD -i ppp0 -o $LAN_IFACE -p tcp -d
> $FTPSRVIP--dport 20 -j ACCEPT
> $IPTABLES -A FORWARD -i ppp0 -o $LAN_IFACE -p tcp -d
> $FTPSRVIP--dport 1024:65535 --sport 1024:65535 -j
> ACCEPT
>
> Does this mean that all traffic coming from the
> internet for ports 1024:65535 will be forwarded
> towards the FTP server ports 1024:65535 ?

Yes.   If you have public (routable) IP addresses on your LAN (unlikely, but 
you didn't say) this will allow a large amount of port scanning to be 
successful.   If not, then packets can't be addressed to your LAN machines 
anyway, so the final FORWARD rule will not do anything.

> What about traffic for ports 1024:65535 that should go
> to other clients on the LAN ? Is it going to be
> forwarded to the FTP server as well ?

No, because you are only performing NAT on packets sent to TCP port 21.

Packets sent to any other port will not be NATted, and will continue to their 
original destination, assuming this was a routable address in the first place.

> If yes, how could I forward only FTP traffic to the FTP server ?

I really would recommend that you use connection tracking and the NAT helpers:

1. Compile your kernel, or load the modules (depending on personal 
preference) for FTP conntrack and FTP nat.

2. Use the following rules:

iptables -A PREROUTING -t nat -d a.b.c.d -p tcp --dport 21 -j DNAT --to 
w.x.y.z

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -d w.x.y.z -p tcp --dport 21 -j ACCEPT

Where a.b.c.d is your external (public) IP address, and w.x.y.z is the 
internal (private) IP address of your FTP server.

Connection tracking means no need to worry about port 20, and no need to open 
up all the high ports to people on the outside.

Regards,

Antony.

-- 

The only problem with the Universe as a platform, though, is that it is 
currently running someone else's program.

 - Ken Karakotsios, author of SimLife
                                                     Please reply to the list;
                                                           please don't CC me.

