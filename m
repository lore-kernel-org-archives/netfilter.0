From: monty denis <montydenis@yahoo.com>
Subject: How to filter this packet?
Date: Fri, 20 Apr 2007 02:36:20 -0700 (PDT)
Message-ID: <450608.64360.qm@web63507.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Message-ID: <176221.28725.bm@rrr2.mail.re1.yahoo.com>
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

Hello, all.

I can filter some protocol packet like below.

iptables -A INPUT -p x 

But how can I filtre like (proto 0) below?
proto 0 means protocol 0 ?

I can find protocol 0 information at  
http://www.iana.org/assignments/protocol-numbers


 11.34.254.146 -> xx.xx.xx.xx [proto 0]
  ........WinSock 2.0.....LG@.
B..Y..|............#...............                   
                

 24.57.19.22 -> xx.xx.xx.xx [proto 0]
  ........WinSock
2.0.....LG@.....Y..|............#...............      
                             


# iptables -A INPUT -p 0 -j DROP 

When I execute like above, protocol 0 means all
protocol.

# iptables -L INPUT -n
target     prot opt source               destination
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0



Thanks for your time.... 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 


