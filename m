From: "Cristian Seva \(VOIPLAB\)" <cristian.seva@voiplab.com>
Subject: Problem with 2 NAT and 2 ROUTE
Date: Mon, 23 Aug 2004 11:42:38 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008801c4891f$70be07b0$0800000a@pc08infierno>
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

have a problem with mi linux BOX

Eth0 =  192.168.0.254  (RED A)
Eth1 =  200.69.123.177/130  (LINK A)
Eth2 =  192.168.0.100  (RED B)
Eth3 =  192.168.1.1 para el PPPOE
ppp0=  DynamicIP (LINK B)
-------------------------------------------------------------------
-DEFAULT ROUTE
200.69.123.178 (LINKA)
ppp0 (cdo establece el PPPOE)
-------------------------------------------------------------------
-IPTABLES  NAT RULES
iptables -t nat -A POSTROUTING -s 192.168.0.0/255.255.255.128 -o ppp0 -j
MASQUERADE
iptables -t nat -A POSTROUTING -s 192.168.0.128/255.255.255.128 -o eth1 -j
MASQUERADE
-------------------------------------------------------------------

My problem is the only NAT works is the NAT with march with de default
route..

Can any one helme?




