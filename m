From: k n <kn57@yahoo.com>
Subject: iptables UDP problem
Date: Sat, 1 Feb 2003 16:11:50 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030202001150.26421.qmail@web41303.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I'm using iptables on RedHat 8 with the rules listed
below. When scanned from outside the TCP port appear
as filtered; however, the UDP port is still open.

$ip0  is my external IP address.

Am I doing something wrong?

-------------
/sbin/iptables -A INPUT -i lo -p all -j ACCEPT
/sbin/iptables -A INPUT  -p tcp -d $ip0 --dport 53  -j
DROP
/sbin/iptables -A INPUT  -p udp -d $ip0 --dport 53  -j DROP

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com

