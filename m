From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: strange connetions to exodus.net
Date: Sat, 21 Feb 2004 12:34:57 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402211234.57952.JALaramie@Loudoun-Fairfax.com>
References: <20040221122547.1cb9a3eb.anmeyer@gmx.net> <200402211136.22220.JALaramie@Loudoun-Fairfax.com> <20040221181940.7dc7d439.anmeyer@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040221181940.7dc7d439.anmeyer@gmx.net>
Content-Disposition: inline
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

On Saturday 21 February 2004 12:19, Andreas Meyer wrote:
> Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com> wrote:
> > > Ted:
> > >
> > > Feb 21 16:59:22 delta kernel: DROP-TCP :IN= OUT=eth1 SRC=192.168.20.60
> > > \ DST=209.225.11.237 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=0 PROTO=TCP \
> > > SPT=41504 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0
> > > Feb 21 16:59:23 delta kernel: DROP-TCP :IN= OUT=eth1 SRC=192.168.20.60
> > > \ DST=82.139.196.116 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=22160
> > > PROTO=TCP \ SPT=41501 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0
> > >
> > > Good point but this is my own site at 82.139.196.116 and I am sure
> > > there is nothing pointing to exodus.net. Is this a DNS thing?
> >
> > I don't see any IPs in your postings that point to exodus.net so I don't
> > know where you're seeing that. The IP in your first posting is most
> > likely adware running on the client 192.168.20.60 and the IP in your 2nd
> > posting doesn't resolve. You need to check the processes running on
> > 192.168.20.60 to see which one is calling these sites.
>
> # dig -x 209.225.0.6
>
> ; <<>> DiG 9.2.2 <<>> -x 209.225.0.6
> ;; global options:  printcmd
> ;; Got answer:
> ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 65525
> ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 4, ADDITIONAL: 0
>
> ;; QUESTION SECTION:
> ;6.0.225.209.in-addr.arpa.      IN      PTR
>
> ;; ANSWER SECTION:
> 6.0.225.209.in-addr.arpa. 3600  IN      PTR     servedby.advertising.com.
>
> ;; AUTHORITY SECTION:
> 0.225.209.in-addr.arpa. 3600    IN      NS      dns03.exodus.net.
> 0.225.209.in-addr.arpa. 3600    IN      NS      dns04.exodus.net.
> 0.225.209.in-addr.arpa. 3600    IN      NS      dns01.exodus.net.
> 0.225.209.in-addr.arpa. 3600    IN      NS      dns02.exodus.net.
>
> ;; Query time: 290 msec
> ;; SERVER: 192.168.1.75#53(192.168.1.75)
> ;; WHEN: Sat Feb 21 18:01:40 2004
> ;; MSG SIZE  rcvd: 170
>
> # dig -x 209.225.11.237
>
> ; <<>> DiG 9.2.2 <<>> -x 209.225.11.237
> ;; global options:  printcmd
> ;; Got answer:
> ;; ->>HEADER<<- opcode: QUERY, status: NXDOMAIN, id: 64855
> ;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 1, ADDITIONAL: 0
>
> ;; QUESTION SECTION:
> ;237.11.225.209.in-addr.arpa.   IN      PTR
>
> ;; AUTHORITY SECTION:
> 11.225.209.in-addr.arpa. 3600   IN      SOA     dns01.exodus.net.
> hostmaster.exodus.net.11.225.209.in-addr.arpa. 2002091300 10800 3600 604800
> 86400
>

exodus.net is simply providing DNS for the servedby.advertising.com site. 
That's probably not relevent to your concerns.

>
> My LAN looks like this:
>
> WKS 192.168.1.3 connection per webbrowser to Squid at 192.168.1.75
> and the request from Squid is routed to the gateway 192.168.20.210
>
> and as soon I start a request a tail -f /var/log/firewall on the
> Squid-machine shows the request the above IPs. I don't known why.

As I said earlier, the request to these sites is coming from 192.168.20.60. 
You need to look at the processes running on that box to see what is calling 
that website. It's probably adware but there's no way to know for sure from 
an iptables log entry.

Jeff


