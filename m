From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Port Forwarding
Date: Tue, 28 Oct 2003 11:54:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031028134517.6E60B1B9B8@smtp.ttp.nl>
References: <3F9D995D.8080709@phxrising.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F9D995D.8080709@phxrising.com>
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

> I am tring to do a simple port forwarding from the Internet 
> to a mcahine on my LAN. This has proven IMPOSSIBE! No matter 

Sure it's possible. But you didn't tell us what you have already done !

For http (make sure your routing tables are correct) :
----------------
if_inet="eth0"
if_lan="eth1"
ip_webserver="192.168.1.100"

echo 0 > /proc/sys/net/ipv4/ip_forward

iptables -P FORWARD DROP
iptables -A FORWARD -m state --state RELATED,ESTABLISHED \
  -j ACCEPT
iptables -A FORWARD -i $if_inet -o $if_lan -p tcp --dport 80 \
  -j ACCEPT
iptables -t nat -A PREROUTING -i if_inet -p tcp --dport 80 \
  -j DNAT --to-destination $ip_webserver

echo 1 > /proc/sys/net/ipv4/ip_forward
----------------


Gr,
Rob


