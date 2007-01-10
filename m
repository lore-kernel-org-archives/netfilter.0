From: "=?ISO-8859-1?Q?Martin_Schi=F8tz?=" <malinux@gmail.com>
Subject: Re: connlimit
Date: Wed, 10 Jan 2007 16:01:08 +0100
Message-ID: <e208f5d10701100701p70fa8c4fp38d546d7a2542d1a@mail.gmail.com>
References: <BAY110-W72EF8C8D86CC3FC5A3A1CBAB20@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY110-W72EF8C8D86CC3FC5A3A1CBAB20@phx.gbl>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Cc: netfilter@lists.netfilter.org

Had the same problem but discovered that you have to do:

 [root@shaper10 patch-o-matic-ng-20070108]# ./runme --download
Successfully downloaded external patch geoip
Successfully downloaded external patch condition
Successfully downloaded external patch IPMARK
Successfully downloaded external patch connlimit
Successfully downloaded external patch ipp2p
Successfully downloaded external patch time

etc.

- Martin

On 1/10/07, Carlos Miranda <cerlm@hotmail.com> wrote:
>
> After downloading patch-o-matic-20031219.tar.bz2 and running "# KERNEL_DI=
R=3D/usr/src/redhat/BUILD/kernel-2.6.18/linux-2.6.18.i586 ./runme pending",=
 I could not see CONNLIMIT module to path the kernel.
>
> anyone to tell with patch need to be installed to have connlimit working?
>
> Thank you,
> Carlos
>
> _________________________________________________________________
> Ligue para os seus amigos gr=E1tis. Fa=E7a chamadas de PC-para-PC pelo me=
ssenger-- GR=C1TIS
> http://get.live.com/messenger/overview
>

