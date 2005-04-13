From: Christian Seberino <seberino@spawar.navy.mil>
Subject: Cleanest way to deal with loopback interface?
Date: Wed, 13 Apr 2005 13:50:50 -0700
Message-ID: <1113425449.3544.177.camel@seberino.spawar.navy.mil>
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

I want first rules that packets encounter to be my DROP_CHAIN
that weeds out suspicious packets including packets addressed
to and from 127.0.0.1 (loopback):

# -------------------------------------------------------------
$IPTABLES -t filter -P INPUT   DROP
$IPTABLES -t filter -P OUTPUT  DROP
$IPTABLES -t filter -P FORWARD DROP
 
$IPTABLES -t filter -A INPUT   -j DROP_CHAIN
$IPTABLES -t filter -A OUTPUT  -j DROP_CHAIN
$IPTABLES -t filter -A FORWARD -j DROP_CHAIN
  
$IPTABLES -t filter -A INPUT  -i $LOOPBACK_INTERFACE -j ACCEPT
$IPTABLES -t filter -A OUTPUT -o $LOOPBACK_INTERFACE -j ACCEPT
# ------------------------------------------------------------

How can I make DROP_CHAIN drop bogus 127.0.0.1 addressed packets
but still allow **legitimate** loopback traffic?

Chris



