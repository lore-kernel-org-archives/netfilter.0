From: George Agnelli <george@mattandgeorge.com>
Subject: VPN Masquerading not working
Date: Sun, 13 Oct 2002 21:34:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B9CF976A.389%george@mattandgeorge.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi, I'm having a really hard time trying to get a VPN client behind my
iptables firewall/gateway to connect to a win2k vpn server. I really hope
someone can help with this as I don't know what else to try. I'm running
iptables 1.2.5 on redhat 7.3 kernel 2.4.18-3. I have set up normal ip
masquerading and that works great. But when it comes to connecting my win2k
laptop to the vpn server it just times out on authentication and I get a
connection error. As far as I know all the settings on the laptop are
correct, it will connect to the vpn server if I plug it direct into the DSL
modem. 

I have been through the VPN Masquerading How To, the Masquerading How To and
the Packet Filtering How To but I still can't seem to get it right. I've
also been through some of the previous threads on this list to no avail.
Below is an iptables -v -L which shows the rules I currently have I know
it's not a safe firewall, but for now I just want to get VPN working. Some
of these have been set up based on advice from other threads. I'm not sure
if I really need them. The Default policy is accept so I don't see why the
packets are not getting in.

(Sorry if the wrapping makes this hard to read!)
Chain INPUT (policy ACCEPT 2 packets, 656 bytes)
 pkts bytes target     prot opt in     out     source
destination        
    0     0 ACCEPT     tcp  --  any    any     anywhere             anywhere
tcp spt:1723 

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination        
    0     0 LOG        all  --  any    any     $EXTERNALIP
$VPNSERVERIP LOG level warning prefix `VPN '
    0     0 LOG        all  --  any    any     $VPNSERVERIP
$EXTERNALIP     LOG level warning prefix `VPN '
    0     0 ACCEPT     gre  --  any    any     anywhere             anywhere
    0     0 ACCEPT     udp  --  any    any     $VPNSERVERIP
$VPNCLIENTIP multiport ports isakmp,2746
    0     0 ACCEPT     udp  --  any    any     $EXTERNALIP
$VPNSERVERIP multiport ports isakmp,2746

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination 

Could anyone who has got this working post the iptables rules they used?
Thanks, George


