From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Weird TCP flags?
Date: Sat, 13 Dec 2003 14:50:58 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312131450.58938.Antony@Soft-Solutions.co.uk>
References: <003101c3c065$f61ad790$13fea8c0@melita.com> <20031213140043.GB229@2fkft.com> <200312131441.17121.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312131441.17121.Antony@Soft-Solutions.co.uk>
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

On Saturday 13 December 2003 2:41 pm, Antony Stone wrote:

> On Saturday 13 December 2003 2:00 pm, Akos Szalkai wrote:
> > > Dec 11 22:58:52 lucy kernel: Fwd DMZ->Internet DROP: IN=eth1 OUT=ppp0
> > > SRC=192.168.254.242 DST=204.157.6.223 LEN=60 TOS=0x00 PREC=0x00 TTL=63
> > > ID=56169 DF PROTO=TCP SPT=80 DPT=56319 WINDOW=32476 RES=0x00 ACK SYN
> > > URGP=0
> >
> > I have also been seeing this kind of logs on our web server, and this is
> > my explanation.  Probably it is an incoming HTTP connection (ie. SYN
> > packet) from a spoofed source address (204.157.6.223 in this case).
> > Your web server sends a syn-ack response, which the firewall in front of
> > 204.157.6.223 silently drops (since it never saw the first packet of the
> > connection).
>
> If the firewall never saw the first packet, how did it get to the web
> server?

Sorry - I misread your posting at first - I realise now you were saying that 
the firewall in front of the spoofed address never saw the first packet, so 
it drops the second one.

However, the above log entry is from the firewall in front of the web server - 
as far as it is concerned, it saw the first packet, and it saw the second 
packet.   I'm not sure there's an explanation yet for why it decided to drop 
and log the second packet.

Antony.

-- 
If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

                                                     Please reply to the list;
                                                           please don't CC me.


