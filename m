From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: iptables question - NAT/Masq
Date: Tue, 21 Jan 2003 01:59:01 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301210159.01621.netfilter@newkirk.us>
References: <1043079320.14910.73.camel@kolisko>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1043079320.14910.73.camel@kolisko>
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
To: - = k o l i s k o = - <kolisko@penguin.cz>, netfilter@lists.netfilter.org

On Monday 20 January 2003 11:15 am, - =3D k o l i s k o =3D - wrote:
> Hi all,
>
> i have the following situation:
>
>
> nntp clients -- [internet] --+-- server1:119
>
>                              +-> server2:119
>
> we manage the server1. It is a server with more services (web, ftp,
> pop3, ...). The new service will be nntp(119) but we dont want to
> install there a news SW. We only need forward all nntp/news traffic to
> another server - server2.
>
> server2 is not our server, but this server accept all the traffic from
> source IP address of server1. There is not possible to accept directly
> the traffic from all clients becouse they dont have the same address
> like server1 of course.
>
> What we need is to configure a server1 to accept all connections from
> clients to port 119(news) and forward it to destination server2 but
> with source address of server1.
>
> Note that server1 have only one NIC interface.
>
> I have this on the server1 and it dont work:
>
> /sbin/iptables -t nat -A PREROUTING -i eth0+ --protocol tcp
> --destination-port 119 -j DNAT --to-destination server2:119

First, you should probably be using "-i eth+", since I presume you are=20
trying to tell it to match ALL ethernet devices.

Second, all this does it change the destination of the traffic to=20
server2.  You still need to change the sourceIP of that traffic so that=20
it appears to come from server1.  Try adding this:

/sbin/iptables -t nat -A POSTROUTING -d server2 --dport 119        \
-j SNAT --to server1

where of course 'server1' and 'server2' are both replaced with their=20
corresponding IPs.

j


