From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Weird TCP flags?
Date: Sat, 13 Dec 2003 14:41:16 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312131441.17121.Antony@Soft-Solutions.co.uk>
References: <003101c3c065$f61ad790$13fea8c0@melita.com> <20031213140043.GB229@2fkft.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031213140043.GB229@2fkft.com>
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

On Saturday 13 December 2003 2:00 pm, Akos Szalkai wrote:

> > Dec 11 22:58:52 lucy kernel: Fwd DMZ->Internet DROP: IN=eth1 OUT=ppp0
> > SRC=192.168.254.242 DST=204.157.6.223 LEN=60 TOS=0x00 PREC=0x00 TTL=63
> > ID=56169 DF PROTO=TCP SPT=80 DPT=56319 WINDOW=32476 RES=0x00 ACK SYN
> > URGP=0
>
> I have also been seeing this kind of logs on our web server, and this is
> my explanation.  Probably it is an incoming HTTP connection (ie. SYN
> packet) from a spoofed source address (204.157.6.223 in this case).
> Your web server sends a syn-ack response, which the firewall in front of
> 204.157.6.223 silently drops (since it never saw the first packet of the
> connection).

If the firewall never saw the first packet, how did it get to the web server?

It doesn't matter whether the source IP is spoofed or not, the only way for a 
packet to get to the web server should be through the firewall, and both will 
see the same source address, neither knows whether it's genuine or not.

Antony.

-- 
There are two possible outcomes:

 If the result confirms the hypothesis, then you've made a measurement.
 If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

                                                     Please reply to the list;
                                                           please don't CC me.


