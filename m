From: "Ian Hunter" <ihunter@hunterweb.net>
Subject: Re: Weird TCP flags?
Date: Fri, 12 Dec 2003 08:14:24 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003c01c3c0b1$dd2b6960$b2c2a70a@melita.com>
References: <003101c3c065$f61ad790$13fea8c0@melita.com> <200312120105.01557.Alistair Tonner <>> <1071231965.1890.21.camel@jasiiitosh.nexusmgmt.com>
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
To: netfilter@lists.netfilter.org

> > > Dec 11 22:58:52 lucy kernel: Fwd DMZ->Internet DROP: IN=eth1 OUT=ppp0
> > > SRC=192.168.254.242 DST=204.157.6.223 LEN=60 TOS=0x00 PREC=0x00 TTL=63
> > > ID=56169 DF PROTO=TCP SPT=80 DPT=56319 WINDOW=32476 RES=0x00 ACK SYN
URGP=0
> >
> Is there any chance that port 80 traffic is being allowed in under a
> rule that does not enter the connection in conntrack?
> In other words, if you have a rule such as:
>
> iptables -A FORWARD -d 192.168.254.242 -p tcp --dport 80 -j ACCEPT
>
> The SYN packet will be sent to your web server and the web server will
> respond with a SYN, ACK packet but it will not be related to anything in
> the conntrack table.  The connection may be being allowed by a more
> general rule than one to the web services.
>
> So, I suppose we should ask what your ACCEPT rules look like - John

I'm absolutely doing that -- here are the relevant ACCEPTs:

iptables -A FORWARD -i ppp0 -o eth1 -p tcp --dport 80 -d 192.168.254.242 -j
ACCEPT
iptables -t nat -A PREROUTING -i ppp0 -d <my.public.ip.here> -p tcp --dport
80 -j DNAT --to-destination 192.168.254.242

If I want to forward port 80 to that box, isn't that the way to do it?  How
would a connection escape conntrack?

Thanks MUCH!

Ian


