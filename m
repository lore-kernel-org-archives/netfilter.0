From: Thomas Kirk <thomas@arkena.com>
Subject: PPTP and netfilter
Date: Tue, 29 Oct 2002 13:58:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021029125857.GD32153@thomas.arkena.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hey there listmembers!

I know this issue has been discussed alot but im still abit
confused. Let me say that if i get this to work i will write a
detailed describtion on how i did it, kind of a hands-on howto :)

Ive managed sucessfully to patch 2.4.18 kernel with the newest
patch-o-matic and get it to compile. The linuxkernel was a vanillatype
thing downloaded from kernel.org and patch-o-matic was downloaded from
here :

ftp://ftp.netfilter.org/pub/patch-o-matic/snapshot/patch-o-matic-20021028.tar.bz2

ive loaded the modules :

ip_conntrack_pptp		2400   0  (unused)
ip_conntrack_proto_gre		2432   0  [ip_conntrack_pptp]

Now im abit confused on the rules i need to apply to my firewall to
make it work.

Case is this : 

Client<------>[Firewall/NAT]<------>[INTERNET]<------>[SERVER]

So my only worry is howto "translate" GRE packets and allow clients on
inside of firewall to establish PPTP to server on internet through
firewall.

So fare ive added these rules to firewall :

$IPTABLES -A lan_chain -p 47 -s $LAN_NET2 -j ACCEPT
$IPTABLES -A lan_chain -p tcp --dport 1723 -s $LAN_NET2 -j ACCEPT

lan_chain are outgoing chain. Is this all i need to add to firewall to
make it work or am i overlooking something? 

Please let me know if you need additional information on
setup/configuration to help me solve this puzzle!

Thanks in advance

-- 
Venlig hilsen/Kind regards
Thomas Kirk
ARKENA
thomas(at)arkena(dot)com
Http://www.arkena.com


BOFH excuse #345:

Having to manually track the satellite.

