From: mgeschermann@arcor.de
Subject: http-rules and browsing ebay Problem
Date: Wed, 11 Feb 2004 13:35:27 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <10581301.1076502927332.JavaMail.ngmail@webmail02.arcor-online.net>
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

Hi all,

I spend a lot of time on building my own firewall-script. Mostly everything is working fine (some things aren't tested yet), but I've got a tricky problem and hope you can help me.

If I want to open the ebay-site from either the firewall or an client my browser tells me after a some seconds "This site could not be displayed."

I've done some logging and noticed, that after the reply I get a packet with status "NEW" from ebay. (within a few seconds after the the first reply)


I'm running Suse 9.0 on my router/firewall with iptables 1.2.8. I'm using ip_conntrack.
(The problem occurs even without conntrack.)


here my rules:

iptables -t nat -A PREROUTING -i $IFACE_LAN -p tcp -s $LOCAL_LAN --dport $HTTP_PORT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

iptables -A FORWARD -i $IFACE_LAN -o $IFACE_EXT -p tcp -s $LOCAL_LAN --dport $HTTP_PORT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

iptables -A FORWARD -i $IFACE_EXT -o $IFACE_LAN -p tcp -d $LOCAL_LAN --sport $HTTP_PORT -m state --state RELATED,ESTABLISHED -j ACCEPT



I allready spent a lot of time on searching the and the mail-archive from netfilter but couldn't find a solution.

So I hope there is anyone reading this mail who can help me.

Thanks

M. Geschermann





