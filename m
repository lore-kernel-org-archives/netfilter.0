From: Wolfgang Meyerle <procrash@neusob.de>
Subject: Problems with classifying packets
Date: Thu, 10 Feb 2005 00:41:30 +0100
Message-ID: <420A9FAA.5060004@neusob.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hi I'm using iptables v1.2.11 under Kernel 2.6.10 and I'm really getting 
in trouble trying out something with qos.
If I mark packages with
iptables -t mangle -A POSTROUTING -o eth0 -p tcp --dport 80 -j MARK 
--set-mark 0x1
and try to classify them with
tc filter add dev eth0 parent 1: protocol ip prio 1 handle 0x1 fw flowid 1:1
then no packages are classified.
I'm using a structure of a htb qdisc. But it seems that only the default 
value is sorting the packages but nothing depends on my marking values.
Is this an error?

If I classify the things directly with iptables .. -j CLASSIFY 1:1 then  
everything works great.

Any Ideas???

Greets
Wolfgang Meyerle

