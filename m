From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: order of HOOK functions
Date: Tue, 23 Mar 2010 21:43:32 +0530
Message-ID: <cfeab66d1003230913u499712dbp164e2fdb72a6491a@mail.gmail.com>
References: <cfeab66d1003230911q931ed69od7d0d38b013a175b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=dAGkfEU9ho7mMUOVlWinXiRN10Nnh3weRH7k+mS9lJw=;
        b=bj6L1U2Z53zTcPW0xKAievBRYi+a6iJQJnnZjohATI/sGHcfsGvN1O6KOUmxpSFue5
         djMbNOMlFrOagIDLFZpNNkhKYUVwj7LU6J0dKiIE5u+NTV/PURObnKIHIG16W9XRlWAG
         nxT3FiQkSwWyfkCHV22MyXGnObjtUBeLpJJNU=
In-Reply-To: <cfeab66d1003230911q931ed69od7d0d38b013a175b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Tue, Mar 23, 2010 at 9:41 PM, ratheesh k <ratheesh.ksz@gmail.com> wr=
ote:
> I have a rule
>
> R1------> =A0iptables -A FORWARD =A0-j ACCEPT =A0-
>
> After applying =A0the above rule , i executed the below program
>
>
> *********************************************************************=
***********************************
> /* copied from http://sts.synflood.de/dump/doc/p61-0x0d_Hacking_the_L=
inux_Kernel_Network_Stack.txt
> */
>
>
> =A0 /* Initialisation routine */
> =A0 =A0 =A0 =A0 =A0int init_module()
> =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Fill in our hook structure */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0nfho.hook =A0 =A0 =3D hook_func;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Handler function */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0nfho.hooknum =A0=3D NF_IP_PRE_ROUTING; /* =
=46irst for IPv4 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0nfho.pf =A0 =A0 =A0 =3D PF_INET;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0nfho.priority =3D NF_IP_PRI_FIRST; =A0 /* =
Make our func first */
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0nf_register_hook(&nfho);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
> =A0 =A0 =A0 =A0 =A0}
>
> /* This is the hook function itself */
> unsigned int hook_func(unsigned int hooknum,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct sk_buff **skb,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct net_device *=
in,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct net_device *=
out,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int (*okfn)(struct sk_buf=
f *))
> {
> =A0 =A0return NF_DROP; =A0 =A0 =A0 =A0 =A0 /* Drop ALL packets */
> }
>
> *********************************************************************=
*********************************************************
> I executed below rule - R2 =A0 .
>
> R2 =A0 --- > iptables =A0-I =A0FORWARD -j REJECT .
>
>
> Question : to which target is chosen ( DROP or REJECT or ACCEPT ) . {
> order of hook function ?? }
>
> Thanks,
> RAtheesh



There is a mistake in the question . Hook is NF_IP_FORWARD  .

Thanks,
Ratheesh
