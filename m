From: "Darrell Dieringer" <netfilter@darrelldieringer.com>
Subject: RE: strange problem.
Date: Wed, 22 Jan 2003 11:12:09 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <IMEDICLPAGAOCBLCCKLPAEDMEMAA.netfilter@darrelldieringer.com>
References: <0E88F7C6-2D91-11D7-9D04-0003934AB744@mail.arc.nasa.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <0E88F7C6-2D91-11D7-9D04-0003934AB744@mail.arc.nasa.gov>
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

Your FORWARD chain rule needs to accept the port number as modified by
your nat rule, not the original port number.  The log message
indicates that a SYN packet destined for 192.168.0.13:5800 was
encountered.  That is the traffic you must accept for your scenario to
work.

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of
> Michael P. Ryan
> Sent: Tuesday, January 21, 2003 4:38 PM
> To: Alistair@nerdnet.ca
> Cc: netfilter@lists.netfilter.org
> Subject: Re: strange problem.
>
>
> My Mistake, thank you for clarifying that.
>
>   I have managed to make it a bit further with my problem.
> I can get a
> forward working locally from external ip to internal ip on the same
> box, but when I try to create a forward to a system on the
> internal lan
> I run into problems.
>
> I run:
>
> iptables -A FORWARD -i eth0 -o eth1 -p tcp --dport 223 -m
> state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT
> iptables -A PREROUTING -t  nat -p tcp -d my.external.ip
> --dport 223 -j
> DNAT --to 192.168.0.13:5800
>
> when I try:
> telnet my.external.ip 22it hangs and I see the following via dmesg:
>
> IN=eth0 OUT=eth1 SRC=my.external.ip DST=192.168.0.13 LEN=44
> TOS=0x10
> PREC=0x00 TTL=56 ID=63199 DF PROTO=TCP SPT=50082 DPT=5800
> WINDOW=32768
> RES=0x00 SYN URGP=0
>
> eventually the connection times out.
>
>
>


