From: Casey Scott <casey@phantombsd.org>
Subject: iptables throttle via tc cont.
Date: Thu, 20 Apr 2006 11:59:34 -0700 (PDT)
Message-ID: <7838526.31145559574402.JavaMail.root@tomcat.phantombsd.org>
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

After working some more on my original post, I've come up with this. It doesn't work,
though I think it should. I am trying to throttle incoming connections from the Internet. 
Since tc filters work on transmit, the best place to restrict seems to be from eth1 to 
eth0 (FORWARD). That way, the restriction imposed on the trasmit of eth1 won't apply to a connection from the internal network going out (like an file upload). The box in 
question has eth0 in an internal network and eth1 on the WAN link.

iptables -t mangle -A FORWARD -i eth0 -j MARK --set-mark 1
iptables -t mangle -A FORWARD -i eth1 -j MARK --set-mark 2

tc qdisc del dev eth0 root 2>/dev/null
tc qdisc add dev eth0 root handle 1:0 htb default 1
tc class add dev eth0 parent 1:0 classid 1:1 htb rate 100mbit
tc class add dev eth0 parent 1:1 classid 1:10 htb rate 2kbit
tc filter add dev eth0 parent 1:0 protocol ip prio 0 handle 1 fw classid 1:10
tc filter add dev eth0 parent 1:0 protocol ip prio 0 handle 2 fw classid 1:1

Though I see packets being caught by the iptables rules, they never seem to 
get the tc filters applied to them.

Thanks,
Casey

