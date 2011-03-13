From: Changli Gao <xiaosuo@gmail.com>
Subject: Re: [PATCH] ipv4: netfilter: ipt_CLUSTERIP: fix buffer overflow
Date: Sun, 13 Mar 2011 22:00:03 +0800
Message-ID: <AANLkTimPZJoCzz386e-4m0Y4khWGZirZguGFmuFYCrry@mail.gmail.com>
References: <1299780740-32652-1-git-send-email-segoon@openwall.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=Cim7IdF6qmY2ames4FHk6in2HOIcnSSsTQg9DVc31jQ=;
        b=QEhCSIM3P9pqh4s0xBKpF9DAcTdAPzQDCEZFY/Az3azyhYd2hdgcwlOtqD9wW9ClFC
         UeZG7lFPoD9WnPUzF5xtPB7AuraxG01XV/MUl76miUZI0TOakvz7F2aOyTzQb08kN1O1
         R7SHIEuAxHS16AqTLZAB/YLL0Df0N1sariWUk=
In-Reply-To: <1299780740-32652-1-git-send-email-segoon@openwall.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vasiliy Kulikov <segoon@openwall.com>
Cc: linux-kernel@vger.kernel.org, security@kernel.org, Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org

On Fri, Mar 11, 2011 at 2:12 AM, Vasiliy Kulikov <segoon@openwall.com> =
wrote:
> buffer string is copied from userspace. =A0It is not checked whether =
it is
> zero terminated. =A0This may lead to overflow inside of simple_strtou=
l().
>
> It was introduced before the git epoch. =A0Files "ipt_CLUSTERIP/*" ar=
e
> root writable only by default, however, on some setups permissions mi=
ght be
> relaxed to e.g. network admin user.
>
> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
> ---
> =A0Compile tested.
>
> =A0net/ipv4/netfilter/ipt_CLUSTERIP.c | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/net/ipv4/netfilter/ipt_CLUSTERIP.c b/net/ipv4/netfilter/=
ipt_CLUSTERIP.c
> index 403ca57..7aabf9a 100644
> --- a/net/ipv4/netfilter/ipt_CLUSTERIP.c
> +++ b/net/ipv4/netfilter/ipt_CLUSTERIP.c
> @@ -666,6 +666,7 @@ static ssize_t clusterip_proc_write(struct file *=
file, const char __user *input,
>
> =A0 =A0 =A0 =A0if (copy_from_user(buffer, input, PROC_WRITELEN))

I think size should be used instead of PROC_WRITELEN.

if (size > PROC_WRITELEN)
     return -EIO;
if (copy_from_user(buffer, input, size))
    return -EFAULT;
buffer[size] =3D '\0';

> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EFAULT;
> + =A0 =A0 =A0 buffer[sizeof(buffer)-1] =3D 0;
>
> =A0 =A0 =A0 =A0if (*buffer =3D=3D '+') {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nodenum =3D simple_strtoul(buffer+1, N=
ULL, 10);



--=20
Regards,
Changli Gao(xiaosuo@gmail.com)
--
To unsubscribe from this list: send the line "unsubscribe netfilter-dev=
el" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
