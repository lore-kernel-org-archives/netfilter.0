From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Iptables logging only output packets
Date: Tue, 04 Nov 2003 10:09:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FA7C122.2000908@Loudoun-Fairfax.com>
References: <20031104142344.43912.qmail@web41408.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031104142344.43912.qmail@web41408.mail.yahoo.com>
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

James Martin wrote:

>Hi. My problem with Iptables is that it logs only
>outgoing packet, and not incoming ones.
>
>It is set up in a very simple way, more to do packet
>logging/capturing than to do do real firewalling. Its
>main purpose is a didactic one. 
>etho is connected to the Internet, and eth2 goes to
>the LAN (for some strange reasons the additional
>pcmcia ethernet card on the Toshiba laptop is
>recognized as eth1 and not as eth1, but this is fine).
>
>Following is the Iptables script:
>
>clear
>echo "1" > /proc/sys/net/ipv4/ip_forward
>/sbin/iptables -F
>/sbin/iptables --delete-chain 
>/sbin/iptables -t nat --delete-chain
>/sbin/iptables -t mangle --delete-chain
>  
>

You're not actually flushing the nat and mangle tables, you're only 
deleting user defined chains. This is better:

iptables="/sbin/iptables"

# Clear all previous chains.
$iptables -t filter -F
$iptables -t nat -F
$iptables -t mangle -F
$iptables -X

>/sbin/iptables -N entrata
>/sbin/iptables -N uscita
>/sbin/iptables -P INPUT  ACCEPT
>/sbin/iptables -P OUTPUT ACCEPT
>/sbin/iptables -P FORWARD ACCEPT
>/sbin/iptables -t nat -A POSTROUTING -o eth0 -j
>MASQUERADE
>/sbin/iptables -A FORWARD -i etho -o eth2 -j entrata 
>/sbin/iptables -A FORWARD -i eth2 -o eth0 -j uscita 
>/sbin/iptables -A entrata -j LOG --log-prefix
>"Firewall Entr: " --log-level "DEBUG" 
>/sbin/iptables -A uscita -j LOG --log-prefix "Firewall
>Usc: " --log-level "DEBUG" 
>
>What I get is log entries only with prefix "Firewall
>Usc: ", that is outgoing, and not even one packet with
>"Firewall Entr: " prefix.
>
>Any idea of what I am doing wrong ?
>
>Thanks,
>
>James
>
>
>  
>

Not having a valid eth1 interface seems odd. What does ifconfig give you?

Jeff


