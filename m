From: "James T. Moore" <jamoore2@vt.edu>
Subject: RE: how is this stuff getting thru default deny iptables firewall?....
Date: Sat, 22 Jun 2002 17:43:22 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <000701c21a35$d5b51b00$0264a8c0@ZANE>
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
To: seberino@spawar.navy.mil
Cc: netfilter@lists.samba.org

Chris,

    My guess would be that the firewall is allowing reponses to connections
that are already established, but its impossible to say for sure without
seeing the script used to create the firewall.

Here is an example:

$IPTABLES -A FORWARD -o $INET_IFACE -d $DNS_SERV1 -s $PRIV_LAN -p
udp --dport 53 -m state --state NEW,ESTABLISHED -j ACCEPT

$IPTABLES -A FORWARD -i $INET_IFACE -s $DNS_SERV1 -d $PRIV_LAN -p
udp --sport 53 -m state --state ESTABLISHED -j ACCEPT


The first rule allows the clients on the private LAN to query the dns
server. These packets can be part of a new or established connection so the
clients can create new connections to connect to the DNS server.

The second rule allows the DNS server to respond to the clients' request.
These packets can only be part of an established connection so the DNS
server (or any other host) can not create a new connection into the private
LAN unless there are other rules to allow it.


J.T.




>Date: Sat, 22 Jun 2002 10:30:55 -0700
>From: Christian Seberino <seberino@spawar.navy.mil>
>To: netfilter@lists.samba.org
>Subject: how is this stuff getting thru default deny iptables firewall?....
>
>My firewall *only* forwards SSH stuff to private LAN.
>
>It forwards *everything* _from_ private LAN to Internet however.
>
>How can the private LAN use DNS which it does????
>
>How is DNS server returning the info thru firewall
>if it *only* allows SSH??!?!?!?
>
>Chris


