From: Camilo Echeverry <phantom@colombianet.net>
Subject: MSN Messenger Losts connection
Date: Thu, 13 Mar 2003 09:36:30 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0303130936300B.02147@hosting.colombianet.net>
Reply-To: phantom@colombianet.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi.

I have basic firewall iptables rules in my Linux gateway (NAT) and Im having 
some problems with the computers behind the firewall. The MSN messenger losts 
connection after a few minutes of login

I have 3 Network interfaces, 
one for server network via eth0 (these have valid IPS)
one for Internet via eth2 (MSN goes throug here)
and one to connect the internal Net to the other two Networks (here are 
office computers)

The Rules for each user are:
sbin/iptables --table nat --append POSTROUTING -s USER_PRIVATE_IP -d 
0.0.0.0/0.0.0.0 --out-interface eth2 -j MASQUERADE

/sbin/iptables --table nat --append POSTROUTING -d LOCALNET --out-interface 
eth0 -j MASQUERADE
/sbin/iptables --table nat --append POSTROUTING -d 0.0.0.0/0.0.0.0 
--out-interface eth0 -j DROP
/sbin/iptables --table nat --append POSTROUTING -d 0.0.0.0/0.0.0.0 
--out-interface eth2 -j DROP


Any suggestion about the MSN disconnection ?

Thanks.

Camilo.

-- 

_____________________________________________________________________________
Cuando un Arquero dispara gratuitamente .. 
Tiene consigo toda su habilidad ...

                          Proverbio Oriental
_____________________________________________________________________________

