From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Transparent proxy where source IP address remains unchanged --
	possible?
Date: Wed, 10 Aug 2005 11:22:37 -0400
Message-ID: <42FA1BBD.6060806@rosi-kessel.org>
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

I'm new to iptables and have perhaps a naive question.

I am wondering if there is a way to configure a proxy such that packets
are redirected to a new IP address, but the *source* IP address remains
unchanged.

To illustrate: let's say we have "userbox" 10.1.1.2, "faketarget"
10.1.1.3, and "realtarget" 10.1.1.4.

Userbox initiates an ssh connection to faketarget. Faketarget routes all
packets to realtarget.

I understand how to do this while changing the source IP address. I
would run these commands on the faketarget box:

iptables -t nat -A PREROUTING -i eth0 -s 10.1.1.2 -d 10.1.1.3 \
	-p tcp --dport ssh -j DNAT --to 192.168.98.4

iptables -t nat -A POSTROUTING -o eth0 -s 10.1.1.2 -d 10.1.1.3 \
	-j SNAT --to 10.1.1.3

Easy enough. But in this case, the connection to realtarget appears to
come from faketarget, not userbox, the originator of the ssh connection.
This is normally what you want with local NAT.

But what if I want the connection to realtarget to appear to come from
userbox.  I want faketarget to be an almost invisible middleman.  I
don't want to rewrite the source IP address, but leave it as is.  If I
just leave off the second iptables line above, however, no packets are
forwarded to realtarget at all.

Is this possible?  Am I asking the wrong question?
-- 
Adam Rosi-Kessel
http://adam.rosi-kessel.org


