From: Jimmy <jimmy@v2k.ca>
Subject: Multiple VPN clients
Date: 03 Feb 2003 14:26:11 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1044300371.19032.56.camel@jimmy.vision-2000.ca>
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

Hello,

I have a situation that I have been strugling with for a few days now. 
I don't want to write a 10 page e-mail, so I will try to summerize the
important points and hope someone can clarify this for me.  :)

In a nutshell:  I need to allow multiple IPSec VPN clients from behind
my iptables firewall to connect to a single VPN server on the Internet.
Firewall:  Redhat 7.3 kernel 2.4.18-18.7.x and iptables v1.2.5. 
Clients: win98/2000 with the Nortel Connectivity VPN client V04_15.06

#1 is this possible?  (According to the docs IP masq and VPN masq, I
think it is, unless I am misreading something somewhere)

From what I understand, all I need is to have the firewall setup to 
masquerade and allow ESP, AH and UDP port 500 trafic.  (I included the
relavant rules at the end of this e-mail)  This all works great with
_one_ connection.  As soon as a second ipsec client is launched, it does
not work.

I keep reading I have to patch the kernel for this, but I cannot find an
IPSec patch for the 2.4 kernel anywhere.  (Is this what I am missing?)

The docs I have run through are:
Linux VPN Masquerade:
http://www.impsec.org/linux/masquerade/ip_masq_vpn.html

IP Masquerade HOWTO from
http://ipmasq.webhop.net

Linux VPN Masquerade HOWTO:
http://www.impsec.org/linux/masquerade/VPN-howto/VPN-Masquerade.html

And I have googled to my wits end... :)
I don't know if there is a small point escaping me, or if this is a big
deal and I just plain blind.

If someone has an idea what I might be missing here, I would really
appreciate any input.

Here are the iptables rules I think relavant.  (I setup a bunch of
logging options, and I know these rules are working because of the first
connection.  Yes my real rules are more secure, this is just the parts I
think relavent to my situation, then again I may be wrong)

#! /bin/bash
FILTER=/sbin/iptables

echo "1" > /proc/sys/net/ipv4/ip_forward

$FILTER -t nat -A POSTROUTING -o $EXTINT -j MASQUERADE

$FILTER -A FORWARD -p esp -j ACCEPT
$FILTER -A FORWARD -p ah -j ACCEPT
$FILTER -A FORWARD -p udp --dport 500 -j ACCEPT

I hope someone can enlighten me.  :)

Thank you,
Jimmy


-- 
Jimmy <jimmy@v2k.ca>


