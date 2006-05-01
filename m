From: "David Leangen" <netfilter@leangen.net>
Subject: RE: Tracking down the source of proxy problem
Date: Mon, 1 May 2006 20:33:29 +0900
Message-ID: <DGEJKHJNFFKAGKLEMOPJAEAPCBAA.netfilter@leangen.net>
References: <002401c66d0b$de1abd40$0101000a@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002401c66d0b$de1abd40$0101000a@sterenborg.info>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Hello, Rob,

> > firewall iptables (in port number edited):
> >
> >   *nat
> >   :PREROUTING ACCEPT [0:0]
> >   :POSTROUTING ACCEPT [0:0]
> >   :OUTPUT ACCEPT [0:0]
> >   -A PREROUTING -p tcp --dport ##INPORT## -j DNAT --to
> > 192.168.2.10:5432
> >   -A PREROUTING -p udp --dport ##INPORT## -j DNAT --to
> > 192.168.2.10:5432
> >   -A POSTROUTING -o ppp0 -j MASQUERADE
> >   COMMIT
>
> These are only NAT rules. What about the FORWARD rules ?

Sorry, left them out because I didn't think they were relevant... here they
are (SOME_PORT means that there are similar lines for various ports... but
none are 5432 or related to Postgres, since this proxy machine does not host
the DB):

*filter
:INPUT DROP [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:BLACKLIST - [0:0]
:LOG_ACCEPT - [0:0]
:LOG_DROP - [0:0]
:icmp_packets - [0:0]
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p tcp -m tcp --dport ##SOME_PORT## -j LOG_ACCEPT
-A INPUT -s 127.0.0.1 -j ACCEPT
-A INPUT -p icmp -j icmp_packets
-A INPUT -j LOG_DROP
-A LOG_ACCEPT -j LOG --log-prefix "[IPTABLES ACCEPT] :
" --log-tcp-options --log-ip-options
-A LOG_ACCEPT -j ACCEPT
-A LOG_DROP -j LOG --log-prefix "[IPTABLES DROP] :
" --log-tcp-options --log-ip-options
-A LOG_DROP -j DROP
COMMIT

Thanks!
Dave



