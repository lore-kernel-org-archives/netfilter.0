From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Single IP firewall help...
Date: Thu, 12 Sep 2002 19:26:01 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209121911230.9290-100000@dns.toxicfilms.tv>
References: <3D80B62C.7060807@canada.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D80B62C.7060807@canada.com>
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
To: Chris Poupart <cpoupart@canada.com>
Cc: netfilter@lists.netfilter.org

> Assuming that the IP address was (we will give a nice private one)
> 192.168.0.10 does anyone have any ideas?
Assuming the setup is this:

Internet -- Router/NAT -- Web Server

And assuming your (S/D)NAT is configured properly.

You do on your router:
iptables -P FORWARD DROP
iptables -A FORWARD -d 192.168.0.0/24 -m state --state ESTABLISHED,RELATED \
 -j ACCEPT
iptables -A FORWARD -d 192.168.0.10 -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -d 192.168.0.10 -p tcp --dport 443 -j ACCEPT
iptables -A FORWARD -d 192.168.0.10 -p tcp --dport 22 -j ACCEPT

If you want to ping the machine.
iptables -A FORWARD -d 192.168.0.10 -p icmp --icmp-type 8/0 -j ACCEPT

That would be all.

Note: Instead these simple -p tcp 80 -j ACCEPT rules, you may try:
-p tcp --dport 80 --syn -m state --state NEW -j ACCEPT

or even:
-p tcp --dport 80 --syn -m state --state NEW -m length --length 40:68 \
  -j ACCEPT

Which are more strict on the initiating packets.


If my assumptions are wrong please say so.

Regards,
Maciej Soltysiak



