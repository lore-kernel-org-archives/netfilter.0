From: woksy@ether.net1.nerim.net
Subject: Re: iptables and ads
Date: Mon, 11 Aug 2003 21:38:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308111814.57102.mdily.ether@nerim.fr>
References: <200308111738.35713.woksy@ether.net1.nerim.net> <200308111751.36820.andre@highsecure.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200308111751.36820.andre@highsecure.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Thank you a lot for your help people, I think Amie gave me the best way t=
o=20
solve my problem ;-)
It was really fast, thanks ;-)


Le Lundi 11 Ao=FBt 2003 17:51, Andre Lorenz a =E9crit :
 Am Montag, 11. August 2003 17:38 schrieb woksy@ether.net1.nerim.net:
 > Hi people ! ;-)
 > I was just answering myself if i could stop ads loading from web pages
 > such as yahoo, lycos, & co ? (i don't mean blocking popup, just stoppi=
ng
 > those boring ads from loading)
 > I tried to do this with something like that:
 > $IPTABLES -A INPUT -i $EXTIF -s 216.73.92.112/32 -j drop-and-log-it
 > but it seems that I mistaked.
 > Can anybody help me please ?
 > Thanks

 Hello,

 I would solve this like this way

 iptables  -N  drop-and-log-it
 iptables -A input -i $EXTIF -j drop-and-log-it
 iptables -A drop-and-log-it  -s 216.73.92.112/32 -j DROP
 iptables -A drop-and-log-it  -s 216.73.92.112/32 -j LOG --log-prefix
 "SOMETHING_TEXT: "

 It isn't elegant, but it might work

 mfg
 Andre


