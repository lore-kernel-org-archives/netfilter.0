From: "Remus" <rmocius@auste.elnet.lt>
Subject: DROP command
Date: Thu, 3 Jul 2003 21:43:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005d01c341a3$d335f7f0$6e69690a@rimas>
References: <200307031501.00905.sysadmin_lists@iwa-solutions.com>
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

Hi folks,

I have a Linux box firewall (iptables 1.2.7a) with NAT/MASQUERADING.
How I can block all local network access to my firewall excluding some local
IP addresses?
I tried these command but it doesn't work:

/usr/local/sbin/iptables -A INPUT -i eth2 -s 10.105.105.0/24 -j DROP
/usr/local/sbin/iptables -A INPUT -i eth2 -s 10.105.105.20 -j ACCEPT

Thank you in advance

Remus




