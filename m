From: Payal Rathod <payal-iptables@staticky.com>
Subject: a doubt about INPUT rule
Date: Thu, 14 Aug 2003 12:16:10 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030814064610.GA1701@linux.local>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
Why does this give an error,

# iptables -A INPUT -p all -s 0/0 -d 192.168.0.10 --dport 21 -j ACCEPT
iptables v1.2.7a: Unknown arg `--dport'
Try `iptables -h' or 'iptables --help' for more information.

and this,

# iptables -A INPUT -s 0/0 -d 192.168.0.10 --dport 21 -j ACCEPT
iptables v1.2.7a: Unknown arg `--dport'
Try `iptables -h' or 'iptables --help' for more information.

But this works,

# iptables -A INPUT -p tcp -s 0/0 -d 192.168.0.10 --dport 21 -j ACCEPT

Why does it not work without -p and even with -p tcp?

With warm regards,
-Payal



-- 
"Visit GNU/Linux Success Stories"
http://payal.staticky.com
Guest-Book Section Updated.

