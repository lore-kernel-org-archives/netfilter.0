From: "yomega" <yomega@wahooo.net>
Subject: AW: OK the last one: IP Accounting
Date: Sun, 23 Jun 2002 10:10:36 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <NFBBLDBMIDIOFPBNLEAJKEKECHAA.yomega@wahooo.net>
References: <20020623100427.N5183@oknodo.bof.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020623100427.N5183@oknodo.bof.de>
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
To: netfilter@lists.samba.org

Mornin ppl :)

Thx 4 all the nice answers, i think i got it now and i set up Accounting for
my POP3 Server.

Please take a look at this:

----------------------------------------------------------------------------
------------
Chain INPUT (policy ACCEPT 2576K packets, 358M bytes)
 pkts bytes target     prot opt in     out     source
destination

   48  2216 pop3       tcp  --  any    any     anywhere             anywhere
       tcp dpt:pop3
    0     0 pop3       udp  --  any    any     anywhere             anywhere
       udp dpt:pop3

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination


Chain OUTPUT (policy ACCEPT 2474K packets, 1492M bytes)
 pkts bytes target     prot opt in     out     source
destination

    0     0 pop3       udp  --  any    any     anywhere             anywhere
       udp spt:pop3
   43  8436 pop3       tcp  --  any    any     anywhere             anywhere
       tcp spt:pop3

Chain pop3 (4 references)
 pkts bytes target     prot opt in     out     source
destination

   40  1837            tcp  --  any    any     anywhere             anywhere
       tcp dpt:pop3
    0     0            udp  --  any    any     anywhere             anywhere
       udp dpt:pop3
    0     0            udp  --  any    any     anywhere             anywhere
       udp spt:pop3
    9   434            tcp  --  any    any     anywhere             anywhere
       tcp spt:pop3
----------------------------------------------------------------------------
------

Wohoo got a lit big... but i think i got all traffic passing my NIC... do u
think so too?


Nice morning, nice day :)

Greetings
Stephan


> -----Ursprungliche Nachricht-----
> Von: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org]Im Auftrag von Patrick Schaaf
>
>
> Yo Mega,
>
> > iptables -A httpd_accounting -p tcp --dport 80
> > iptables -A INPUT -p tcp --dport 80 -j httpd_accounting
> > iptables -A OUTPUT -p tcp --dport 80 -j httpd_accounting
> >
> > Now I'm finished !!?
>
> I don't think so.
>
> > You think this is OK?
>
> No.
>
> > Or do I count some traffic twice?
>
> No.
>
> > And, of course, have i counted ALL the traffic?
>
> No.
>
> You now count traffic from clients to your HTTP server, as well as
> packets from your server machine to OTHER HTTP servers.
>
> In the OUTPUT chain rule, change "--dport" to "--sport", and then you
> will be finished, and count both packets to and from your port 80.
> In general, when going from INPUT rules to OUTPUT rules for the same
> thing, switch sources and destinations.
>
> best regards
>   Patrick
>
>


