From: kate <kate7234@yahoo.com>
Subject: services for predetermined IP addresses
Date: Fri, 15 Oct 2004 12:41:15 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041015194115.58352.qmail@web21525.mail.yahoo.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hello,

As I see increased scans on my IP address, I want to
limit access to only predetermined IP address ranges
for certain services - Is the following the correct
way to do this?

<snip>
# (Part A) Rules for incoming packets from Internet
# Packets for established connections
iptables -A INPUT -p ALL -d $ETH0_IP -m state --state
ESTABLISHED,RELATED -j ACCEPT

# (Part B) TCP Rules
iptables -A INPUT -p TCP -i eth0 -s 123.45.1.1
--destination-port 21 -j okay # userA
iptables -A INPUT -p TCP -i eth0 -s 123.45.0/16
--destination-port 22 -j okay  #users A - Z
</snip>

So I understand -
ONLY User A can ftp, and all those in 123.45. can ssh
, BUT no-one else on the Internet can request services
?

Thanks in advance
Kate


		
_______________________________
Do you Yahoo!?
Declare Yourself - Register online to vote today!
http://vote.yahoo.com

