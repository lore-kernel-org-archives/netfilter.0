From: foo <janhouse00@gmail.com>
Subject: Re: Forward requests to another network
Date: Mon, 2 Jan 2006 15:55:02 +0800
Message-ID: <978441da0601012355o164d4277i4ad1639c209c13d4@mail.gmail.com>
References: <978441da0601012237h4fb08379vb5c92f6104dd3043@mail.gmail.com>
	<000301c60f69$fdc97960$0101000a@sterenborg.info>
	<978441da0601012350h10e469b2p307704d4c10a75fa@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <978441da0601012350h10e469b2p307704d4c10a75fa@mail.gmail.com>
Content-Disposition: inline
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

> > Hi, say I have two external IP addresses:
> > 220.x.x.9
> > 220.x.x.173
> > Is it possible for me to forward all the requests on an ethernet card
> > (220.x.x.9) to another ethernet card (220.x.x.173) on different
>
> So the "x.x" part is the same in both IP's ?
>
> > network? I am not sure if I can do it with PREROUTING - DNAT in NAT
> > table. In my confusion, I thought it only supports external ip -> LAN
> > ip/internal ip translation. Plus I don't have the proper hardware to
> > test this out at home.
>
> If the "x.x" part and the netmask are the same, you will have a problem
> with routing ; not Netfilter.
>
> Assume :
> eth0 : 220.x.x.9                mask 255.255.255.0
> eth1 : 220.x.x.173      mask 255.255.255.0
>
> Then you probably have routes like these :
> Destination  Gateway  Genmask        Iface
> 220.x.x.0    0.0.0.0  255.255.255.0  eth0
> 220.x.x.0    0.0.0.0  255.255.255.0  eth1
>
> In this case, all routing for 220.x.x.0/24 goes via eth0 because it's
> the first routing rule that matches.
> I don't know if there are solutions that solve this problem (if so then
> I'm not aware of them), but IMHO the best and easiest solution would be
> to have different IP subnets on each network.
>
>
> Gr,
> Rob
>
>
>


I'm sorry for confusing you. To be more specifically, I would like to
forward all the requests that hit SERVER A (220.x.x.9) to SERVER B
(220.x.x.173) (different physical locations), assuming "x.x" part and
the netmask are the same, each of them only has one Ethernet card
which is connected directly to Internet.

I'm a bit confused by some iptables documentations, which claim that
--to-destination only supports LAN/Internal IP, is that true?

"iptables -t nat -A PREROUTING --dst $EXTERNAL_IP -p tcp --dport 80 -j
DNAT --to-destination $LAN_IP"

Best Regards,
Foo

