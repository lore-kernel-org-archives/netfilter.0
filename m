From: Mark Tessier <mt@open2web.com>
Subject: debugging iptables
Date: Mon, 17 Jun 2002 16:59:03 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020617165903.4b7ac76a.mt@open2web.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

I've set up a small network with 2 subnets: LAN and DMZ. The LAN and DMZ are
connected by a rh7.1 running a iptables choke firewall. The rc.firewall
script is based on Ziegler's chpt 6 choke firewall script. When I run the
rc.firewall script I get several errors that I'm hoping someone can help me
with. Here's a look at those errors:

iptables v1.2.1a: host/network `smtpx.xxxx.xx' not found
Try `iptables -h' or 'iptables --help' for more information.
iptables v1.2.1a: host/network `smtpx.xxxx.xx' not found
Try `iptables -h' or 'iptables --help' for more information.
iptables v1.2.1a: host/network `mail.yyyy.com' not found
Try `iptables -h' or 'iptables --help' for more information.
iptables v1.2.1a: host/network `mail.yyyy.com' not found
Try `iptables -h' or 'iptables --help' for more information.
iptables v1.2.1a: host/network `news.cis.dfn.de' not found
Try `iptables -h' or 'iptables --help' for more information.
Try `iptables -h' or 'iptables --help' for more information.
Bad argument `1024:65535'

Here's the section that some of these  errors refer to:

# Sending Mail to the Mail Gateway Server (TCP Port 25)

iptables -A FORWARD -i $LAN_INTERFACE -o $DMZ_INTERFACE -p tcp \
         -s $LAN_ADDRESSES --sport $UNPRIVPORTS \
         -d $SMTP_SERVER --dport 25 \
         -m state --state NEW -j ACCEPT

iptables -A OUTPUT -o $DMZ_INTERFACE -p tcp \
         -s $DMZ_IPADDR --sport $UNPRIVPORTS \
         -d $SMTP_SERVER --dport 25 \
         -m state --state NEW -j ACCEPT

###############################################################

# Retrieving Mail as a POP Client (TCP Port 110)

iptables -A FORWARD -i $LAN_INTERFACE -o $DMZ_INTERFACE -p tcp \
         -s $LAN_ADDRESSES --sport $UNPRIVPORTS \
         -d $POP_SERVER --dport 110 \
         -m state --state NEW -j ACCEPT

iptables -A OUTPUT -o $DMZ_INTERFACE -p tcp \
         -s $DMZ_IPADDR --sport $UNPRIVPORTS \
         -d $POP_SERVER --dport 110 \
         -m state --state NEW -j ACCEPT

I'm not sure why the script causes these error messages, while others like accessing an HTTP server doesn't produce any error mesages. DNS rules are prior to these rules.

-- 
Thanks,

Mark




-- 
Thanks,

Mark

