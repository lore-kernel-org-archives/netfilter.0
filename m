From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: Bad Filter Set?
Date: Wed, 13 Nov 2002 01:31:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DD19D4F.8050703@fugmann.dhs.org>
References: <Pine.LNX.4.44.0211121629140.19945-100000@shortcircuit.dyndns.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dan Egli <dan@shortcircuit.dyndns.org>
Cc: netfilter@lists.netfilter.org

Dan Egli wrote:
> Ok. This is true, so let me clarify. the INTERNAL net should have access 
> to all those. The EXTERNAL side needs:
> SMTP, FTP, TELNET, SSH, 4000 & 5000
Ok. I have modified the sctipt to accomodate this.
--------------------------------

# Set default policies.
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP

# Flush all tables.
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD
iptables -t NAT -F PREROUTING
iptables -t NAT -F POSTROUTING
iptables -t NAT -F OUTPUT

iptables -A INPUT -p tcp -m multiport --dports \
     smtp,ftp,telnet,ssh,4000,5000
iptables -A INPUT -p tcp -i eth0 -m multiport --dports \
    telnet,domain,nntp,ntp,printer,pop3,imap,http,https \
    -j ACCEPT
iptables -A INPUT -p udp -i eth0 -m multiport --dports \
    domain,ntp,route  -j ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -j LOG

iptables -A FORWARD -i eth0 -j ACCEPT
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -j LOG

iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 5000 \
    -j DNAT --to-destination 192.168.0.5:5000

iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to-source 64.122.31.38

echo 1 > /proc/sys/net/ipv4/ip_forward
-------------------------

Regards
Anders Fugmann


