From: Cedric de Launois <delaunois@info.ucl.ac.be>
Subject: Re: Routing packets with IPTABLES?
Date: 11 Feb 2003 18:17:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1044983863.26066.133.camel@descartes.info.ucl.ac.be>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: Reginald NALLARATNAM <regi@toolsnottoys.com>
Cc: netfilter@lists.netfilter.org

> Question:
> Is there a way to route incomming packets from the gateway to eth0 on
> firewall #1 based on source IP and destination Port to the web server 
> @ 192.168.20.100?
> The only way this will work if Firewall # 1 routes or forwards the 
> packets to web server without connection tracking, since the return
> answer from web server will go through firewall # 2.

I didn't well understood what you are doing but I think the ROUTE
target can help you. This target is available from the CVS. An older
version is in iptables-1.2.7a with patch-o-matic-20020825 (NOT the
latest pom). It is an /extra patch.

A description of the target in CVS is :

  This option adds a `ROUTE' target, which enables you to setup unusual
  routes not supported by the standard kernel routing table.
  For example, the ROUTE lets you directly route a received packet through 
  an interface or towards a host, even if the regular destination of the 
  packet is the router itself. The ROUTE target is also able to change the 
  incoming interface of a packet.

  This target does never modify the packet and is a final target.
  It has to be used inside the mangle table.

  ROUTE target options:
    --oif   ifname    Send the packet out using `ifname' network interface.
    --iif   ifname    Change the packet's incoming interface to `ifname'.
    --gw    ip        Route the packet via this gateway.

  Examples :

  To redirect all outgoing icmp packet to the eth1 interface :
  # iptables -A POSTROUTING -t mangle -p icmp -j ROUTE --oif eth1

  To tunnel all incoming http packets :
  # iptables -A PREROUTING -t mangle -p tcp --dport 80 -j ROUTE --oif tunl1

  To force the next-hop used for ssh packets :
  # iptables -A PREROUTING -t mangle -p tcp --dport 22 -j ROUTE --gw w.x.y.z

  To change the incoming network interface from eth0 to eth1 for icmp packets :
  # iptables -A PREROUTING -t mangle -p icmp -i eth0 -j ROUTE --iif eth1




