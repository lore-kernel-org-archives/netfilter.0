From: Real Cucumber <monkcucumber@yahoo.com>
Subject: Iptables Block Netbios Broadcasts UDP 137-138
Date: Tue, 23 Nov 2004 12:51:38 -0800 (PST)
Message-ID: <20041123205139.64577.qmail@web54502.mail.yahoo.com>
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

I cannot block LAN netbios broadcasts on a fedora core
2 Iptables box being used as an IDS.

It is therefore being 99% flooded with broadcasts.

I've tried:

iptables -A INPUT -p UDP --dport 137 -j DROP
iptables -A INPUT -p UDP --dport 137 -s 0/0 -j DROP
iptables -A INPUT -p UDP --dport 137 -s 192.168.0.0/24
-j DROP

Nothing prevents them from getting through.

Is there anyway to do this?

If possible can someone email me direct at
realcucumber@hotmail.com

Thanks for any help in advance.



__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

