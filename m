From: Ilguiz Latypov <ilguiz@nit.ca>
Subject: Re: Simultaneous VPN connections
Date: Tue, 4 Mar 2003 15:01:30 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0303041446230.28895-100000@localhost.localdomain>
References: <1668.64.81.237.3.1046803515.squirrel@mail.tgpsolutions.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1668.64.81.237.3.1046803515.squirrel@mail.tgpsolutions.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bailey Kong <bailey@tgpsolutions.com>
Cc: netfilter@lists.netfilter.org


On Tue, 4 Mar 2003, Bailey Kong wrote:

> Host1 ---------> Iptables/GW ------> Router ------> INET -----> VPN Server
> (192.168.1.10)   SNAT                NO NAT
>                                        ^
>                                        |
> Host2 ---------------------------------|
> (INET IP different from the one Iptables/GW uses)
>
> This is how we are able to get 2 connections to the VPN Server, now the
> people that setup the VPN Server claim that there aren't any limits like 1
> connection per IP or anything like that, I'm also wondering, if you ever
> could make more than 1 connection to a VPN Server from the same IP. I'm
> not very familiar with VPNs.

You are right, at least one NAT gateway should take care of the call ID
numbers the clients assign themselves.  These numbers are rewritten by
iptables so that when replies come back from the PPTP server, iptables
will be able to demultiplex the data among the clients.

Likewise, the PPTP server itself should better take care of assigning
unique call ID numbers to every incoming call.  The server then passes its
call ID number to the client over TCP.  Now multiple clients with the same
source IP address will be demultiplexed by the PPTP server thanks to the
peer (destination) call ID field of the GRE header.

Check this out as well:

http://sourceforge.net/docman/display_doc.php?docid=14460&group_id=44827

--
Ilguiz Latypov
Net Integration Technologies, Inc

tel. +1 (514) 281 9191 x 117




