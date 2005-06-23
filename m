From: radu <radu@adm.utm.md>
Subject: Help!!!
Date: Thu, 23 Jun 2005 14:50:54 +0300
Message-ID: <14209331.20050623145054@adm.utm.md>
Reply-To: radu <radu@adm.utm.md>
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

Hello all,

      My networck config:

  Internet -> linux box -> My PC(192.168.50.101)

  linux box
  eth0 local 192.168.50.0/24
  eth1 Internet
  
  my iptables config:

iptables -P FORWARD DROP
iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 4662 -j DNAT --to 192.168.50.101
iptables -I FORWARD  -d 192.168.50.101 -p tcp --dport 4662 -j ACCEPT
iptables -I FORWARD -i eth1 -o eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -I FORWARD -s 192.168.50.101 -j ACCEPT
iptables -t nat -I POSTROUTING -o eth1 -j MASQUERADE
  
why I'm receiving on my PC  packages  with external ip on
4690,4544,4581.. ports???

-- 
Best regards,
 Radu                          mailto:radu@adm.utm.md


