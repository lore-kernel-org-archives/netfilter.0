From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Pls help me    DHCP / MAC
Date: Wed, 12 Nov 2003 09:32:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019CCA@hslex01.hslbz.local>
References: <20031111165718.17211.qmail@web60205.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031111165718.17211.qmail@web60205.mail.yahoo.com>
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

> In my LAN i have prepaired 3 PCs.
> 1. Configured the DHCP server and test the other clients for 
> the ip assining , they connected well . 
> 2.Now i need to allow DHCP faclility for a One PC and others 
> should be DROP.So those machines NICs have MAC addresses . 

Set default policy to DROP. Then you only have to worry about letting
certain IP/MAC addresses through.
iptables -P INPUT DROP
iptables -P FORWARD DROP

> 3.MAC address wise it can be DROP/ACCEPT the users. 

Do you *know* the MAC address of all cable modems ? 
If so, you can configure the dhcp server to assing an IP based on the
MAC address of the cable modem and not assign an IP to any other cable
modem plugged in. 
Next you can put iptables rules in place to ACCEPT only traffic from IP
addresses you assinged (using dhcp) and(/or) from MAC addresses of these
cable modems.

I never used the MAC match, but I think it should be something like :
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -i <eth_in> -s <ip_from> -m mac --mac-source
<xx:xx:xx:xx:xx:xx> -j ACCEPT
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i <eth_in> -s <ip_from> -m mac --mac-source
<xx:xx:xx:xx:xx:xx> -j ACCEPT 

Of course you also need rules to allow for dhcp IP assigning...

> 4. finally when test the clients there must be only one 
> users has to be connected to the DHCP server  and the others 
> can't be have an ip .

See 3.
I think it's a good thing to know the MAC addresses because then no
unauthorized cable modem can get a valid IP by dhcp, but it will require
some work to update the configuration.
I know of least one cable ISP that does (something like) this.
But this is dhcp configuration, not an iptables thing.


Gr,
Rob


