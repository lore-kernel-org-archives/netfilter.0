From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Needing some help to check iptables configuration
Date: Mon, 3 Jun 2002 19:39:15 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206031839.g53IdFA13473@Networker.rockstone.co.uk>
References: <HCEEIHCIBILHEDFLFOKFGEGMCIAA.mailings@peyron.nom.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <HCEEIHCIBILHEDFLFOKFGEGMCIAA.mailings@peyron.nom.fr>
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
To: netfilter <netfilter@lists.samba.org>

On Monday 03 June 2002 6:28 pm, Francois Peyron wrote:

> Hi there,
>
> I did setup a classical linux firewall box with two private ip segment, one
> for the intranet(192.168.1.0/24), the other one for dmz (10.0.0.0/8).

> DMZ_LAN="10.0.0.1/8"

This is not good - it should be 10.0.0.0/8

> # Activation de la NAT
> echo 1 > /proc/sys/net/ipv4/ip_forward

Not a very accurate comment, however the command is important :-)

> iptables -A SSH_FW -p tcp --dport ssh -j ACCEPT
> iptables -A SSH_FW -p udp --dport ssh -j ACCEPT

Why do you allow UDP port 22 ?   What's the point ?

> iptables -A TRA_NET -p udp --dport http -j ACCEPT #http
> iptables -A TRA_NET -p udp --dport https -j ACCEPT #https
> iptables -A TRA_NET -p udp --dport ftp -j ACCEPT #ftp
> iptables -A TRA_NET -p udp --dport ftp-data -j ACCEPT #ftp-data

Same for all of these - why do yu allow UDP ?

> iptables -A TRA_NET -p tcp --dport domain -j ACCEPT #dns
> iptables -A TRA_NET -p udp --dport domain -j ACCEPT #dns

Now this one's okay - you *should* allow both TCP and UDP for DNS.

> # Remove des regles bloquantes
> ###########################################################################
># ###
> iptables -D INPUT 1
> iptables -D FORWARD 1
> iptables -D OUTPUT 1

It would be a good idea to set the default policy on all three tables to DROP:

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

This way you include rules to allow the packets you know you want, and 
anything you didn't think of gets thrown away, just the way you want it.

> Not all the tables are written but no matter, what I need is to connect to
> this box using sshd.

So why is your SSH rule in the FORWARD chain ?:

iptables -A FORWARD -s *ip adress allowed to connect* -d $IP_NET -i
$NET_IFACE -j SSH_FW

If $IP_NET is on this box itself then this should be in the INPUT chain, 
because it's a packet coming IN to the box.

> The problem I've got is that I can connect on this box with ssh but from
> whatever the ip is ...

> ______________________________________________________________________
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination

That is why.   You have a completely open policy on your INPUT chain, so 
anyone can connect from anywhere using any service :-)

Not a secure system (yet).....


Antony.

