From: Jeffrey Forman <jforman@formanonline.com>
Subject: ip6tables and -m state
Date: Wed, 10 Dec 2003 22:06:33 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071115593.28281.4.camel@tribeca.formanonline.com>
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

i was wondering if there is a way to do connection tracking with
ip6tables as ipv4 iptables does? so for example, i want to do:
iptables -A INPUT -i eth0 -m state -state established,related -j ACCEPT

but with ipv6 and ip6tables. any idea? whether one rule or many..

thanks in advance,
jeff


