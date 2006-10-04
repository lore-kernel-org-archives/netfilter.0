From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: STRING  module : Invalid argument
Date: Wed, 04 Oct 2006 10:03:37 +0200
Message-ID: <45236AD9.4090300@freemail.hu>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>

Hi,

Is there a bug in 2.6.18 kernel?
I am using it with iptables v1.2.11 and the following command gives me 
error:

fw1:~# iptables -A INPUT -j DROP -p tcp -m string --string "test"
iptables: Invalid argument

fw1:~# iptables -v -A INPUT -j DROP -p tcp -m string --string "test"
DROP  tcp opt -- in * out *  0.0.0.0/0  -> 0.0.0.0/0  STRING match "test"
iptables: Invalid argument

fw1:~# uname -a
Linux fw1 2.6.18.06.275.16 #1 SMP Mon Oct 2 16:29:40 CEST 2006 i686 
GNU/Linux

fw1:~# iptables -V
iptables v1.2.11

Any comments?

