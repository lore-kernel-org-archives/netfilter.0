From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: ftp connection tracking on multiple ports
Date: Thu, 28 Oct 2004 12:18:24 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1403218a0410280318a6ed55b@mail.gmail.com>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Dear all,

I have a server that runs FTP on two ports, port 21 and port 45 (for
strange reasons)
Now, i want conntrack to track the connections of both ports and their
data ports !!

I did that in my firewall script
/sbin/modprobe ip_conntrack_ftp ports=21,45
$IPTABLES -A linweb_chain -p tcp -m multiport --destination-port
80,21,45 -j ACCEPT

Is that all I need ??

-- 
Mohamed Eldesoky
www.eldesoky.net
RHCE

