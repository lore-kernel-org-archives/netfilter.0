From: "prasanna" <prasanna@bharatplanet.com>
Subject: Share my internet connection
Date: Wed, 17 Dec 2003 18:06:48 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c3c49a$70df83d0$05000a0a@bharatplanet.com>
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


Hi,
      I am using redhat 9. I connected internet to this machine. I like
to share my internet to local machines through NAT.
How to configurethe NAT?

I tried this 

modprobe iptable_nat
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

And put gateway as linux machine in local machine
But unsucessfull 

Please help with script




Thanks & Regards,
Sureshprasanna M.K
BharatPlanet Consulting Ltd.
http://www.bharatplanet.co.in 

An SEI-CMM Level 2 Company
 


