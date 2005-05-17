From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Host blocking
Date: Tue, 17 May 2005 13:12:03 +0200
Message-ID: <4289D183.5010809@mnemon.de>
References: <003b01c55acb$841114a0$f00aa9c0@winxp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <003b01c55acb$841114a0$f00aa9c0@winxp>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Wennie V. Lagmay schrieb:
> Our ISP's Proxy server is proxy.ISP.net , our company's own proxy server
> is proxy.ourcompany.net. Our own proxy server has delay_pool but our ISP
> proxy server dont have. I want to control our client to use only our
> company proxy server. how can I block the proxy.ISP.net using IP tables
> so that every body can be force to use our compnay proxy server. (note
> that our company proxy server is connected to our ISP proxy server as
> cache_peer parent)

iptables -P FORWARD DROP
# From now on your clients can't connect to your ISPs proxy.
# Is a good idea for INPUT and may be OUTPUT too, imho.
#
# If you set IN|OUTPUT policy to DROP you need to allow
# connections to proxy.ourcompany.net explicitly and
# you need to allow lo traffic. E.g.:
iptables -A INPUT -i lo -j ACCEPT

# Allow traffic, that is already initialized.
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# You need to allow access to each service you offer like
# proxy, smtp, pop3,... e.g.
iptables -A INPUT -p tcp -s <netaddress/netmask> \
  -d <your_internal_proxy_ip> --dport <proxy_port> \
  --syn -j ACCEPT

[more services to allow]

# Only if OUTPUT policy is DROP or REJECT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# Access to your ISPs proxy:
iptables -A OUTPUT -p tcp -d <ip_of_isp_proxy> \
  --dport <proxy_port> --syn -j ACCEPT

[more stuff to allow]

# If you need ICP, allow it too. You should also allow
# at least ICMP "Destination unreachable"

There are many ways to Rome - this is the basic approach. Note, that
here are probaly some side effects. E.g. if your clients contact the
ISPs DNS, you have to allow that too, or set up an own DNS and allow
client access to your DNS and access from your DNS to ISP DNS.

For more details see "man iptables" and the excellent tutorial at

http://iptables-tutorial.frozentux.net/chunkyhtml/index.html

which is - imho - a Must_To_Read :)

HTH and have a nice time,

Joerg


