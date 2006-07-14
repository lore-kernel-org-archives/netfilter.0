From: sergiolozano@euskalerria.org
Subject: Problems with target ROUTE
Date: Fri, 14 Jul 2006 09:03:29 +0200
Message-ID: <44b741c1.e40.0@euskalerria.org>
Reply-To: sergiolozano@euskalerria.org
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

Hi all,

I have a host with 4 net cards and I need all network traffic to 8180 port
of one of them goes to another net card. So, I've thougth about executing
this iptables command:
iptables -t mangle -A PREROUTING -p tcp --dport 8180 -s x.x.x.x -d x.x.x.x
-j ROUTE --gw x.x.x.x -oif x

However, when I execute this command, this is the message:
'iptables: No chain/target/match by this name'
I know that my kernel supports this target because I got a proper help when
I execute 'iptables -t mangle --help'.

Please, help me.
_________________________________________________________
Lortu posta elektronikoa doan >>> http://www.euskalerria.org
___________________________________________________________________________________________
Lortu posta elektronikoa doan >> http://www.euskalerria.org

