From: "Marco" <marco@noope.de>
Subject: RE: iptables source net and layer7
Date: Sun, 24 Oct 2004 17:28:16 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200410241528.i9OFSXnn021412@post.webmailer.de>
References: <3063e50410240223465b0923@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3063e50410240223465b0923@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: 'George Alexandru Dragoi' <waruiinu@gmail.com>
Cc: netfilter@lists.netfilter.org

Hello!

Thanks for your answer. I tried this but do not work.
I used tcpdump to verify the packets and saw the problem.

I have 2 internet connections ppp0 and ppp1.
ppp0 is the default route, ppp1 the default route of table 10

ip route ls
217.5.xx.xx dev ppp1  proto kernel  scope link  src 217.94.xx.xx
194.231.xx.xx dev ppp0  proto kernel  scope link  src 194.231.xx.xx
192.168.178.0/24 dev eth2  scope link
192.168.0.0/24 dev eth0  scope link
192.168.11.0/24 dev eth3  scope link
192.168.10.0/24 dev eth1  scope link
169.254.0.0/16 dev eth3  scope link
127.0.0.0/8 dev lo  scope link
default dev ppp0  scope link

ip route ls table 10
default dev ppp1  scope link


the rules are:

ip rule ls
0:      from all lookup local
32765:  from all fwmark 0x3 lookup 10
32766:  from all lookup main
32767:  from all lookup default

All packets marked with 3 should pass table 10 and route over ppp1, all
others the default route ppp1.

I setup the mark of ssh:
iptables -t mangle -A PREROUTING -s 192.168.0.0/24 -m layer7 --l7proto ssh
-j MARK --set-mark 3

i tried also:
iptables -t mangle -D PREROUTING -m layer7 --l7proto ssh -j MARK --set-mark
1
iptables -t mangle -D PREROUTING -s 192.168.0.0/24 -m mark --mark 1 -j MARK
--set-mark 3

After this I can not use ssh anymore. Tested this with tcpdump.

The ssh packets which was send to the ssh host had the source address of
ppp0 but was send over ppp1.
There seems to be a problem with source address and layer7.


ppp0 = 194.231.xx.xx
ppp1 = 217.5.xx.xx

tcpdump -i ppp1

16:56:36.648537 194.231.xx.xx.3700 > 82.96.xx.xx.ssh: P
526288655:526289143(488) ack 2398434338 win 64966 (DF)
16:56:36.648624 194.231.xx.xx.3700 > 82.96.xx.xx.ssh: P 488:504(16) ack 1
win 64966 (DF)
16:56:36.859452 194.231.xx.xx.3700 > 82.96.xx.xx.ssh: . ack 1 win 64966 (DF)


You can see, the packets were send with ppp1, but have the source address of
ppp0.


Any suggestions?

- 
Marco
 
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of George Alexandru Dragoi
> Sent: Sunday, October 24, 2004 11:24 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: iptables source net and layer7
> 
> First mark without the source, then use mark match, like this
> 
> iptables -t mangle -A PREROUTING -m layer7 --l7proto http -j MARK --set-
> mark 1
> iptables -t mangle  -A PREROUTING -s 192.168.0.0/24 -m mark --mark 1
> -j MARK --set-mark 2
> 
> On Sat, 23 Oct 2004 14:16:38 +0200, Marco Balle <mb@monsterserver.de>
> wrote:
> > Hello!
> >
> > I want to mark all outgoing traffic depending on its service.
> > Example:
> >
> > eth0 = 192.168.0.1 (local interface)
> > ppp0 = 80.10.10.10 (internet 1)
> > ppp1 = 80.10.10.11 (internet 2)
> >
> > http traffic over internet 1 (ppp0) ssh traffic to interface 2 (ppp1).
> >
> > I tried the following (routing and rules are set):
> > iptables -A PREROUTING -t mangle -s 192.168.0.0/24 -p tcp --dport 80 -j
> MARK
> > --set-mark 1
> > iptables -A PREROUTING -t mangle -s 192.168.0.0/24 -p tcp --dport 22 -j
> MARK
> > --set-mark 2
> >
> > This works fine, but only for standard ports. Now I would like to use
> > layer7:
> >
> > iptables -t mangle -A PREROUTING -s 192.168.0.0/24 -m layer7 --l7proto
> http
> > -j MARK --set-mark 1
> > iptables -t mangle -A PREROUTING -s 192.168.0.0/24 -m layer7 --l7proto
> ftp
> > -j MARK --set-mark 2
> >
> > Do not work. An iptables -t mange -L -n -v does not show traffic on the
> MARK
> > rules.
> >
> > But if I do this without the source rule:
> >
> > iptables -t mangle -A PREROUTING -m layer7 --l7proto http -j MARK --set-
> mark
> > 1
> >
> > The traffic is marked. Sure, I can not open a website because the
> incoming
> > traffic is also marked and will go out to ppp0, but the layer7 works.
> >
> > Now my question:
> >
> > If I would like to use layer7, is there a way to use a source rule too?
> > Is there an other way to mark with layer7 only the http traffic with
> source
> > net 192.168.0.0/24?
> >
> > Kernel 2.4.27 patched with kernel-2.4-layer7-0.9.1.patch
> > iptables 1.2.11 patched with iptables-layer7-0.9.1.patch
> >
> > Thanks,
> >
> > Marco
> >
> >
> 
> 
> --
> Bla bla


