From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: [Q] Some newbie questions.....
Date: Fri, 9 Apr 2004 09:26:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003301c41e04$0aa9d020$1202a8c0@admin>
References: <052501c41deb$9c6dd420$3228a8c0@homer>
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
To: netfilter@lists.netfilter.org

> I have the following setup: CAPS = Device / Machine
>
> - ROUTER: WAN Address: xxxxxxxxx LAN Address: 192.168.40.1
> - IPTABLES: 1 LAN Interface 192.168.40.5 (Gateway: 192.168.40.1)
> - PROXY: 1 LAN Interface 192.168.40.10 (Gateway: 192.168.40.5)

These only have 1 interface each ?
Are you connecting all the machines (clients too) to a hub or switch ?

> I have a number of other machines also on the 192.168.40/24 network who
all
> have their GW set to 192.168.40.5. What I want NETFILTER to do is the
> following:
>
> - Have a transparent proxy such that any port 80 connections from
> these machines get processed by PROXY on port 3128

If iptables is not doing NAT, then what is it for with 1 NIC ?
You could as well set the default gateway of the workstations to
192.168.40.1 and configure the webbrowsers to use the proxy at
192.168.40.10. So you can skip the iptables box.

Anyway, not sure if it will work but you can try this :

iptables -P FORWARD DROP
iptables -A FORWARD -m state --state RELATED,ESTABLISHED \
  -j ACCEPT
iptables -A FORWARD -s 192.168.40.0/24 -d 192.168.40.10 -p tcp \
  --dport 3128 -j ACCEPT
iptables -t nat -A PREROUTING -s 192.168.40.0/24 -p tcp \
  --dport 80 -j DNAT --to-destination 192.168.40.10:3128
echo 1 > /proc/sys/net/ipv4/ip_forward

> - Allow all established connections from these machines to be allowed
> out via 192.168.40.1 otherwise disallowed
> - IPTABLES to do no NAT as that is already being done by ROUTER

Don't use any SNAT/MASQUERADE rules. Then it won't NAT.


Gr,
Rob


