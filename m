From: "Krishna" <Krishna_shekhar@vsnl.net>
Subject: Redirect Rule for PPP users!!
Date: Fri, 27 Sep 2002 14:07:36 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001501c26601$28d45640$2900a8c0@spectranet.com>
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

Hi,
      I want to redirect packet from the ppp interface. I made rules in the
auth-up script

     /sbin/iptables -A INPUT -p udp -i $1 -d 0.0.0.0/0 --dport 53 -j
REDIRECT --to-ports 3128
     /sbin/iptables -A INPUT -p tcp -i $1 -d 0.0.0.0/0 --dport 53 -j
REDIRECT --to-ports 3128
     /sbin/iptables -A INPUT -p tcp -i $1 -d 0.0.0.0/0 --dport 80 -j
REDIRECT --to-ports 3128

But they don't work. Here $1 is the interface through which the ppp users
are logging.


regards
Krishna

Krishna Shekhar
Network Administrator
Wiplash Wireless


