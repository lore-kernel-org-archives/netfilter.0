From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: how to replace a skb in NF_IP_LOCAL_OUT hook
Date: Thu, 3 Nov 2005 22:37:51 +0100 (CET)
Message-ID: <Pine.LNX.4.61.0511032237400.14703@filer.marasystems.com>
References: <00d201c5df7f$d70cd430$060ae29f@javaboy>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00d201c5df7f$d70cd430$060ae29f@javaboy>
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
Content-Type: TEXT/PLAIN; charset="utf-8"; format="flowed"
To: jywang <jywang@cnic.cn>
Cc: netfilter <netfilter@lists.netfilter.org>

This question belongs on the developer list I think.

On Wed, 2 Nov 2005, jywang wrote:

> i want to replace the skb with my own, and in my skb i will change the =
data
> in it.
>
> How to do it?
>
> what i do as below:
>
> cp =3D skb_copy_expand(*skb, skb_headroom(*skb)+12, skb_tailroom(*skb),=
 GFP_ATOMIC);
> //change the skb->data here
> skb_set_owner_w(cp, (*skb)->sk);
> *skb =3D cp;
> return NF_ACCEPT;
>
> but, it can't work.
>
>
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> =E5=A7=93=E5=90=8D=EF=BC=9A      =E7=8E=8B=E9=87=91=E4=B8=80
> =E7=94=B5=E8=AF=9D=EF=BC=9A      (+86)10-58812325
> =E5=8D=95=E4=BD=8D=EF=BC=9A      =E4=B8=AD=E5=9B=BD=E7=A7=91=E5=AD=A6=E9=
=99=A2=E8=AE=A1=E7=AE=97=E6=9C=BA=E7=BD=91=E7=BB=9C=E4=BF=A1=E6=81=AF=E4=B8=
=AD=E5=BF=83 R&D
> =E5=9C=B0=E5=9D=80=EF=BC=9A      =E5=8C=97=E4=BA=AC=E4=B8=AD=E5=85=B3=E6=
=9D=91=E5=8D=97=E5=9B=9B=E8=A1=97=E5=9B=9B=E5=8F=B7
> =E9=82=AE=E7=BC=96=EF=BC=9A      100080
> email=EF=BC=9A     jywang@cnic.cn
> -----------------------------------------------------
> Name:       jinyi wang
> Phone:      (86-10) 5881-2325
> Division:   R&D,Computer Network Information Center,
>             Chinese Academy of Sciences
> Address:    4,4th South Street, Zhongguancun,
>             Haidian District, Beijing, China
> Zip code:   100080
> Email:      jywang@cnic.cn
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>

