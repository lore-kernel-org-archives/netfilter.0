From: Jeff Weber <jweber@amsuper.com>
Subject: DNAT rule requires extra firewall pinhole
Date: Fri, 25 May 2007 17:17:27 -0500
Message-ID: <200705251717.27252.jweber@amsuper.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

I've setup DNAT on gateway such that external clients connecting to TCP port 
$SCADA_PORT on the gateway are actually connected to the node $MCB_IP on a 
private network.  Here's my rule:

 $IPTABLES -t nat -A PREROUTING -p tcp -d $DAS_SCADA_IP --dport $SCADA_PORT \
        -i $DAS_SCADA_IF -j DNAT --to $MCB_IP:$SCADA_PORT

The gateway knows how to forward packets between the internal and external 
interfaces.  The above rule works fine.

I've added a firewall rule to block external requests to forward through the 
gateway:

$IPTABLES -A FORWARD -p tcp -i $DAS_SCADA_IF --syn -j DROP

The trouble is, I just found out that the above firewall rule is not 
compatible with my DNAT rule.  That is, DNAT rewrites the destination IP [as 
it should] to the $MCB_IP, then forwards the packet, which then encounters 
the new firewall rule, and is dropped.

So I preceeded the above firewall rule with another rule:
$IPTABLES -A FORWARD -p tcp -i $DAS_SCADA_IF -s $SCADANET -d $MCB_IP \
    --dport $SCADA_PORT -j ACCEPT

which enables the DNAT to work again.  However, a side effect is that now 
external nodes on $SCADANET can forward port=$SCADA_PORT to IP=$MCB_IP 
directly through the firewall.  Granted this is a small pinhole, but I'd like 
to plug it if possible.  I would think that it should be possible to prevent 
all external nodes from forwarding through the firewall, and to prevent 
external hosts from directly "seeing" an internal node on the private net.

Any suggestions?

	TIA,
	Jeff

