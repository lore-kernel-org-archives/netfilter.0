From: ads nat <adsnat@yahoo.com>
Subject: Iptables Error 'Memory allocation problem'
Date: Tue, 16 Nov 2004 06:55:52 -0800 (PST)
Message-ID: <20041116145552.48507.qmail@web60408.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
I am getting following on this server.

#######
[root@xxx root]# iptables -t nat -A PREROUTING -s
192.168.0.0/24 -d xxx.xxx.xxx.xxx -i eth1 -p tcp -m
tcp --dport 3128 -j DNAT --to-destination 10.0.0.2:80
iptables v1.2.7a: can't initialize iptables table
`nat': Memory allocation problem
#########

But on other servers with exactly similar
configuration and setup, I have not faced this error.

Any clue to solve this problem.
Thanks

Perhaps iptables or your kernel needs to be upgraded.



		
__________________________________ 
Do you Yahoo!? 
Meet the all-new My Yahoo! - Try it today! 
http://my.yahoo.com 
 


