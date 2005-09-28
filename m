From: Justinas =?iso-8859-2?Q?Bed=BEinskas?= <justasb@patikimi.lt>
Subject: problem with expire patch
Date: Wed, 28 Sep 2005 12:48:01 +0300
Message-ID: <1127900881.15747.4.camel@biesas>
Reply-To: justasb@patikimi.lt
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have compiled 2.6.12 kernel with iptables expire support, I also have
recompiled iptables with expire support. 
And I encounter a strange problem with time

xxx:/home/digis#modprobe ipt_expire
xxx:/home/digis#/usr/local/sbin/iptables -t nat -A POSTROUTING -m expire
--expiration +30 -o eth1 -j MASQUERADE

Then I wait more than 30 seconds....

xxx:/home/digis#/usr/local/sbin/iptables -t nat -L
Chain PREROUTING (policy ACCEPT)


Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
MASQUERADE  all  --  anywhere             anywhere            expires in
-2s


and it keeps counting...
What I am doing wrong?





-- 
Justinas Bedzinskas <justasb@patikimi.lt>
"Patikimi Sprendimai"


