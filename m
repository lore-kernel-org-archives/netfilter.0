From: Glen Lee Edwards <glen@holiness.ch>
Subject: DNAT based on domain name instead of IP address
Date: 28 Jan 2004 17:22:33 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075332153.25415.98.camel@child-of-god.holiness.ch>
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

I have several domains that use the same IP address.  Can I DNAT them to
different servers based on domain name instead of IP address using
iptables?  I've tried the following, but it isn't working:

iptables -t nat -A PREROUTING -p tcp -d 1st.domain.com --dport 80 -j
DNAT --to-destination 192.168.1.12:80

iptables -t nat -A PREROUTING -p tcp -d 2nd.domain.com --dport 80 -j
DNAT --to-destination 192.168.1.13:80

Everything is being forwarded to 192.168.1.12 no matter which domain is
used.  It appears that the domains are first being translated into the
IP address, which is used instead.

Glen


