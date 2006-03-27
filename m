From: bash <0x62ash@gmail.com>
Subject: need an elegant solution
Date: Tue, 28 Mar 2006 00:52:55 +0400
Message-ID: <20060328005255.680651ad.0x62ash@gmail.com>
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

  Hello All,

From my routers point of view internet devided in 3 zones:
1) MYNET="10.20.0.0/16"
2) FRIENDNET="10.21.0.0/16 10.22.0.0/16 10.23.0.3 10.24.0.4"
3) all other networks and IPs

As you can see $FRIENDNET contains not just NETs, but IPs too. I
can't use one IPSET set, so i decided not to use IPSET functionally and
wait for some "union" types in IPSET in future releases
[http://lists.netfilter.org/pipermail/netfilter/2006-March/065103.html].

Problem is that manipulation with $FRIENDNET in form:
---%<-----------------------------------
for net in $FRIENDNET
do
   iptables -A (FORWARD|INPUT) (-s|-d) $net [...]
done
---%<-----------------------------------
Is not elegant when you need to grant/drop access to many
resourses/services/etc. netfilter will be clutter up with identical
rules...

So I want to find elegant solution for this situation :))

My current approach is:
---%<-----------------------------------
iptables -N FRIENDNET_IN_ACCEPT
iptables -F FRIENDNET_IN_ACCEPT
for net in $FRIENDNET
do
   iptables -s $net -j ACCEPT
done

iptables -N FRIENDNET_OUT_ACCEPT
iptables -F FRIENDNET_OUT_ACCEPT
for net in $FRIENDNET
do
   iptables -d $net -j ACCEPT
done

# grant access to some service
iptables -p tcp -A INPUT -s $MYNET --dport some-service -j ACCEPT
iptables -p tcp -A INPUT --dport some-service -j FRIENDNET_IN_ACCEPT
iptables -p tcp -A INPUT --dport some-service -j DROP

# forward from my net to friends net and vice versa
iptables -P FORWARD DROP
iptables -A FORWARD -d $MYNET -j FRIENDNET_IN_ACCEPT
iptables -A FORWARD -s $MYNET -j FRIENDNET_OUT_ACCEPT
---%<-----------------------------------

Maybe you know more elegant solution?

-- 
Biomechanica Artificial Sabotage Humanoid

