From: "Maciej Soltysiak" <solt@dns.toxicfilms.tv>
Subject: Re: Rules for DNS
Date: Thu, 29 Jan 2004 16:39:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002501c3e67e$2b787c10$0e25fe96@pysiak>
References: <1075389910.2794.6.camel@dchws.TQMcube.com>
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
To: Iptables Mailing List <netfilter@lists.netfilter.org>

> I am terribly confused about what I need to accept and reject and the
> associated IPTables rules for Bind to work properly without exposing our
> server to exploits. Right now, I'm pretty much accepting all traffic to
> and from port 53 and that's "probably" not a good thing. I'm running
> IPtables on the same machine running Bind.

> Can someone point me in the right direction?
Well, all DNS servers use udp/53 for queries and replies,
when the reply is over 512 bytes, tcp/53 is used.
tcp/53 is also used for zone transfers.

Bind also uses port 953 for remote control.

No matter if you are using a caching server or a master or slave
server, you need 53 od both udp and tcp.

Advisories about filtering tcp/53 traffic to prevent zone
transfers is crazy. You just allow zone transfers to trusted
hosts and deny to everyone else by DNS configuration.

If you are using one DNS server, port 953 is used only on localhost.
So, give udp/53 and tcp/53 to everybody you want to use your
nameserver. If it is a caching server, allow only trusted IPs
and strenghten your named configuration to allow only trusted IPs
also.
If it is a master or slave server for public Internet zones,
you want everybody to be able to ask the server for DNS resources,
so Open udp/53 and tcp/53 to everybody.

Limit tcp/953 to localhost only if this server is not to be
remotely controlled.

The simple thought is this:
In case of DNS use a firewall only to decide who should and who
should not access the service.
For security turn to trusted software known to be stable and
secure, and good configuration of the daemon.


Regards,
Maciej


