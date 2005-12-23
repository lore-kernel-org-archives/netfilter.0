From: "Pedro TRImel Neto" <pedrodrimel@uol.com.br>
Subject: random IP
Date: Fri, 23 Dec 2005 10:31:08 -0200
Message-ID: <002e01c607bc$c2949000$2f00a8c0@TRINTASETE>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi all,

I need to do that the connections from a linux box to other change the IPs 
in random...

Scenario: A Linux box that has an phisic interface and two logic as eth0 
eth0:0 eth0:1 with the ips 10.0.0.1 10.0.0.2 10.0.0.3

I did this rule:
iptables -t nat -A POSTROUTING -p tcp -d 10.0.0.4 -j SNAT --to 10.0.0.2

OK but I need that when do a ssh 10.0.0.4 each time it change de IP ... one 
time with 10.0.0.1 the other 10.0.0.2 or 10.0.0.3... Or a rule per user... 
example the user pedro has a rule that when he connect to 10.0.0.4 the IP 
will be 10.0.0.2...

Sorry for my bad english...

Regards. 


