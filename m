From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DNAT question
Date: Mon, 14 Jun 2004 15:51:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406141551.28214.Antony@Soft-Solutions.co.uk>
References: <519AD2BA94FC6E4DB5DE078B2E37CB10A37999@PDBEX01E.pdb.fsc.net>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <519AD2BA94FC6E4DB5DE078B2E37CB10A37999@PDBEX01E.pdb.fsc.net>
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

On Monday 14 June 2004 3:35 pm, Arnauts, Bert wrote:

> Hello all,
>
> I want to DNAT some machines in another subnet.
> The target machines have ip's like 11.0.0.x/24
>
> My available lan ip's are 172.239.239.x/27 (255.255.255.224)
>
> These are my rules. Wich are apparently not working.

How are you trying to test the rules?   What tells you they're not working?

Where are you testing from?

> I created virtual interfaces on eth1, one for each DNAT'ed ip.

Can you ping one of those addresses fom a machine directly connected to eth1, 
qand then check the arp cache (arp -an under Linux) to be sure that the IP / 
MAC address link is working correctly?

> What am I missing ? Forget about normal tables stuff, I only want this
> machine to do DNAT.

What does "iptables -L -t nat -nvx" show you for the packet / byte counters?   
Does it look like netfilter thinks it's doing any NAT?

> INET_IP="172.25.239.208"
> INET_IFACE="eth1"
> INET_BROADCAST="172.25.239.223"
> LAN_IP="11.0.0.1"
> LAN_IP_RANGE="11.0.0.0/24"
> LAN_IFACE="eth0"
> LO_IFACE="lo"
> LO_IP="127.0.0.1"
> IPTABLES="/sbin/iptables"
> echo "1" > /proc/sys/net/ipv4/ip_forward
> $IPTABLES --flush
> $IPTABLES --table nat --flush
> $IPTABLES --delete-chain
> $IPTABLES --table nat --delete-chain
> $IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source
> $INET_IP
> $IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
> $IPTABLES -t nat -A PREROUTING -d 172.25.239.220/255.255.255.224 -j DNAT
> --to 11.0.0.9

Try $IPTABLES -t nat -A PREROUTING -d 172.25.239.220/27 -j DNAT --to 11.0.0.9 
instead of the above netmask.

Regards,

Antony.

-- 
If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.

                                                     Please reply to the list;
                                                           please don't CC me.


