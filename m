From: rodolphe <rodolphe.averty@oxance.com>
Subject: Re: two router connected to the internet
Date: Tue, 31 May 2005 15:54:39 +0200
Message-ID: <429C6C9F.9020609@oxance.com>
References: <429C5AA7.3050305@oxance.com>
	<Pine.LNX.4.61.0505311450550.32062@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0505311450550.32062@yvahk01.tjqt.qr>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org

I don't want to do equal Round Robin, my isps hasn't got the same=20
weight, and i have only one interface to connect to the router. I have=20
found script on the net but for as many interfaces as routers. (I can't=20
had an other interface it's an embedded system)



Jan Engelhardt a =E9crit :

>>Hello,
>>
>>i have two router connected to the internet and i want to send my tcp
>>connection between them.
>>   =20
>>
>
>If I seen right, then there is a "multipath equal cost Round Robin" meth=
od in=20
>2.6.12-rc4 which does this at the routing level, so it would not require=
 you=20
>to do at the netfilter level.
>
>
>Jan Engelhardt
> =20
>



