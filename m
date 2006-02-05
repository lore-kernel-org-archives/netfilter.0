From: Linux linux <khankhn1@yahoo.com>
Subject: I want to understand the concept
Date: Sun, 5 Feb 2006 00:54:25 -0800 (PST)
Message-ID: <20060205085425.75608.qmail@web35905.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: khankhn1@yahoo.com, rhce.rhct@gmail.com, nomankhn@yahoo.com



Hello?

I want to understand the difference b/w following
things

Q1. What is the difference b/w these 2 command

iptables -A FORWARD -s 192.168.0.1 -j DROP
iptables -t mangle -A FORWARD -s 192.168.0.1 -j DROP

what is the difference b/w 

FORWARD of filter table?
FORWARD of mangle table?

Q2. What is the difference b/w POSTROUTING and
PREROUTING?

Q3. What is the difference b/w SNAT and DNAT?


Q4. What is the difference b/w that

How i can understand 

FOR FILTER TABLE?

what is my source in FORWARD chain of FILTER table
what is my dstination in FORWARD chain of FILTER table

what is my source in INPUT chain of FILTER table
what is my dstination in INPUT chain of FILTER table

what is my source in OUTPUT chain of FILTER table
what is my destination in OUTPUT chain of FILTER table

FOR NAT TABLE?

what is my source in INPUT chain of MANGLE table
what is my dstination in INPUT chain of MANGLE table

what is my source in FORWARD chain of MANGLE table
what is my dstination in FORWARD chain of MANGLE table

what is my source in OUTPUT chain of MANGLE table
what is my destination in OUTPUT chain of MANGLE table

what is my source in PREROUTING chain of MANGLE table
what is my destination in PREROUTING chain of MANGLE
table

what is my source in POSTROUTING chain of MANGLE table
what is my destination in POSTROUTING chain of MANGLE
table


FOR NAT TABLE?

what is my source in OUTPUT chain of NAT table
what is my destination in OUTPUT chain of NAT table

what is my source in PREROUTING chain of NAT table
what is my destination in PREROUTING chain of NAT
table

what is my source in POSTROUTING chain of NAT table
what is my destination in POSTROUTING chain of NAT
table


Regards
Khan










__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

