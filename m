From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ftp
Date: Fri, 21 May 2004 09:26:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405210926.49734.Antony@Soft-Solutions.co.uk>
References: <BAY15-F7JmGzrLCCtgx00008f99@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F7JmGzrLCCtgx00008f99@hotmail.com>
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

On Friday 21 May 2004 3:49 am, azeem ahmad wrote:

> it is a very simple firewall with only one rule as
> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> any ways the outout of the two commands is as follow
>
> iptables -L -nvx
> Chain INPUT
> (policy ACCEPT 64966 packets, 22320338 bytes)
>     pkts      bytes target     prot opt in     out     source
> destination
>
> Chain FORWARD (policy ACCEPT 48691 packets, 11603504 bytes)
>     pkts      bytes target     prot opt in     out     source
> destination
>
> Chain OUTPUT (policy ACCEPT 154653 packets, 66215691 bytes)
>     pkts      bytes target     prot opt in     out     source
>
> iptables -L -t nat -nvx
> Chain
> PREROUTING (policy ACCEPT 9221 packets, 586315 bytes)
>     pkts      bytes target     prot opt in     out     source
> destination
>
> Chain POSTROUTING (policy ACCEPT 2693 packets, 178591 bytes)
>     pkts      bytes target     prot opt in     out     source
> destination
>        0        0 MASQUERADE  all  --  *      ppp0    0.0.0.0/0
> 0.0.0.0/0
>
> Chain OUTPUT (policy ACCEPT 6008 packets, 382374 bytes)
>     pkts      bytes target     prot opt in     out     source
> destination
>
> i m showing you the different firewall rules in different questions beacuse
> i m a student and i m working on firewall these days. but wheni try to
> access ftp then only this single rule works nothing else has been added.

Have you loaded, or compiled in, the ftp nat and ftp connection tracking 
modules?

You probably don't need the conntrack module since with the above ruleset 
you're not doing connection tracking, hiowever if you're natting ftp then you 
need the ftp nat helper loaded (or compiled into your kernel).

Regards,

Antony.

-- 
Behind the counter a boy with a shaven head stared vacantly into space,
a dozen spikes of microsoft protruding from the socket behind his ear.

 - William Gibson, Neuromancer (1984)

                                                     Please reply to the list;
                                                           please don't CC me.


