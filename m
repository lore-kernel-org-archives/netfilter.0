From: Chinh Nguyen <cnguyen@certicom.com>
Subject: Automagic proxy arp?
Date: Wed, 22 Feb 2006 10:24:03 -0500
Message-ID: <43FC8213.2030606@certicom.com>
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

I have a machine M that is 'walled' off from the rest of the local subnet
similar to this.

        .1        .2        .3       .4-.254
+-------+         +---------+
+   M   + ------ eth1  FW  eth0 ---- local subnet
+-------+         +---------+

With ip_forward on and using standard forward rules on FW (e.g., -A FORWARD
--in-interface eth1 -j ACCEPT, -A FORWARD --in-interface eth0 -m state --state
ESTABLISHED,RELATED -j ACCEPT), M can reach the local subnet.

However, I need to add a routing entry in M to send all local traffic to FW.
Otherwise, M will attempt to arp the destination as they are all on same subnet.
The linux arp man page claims that linux will "automagic proxy arp when a route
exists and it is forwarding".

Does anyone know how to set up iptables on FW to enable this "automagic"?

I've also tried using explicit forward rules such as "--in eth1 -d !.1 -j
ACCEPT", "--in eth1 -d .4 -j ACCEPT, --in eth1 -d .5 -j ACCEPT, etc." to no effect.

Thanks.

