From: sean darcy <seandarcy2@gmail.com>
Subject: howto setup masquerade in multihomed server
Date: Mon, 08 Dec 2008 21:57:17 -0500
Message-ID: <ghkmqe$sus$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I've got one internal interface (INTIF), a static external interface 
(EXTIF) and a Verison DSL external interface (VERISONIF). I want to use 
EXTIF just for voip and the VERIZONIF for general internet. I can set 
this all up on the server, setting the correct default route.

If EXTIF is set as the default route ( not what I eventually want ), NAT 
works fine with this SNAT:

$IPT -t nat -A POSTROUTING -o $EXTIF -j SNAT --to-source xxx.yyy.zzz.aaa

but if I set the default route to VERIZONIF ( dynamic address ) , NAT 
doesn't work with this masquerade:

$IPT   -t nat -A POSTROUTING -o $VERIZONIF   -j MASQUERADE

Forward should work regardless of interface:

#now set up block firewall chain
/sbin/iptables  -N  block
/sbin/iptables  -A block  -m state --state ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables  -A block   -i  $INTIF  -j ACCEPT
/sbin/iptables  -A block    -j DROP

# allow all from localhost
$IPT -A INPUT  -i lo -j ACCEPT
$IPT -A OUTPUT -o lo -j ACCEPT

#allow from ssh
$IPT -A INPUT -p tcp -s 0/0 --dport 22 -j ACCEPT  #ssh

# send everything else to the block chain
$IPT  -A INPUT -j  block
$IPT  -A FORWARD -j  block


So what am I missing?

sean

