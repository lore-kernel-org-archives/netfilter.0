From: markdv <markdv77@gmail.com>
Subject: flushing secondary address deletes conntrack entries using primary
 IP
Date: Fri, 24 May 2013 10:00:45 +0200
Message-ID: <knn6n8$3ga$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

Long story short, I found out that if there is a MASQUARADE rule in 
iptables that source-NATs connections (using the primary interface IP) 
the conntrack entries for these connections get DESTROYed whenever a 
secondary IP on the interface gets removed.

Why? These connections/conntrack-entries only use/depend-on the primary 
IP. Why should removing a secondary IP address on the interface affect 
those entries?

This is on linux 3.2, assuming this behavior is unchanged in more 
current versions(??), should this be considered a bug?

Regards,
Mark.

p.s. To elaborate a bit on why this is a problem for me... The primary 
public IP of my linux router is obtained via DHCP. In order to use the 
management IP of my (otherwise transparent) DSL-bridge/modem I also need 
a secondary private IP address on the interface. This address is also 
set/managed by dhclient by using an "alias" definition in dhclient.conf. 
The dhclient-script shipped with Ubuntu (version 11.10+) removes/re-adds 
this alias every time the lease of the primary (public) address is 
renewed. Which results in all contrack entries using the primary IP to 
be DESTROYED, and connections to be reset.

