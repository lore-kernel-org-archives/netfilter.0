From: "Sadus ." <sadus@swiftbin.net>
Subject: DNATing Windows File Sharing
Date: Mon, 18 Jul 2005 11:15:36 +0300
Message-ID: <1121674536.1554.16.camel@sadusbox.hostname>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hello,
I would like to enable the right ports and DNAT the requests for File
Sharing on a internal windows box. The win2k3 has Active Directory
enabled and i want users to type \\domainname.com which will popup a
user/pass dialog and let them access the file server.

I did the following, but it doesn't seem to work:
iptables -t nat -A PREROUTING -j DNAT -i eth0 -p tcp --dport 139 --to
192.168.1.2:139 
assuming "139" is NetBios

thanks
-- 
Sadus . <sadus@swiftbin.net>
Swiftbin.net


