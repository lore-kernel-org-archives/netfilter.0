From: Jan Humme <jan.humme@xs4all.nl>
Subject: Re: unexpected problem with DNAT
Date: Wed, 10 Jul 2002 14:50:55 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <02071014505504.04513@Lms>
References: <2881.1026303535@www8.gmx.net>
Reply-To: jan.humme@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <2881.1026303535@www8.gmx.net>
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
To: thingstocome@gmx.net, netfilter@lists.samba.org

On Wednesday 10 July 2002 14:18, thingstocome@gmx.net wrote:
> hello,
> i'm currently configuring a linux box to function as a router/gateway
> between two different LAN networks.
>
> default config:
> Hosts from LAN_1 shall be able to connect to LAN_2 via masquerading (SNAT)
> which works fine, and hosts from LAN_2 shall only be able to connect to the
> gateway,
> not to any host in LAN_2.
>
> However sometimes it is necessery that a host of LAN_2 initiates a
> connection to a
> certain computer in LAN_1.
>
> I do this by adding following rule to the gateways' iptables, which also
> works fine:
>
> iptables -t nat -A PREROUTING -j DNAT -i eth1 -d <GATEWAY_ADDR1> --to
> <LAN_1_ADDR>
>
> note: GATEWAY_ADDR1 ... is one of several ip addresses that belong to the
> gateway,
>         LAN_1_ADDR        ... is the address of host that shall be reached
> from LAN_2.
>
> ok now here's my problem:
>
> i thought that i can deny access to LAN_1_ADDR again as soon as the
> connection isnt needed anymore, by simply removing the rule.
>
> this worked if there were no open connections between the hosts, but not if
> the host in LAN_2 already had established one.
>
> here an example:
>
> I logon from LAN_2 to a ftp server in LAN_1 through the gateway via DNAT .
> no problem.
> Now i flush the prerouting chain, remove the rule, whatever.
> DNAT should not be allowed now anymore.
> But the host in LAN_2 still has an open ftp connection and has access to
> the host in LAN_1 until the ftp session is over.
>
> But this must not be possible, i want to avoid it .
>
> I think the host can still be accessed because the connection tracking
> module
> still has the entries of the session stored.
> I tried to "restart" the firewall ( -> flushed _all_ chains, & reset _all_
> rules without dnat the rule) but the connection was still alive.

Only the first packet in a stream will hit the nat-table, so if you remove 
the PREROUTING chain after the connection has already been setup, the 
connection will persist.


> ( if it interests you , new connections to LAN_1_ADDR couldnt be started of
> course ).
>
> Does anyone know how to solve this problem ?

I believe it can only be fixed in the filter module somehow, as all packets 
travel through the filter module. You may insert a rule to the FORWARD chain, 
to block the FTP-traffic from this IP-address; this should take immediate 
effect.

Jan Humme.

