From: Alex Satrapa <alex@lintelsys.com.au>
Subject: Re: How to block sending mail from local network.
Date: Mon, 09 Feb 2004 08:42:05 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4026AD2D.7060305@lintelsys.com.au>
References: <4024C335.7080705@ergolight-sw.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4024C335.7080705@ergolight-sw.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

David Harel wrote:
> $IPTABLES -A INPUT -p ALL -i $LAN_IFACE -s $LAN_IP_RANGE -j ACCEPT

This only means that all machines on the local network can make connections to this machine itself.

If this machine is a router, and you want it to block outgoing SMTP connections, first identify which machine on your network is the authorised SMTP relay. If it's not the firewall itself, then you need to add a rule to accept forwarded packets for the SMTP relay, and block everyone else.  You'll need two rules like this:

$IPTABLES -I FORWARD -p TCP -i $LAN_IFACE -s $SMTP_RELAY -j ACCEPT
$IPTABLES -I FORWARD -p TCP -i $LAN_IFACE -s $LAN_IP_RANGE -j REJECT --reject-with icmp-net-prohibited

I use "icmp-net-prohibited" since if someone is monitoring SMTP attempts, they'll see the ICMP packet telling them exactly why they can't make the connection. An alternative like -j DROP would mean the SMTP connections disappear into nothingness, and give the troubleshooter no hints as to what the problem is.

> I tried a command:
> $IPTABLES -A OUTPUT -p TCP -i $LAN_IFACE -s $LAN_IP_RANGE --dport smtp 
> -j DROP
> but it did nothing.

This only prohibits this machine from making SMTP connections to other hosts on the local network.

The INPUT chain is used for connections to this host, OUTPUT is used for connections from this host, while FORWARD is used for packets being forwarded by this host on behalf of other machines.

HTH
Alex Satrapa


