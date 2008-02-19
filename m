From: cemozturk <cem.ozturk@gazi.edu.tr>
Subject: iptables same nat
Date: Tue, 19 Feb 2008 17:23:19 +0200
Message-ID: <47BAF467.5000706@gazi.edu.tr>
Reply-To: cem.ozturk@gazi.edu.tr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


Hi,
I want to catch iptables logs for SAME NAT.  SAME NAT takes IP from POOL.
But I dont't match local IP with real IP. How do I do?
Thanks..



$INET_BIM_POOL="192.168.3.1-192.168.3.64"

$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -s 10.5.0.0/16  -j bim


$IPTABLES -t nat -A bim_out -p icmp -o $INET_IFACE -j SNAT --to-source 
$INET_BIM_POOL
$IPTABLES -t nat -A bim_out -p tcp -o $INET_IFACE  -j SAME --nodst --to 
$INET_BIM_POOL
$IPTABLES -t nat -A bim_out -p udp -o $INET_IFACE  -j SAME --nodst --to 
$INET_BIM_POOL
