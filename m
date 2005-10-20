From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: blocking traffic between two internal interfaces ?
Date: Thu, 20 Oct 2005 05:07:17 +0200
Message-ID: <14162.9181722694$1129777685@news.gmane.org>
Reply-To: edvin.seferovic@kolp.at
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

Hi,

 

I have two internal interfaces ( eth1 // 172.19.0.0 & eth2 // 172.20.0.0 ),
and I would like to block traffic between those two networks. Somehow Ive
failed because any rules that should forbid traffic between those 2 networks
didn't work. I still could access webserver on the eth2 - 172.20.10.1 from a
station with IP address 172.19.1.100 ! Then Ive applied rule in PREROUTING
chain in nat table:



Iptables -t nat -A PREROUTING -s 172.19.0.0/16 -d 172.20.0.0/16 -j DROP

 

Rules in FORWARD and INPUT chain just wouldn't work. Is this the right way
to forbid traffic from one network to the another or am I missing some basic
stuff here? I would appreciate any comments.

 

Thank you in advance !

 

Regards,

 

Edvin Seferovic

 

 

 

