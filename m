From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Microsoft VPN
Date: Thu, 1 Jul 2004 10:14:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407011014.29753.Antony@Soft-Solutions.co.uk>
References: <76408279273F86419EA113F4CC5BB13D026C5E@EXCHANGE.InsideNCS.local> <03f601c45f4a$e92dad80$1700000a@afsatke.local>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <03f601c45f4a$e92dad80$1700000a@afsatke.local>
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

On Thursday 01 July 2004 10:07 am, Wycliffe Bahati wrote:

> > We're having trouble accessing our Microsoft VPN server through an
> > iptables firewall.  The first person to connect gets in fine, but we can't
> > make concurrent VPN connections.
> >
> > /sbin/iptables -t nat -A ftolocal -p gre -j DNAT --to-destination 1.2.3.4
> > /sbin/iptables -t mangle -A ftolocal -p gre -j MARK --set-mark 1
> > /sbin/iptables -t nat -I PREROUTING 1 -p gre -j gforward
>
> Have u tried to uses snat to do a direct translation to the MS

That won't help - if you notice, the problem is not that nobody can connect, 
but that only the first user can connect.   Therefore the NAT and routing are 
working fine, but the PPTP Conntrack Helper has not been loaded, so second 
and subsequent connections are not passed on correctly to the server.

Regards,

Antony.

-- 
I don't know, maybe if we all waited then cosmic rays would write all our 
software for us. Of course it might take a while.

 - Ron Minnich, Los Alamos National Laboratory

                                                     Please reply to the list;
                                                           please don't CC me.


