From: "Nathan Cassano" <nathan@cjhunter.com>
Subject: RE: Linux Gateway/Firewall with NAT
Date: Wed, 26 Jun 2002 10:30:22 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <100801c21d37$26d05730$2901a8c0@amos>
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
To: 'Russell Seymour' <russell.seymour@energis.com>, netfilter@lists.samba.org


Hi Russell,

> However I have an SMTP server in the internal LAN and I have an mx
record for it on the internet.
> What I want to do is put another IP address on the external interface
(virtual IP??) and have that
> NAT'ed through to the internal IP address for the mail server on ports
25, 110, 389, 3389.
> Also all traffic is allowed outbound, but only selected services are
allowed inbound for the primary external IP address.
> 
> Here are the questions:
> 
> Is this a possible setup using Linux and iptables? 

I think so, but you'll have to just try it.

> If the answer to 1 is yes then can someone point me in the right
direction in terms of what I need to do? 
> 
> If anymore information is required then please let me know.  Any help
is greatly appreciated.


First you need to setup IP Aliasing on your Linux Router for the email
server's IP.

IP-Alias, Setting Up IP Aliasing On A Linux Machine
http://www.tldp.org/HOWTO/mini/IP-Alias/index.html


Here is a basic example of how I think this could be accomplished. I'm
sure there are a few
extra rules that could be added to be more secure about this, but here
we go.

#!/bin/sh

MAILSERVER_INT_IP=192.168.1.25

MAILSERVER_EXT_IP=195.92.252.137

# SNAT all connections from internal mail server to external mail
server's IP address
iptables -t nat -A POSTROUTING -s $MAILSERVER_INT_IP -j SNAT --to-source
$MAILSERVER_EXT_IP

# DNAT all connections to IP address of external mail server on port 25
to internal mail server 
iptables -t nat -A PREROUTING -p tcp --port 25 -d $MAILSERVER_EXT_IP -j
DNAT --to-destination $MAILSERVER_INT_IP


The last rule could be repeated for each service that you wish to allow
into the mail server.

I have not tested this at all. Try this at your own risk.

Best of luck.

Nathan


