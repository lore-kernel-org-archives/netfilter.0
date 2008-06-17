From: "=?ISO-8859-1?Q?Javier_G=E1lvez_Guerrero?=" 
	<javier.galvez.guerrero@gmail.com>
Subject: Re: Duplicated multicast packets with -j ROUTE --tee
Date: Tue, 17 Jun 2008 15:39:25 +0200
Message-ID: <145d4e1a0806170639l1ef3eef5g70be859b47c3e04e@mail.gmail.com>
References: <145d4e1a0806170243m1eb8a6bds888f8e9bd4146d92@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=ltzubz5xX5OFKPPa3/eZYXKEtZ2J0FBCUWCu9rdW7Bc=;
        b=FpfYkBH2epNb2DZm0qhra4FqGmNhcvBH6RgIlIjroBKQV54q/3nSCEkuNgAtdibPc6
         kLhuSQXtnTQKftjucEN7PbzDftDM74tvOF62M0uSqpna6osltQtd2Uzl9a713ksYX/lP
         CD88zlgq0GQwYpsWP5y5m4mKz6wdetuLisJKE=
In-Reply-To: <145d4e1a0806170243m1eb8a6bds888f8e9bd4146d92@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi again,

Although I thought the ROUTE target was installed, the file
ip_tables_targets is completely empty and it should contain the
applied targets, shouldn't it? So, I'm trying to patch the kernel with
the ROUTE target following the patch-o-matic tutorial in netfilter.org
site.

The problem is that when I click 'y' in order to install the ROUTE
target/patch the following error message appears:

    unable to find ladd slot in src /tmp/pom-10667/net/ipv6/netfilter/M=
akefile

The number in pom-XXXX changes each time I try to patch the kernel (it
seems obvious as it is located in the tmp directory). Anyway, I don't
know how to cope with this.

As you can see, I'm not an experienced kernel patcher, so that's why I
would appreciate any help you could provide to me.


Thanks a lot,
Javi

2008/6/17 Javier G=E1lvez Guerrero <javier.galvez.guerrero@gmail.com>:
> Hi everyone,
>
> I'm a complete newbie with iptables. I've read some tutorials from
> netfilters.org in order to have a look about how to proceed. I'm
> generating a multicast flow and, in order to take some research
> results, I would like to duplicate the packets in the source computer
> through the ethernet interface.
>
> I'm working in a Debian machine with kernel 2.6.18-6-686 and iptables
> version 1.3.6. I have done some research with google and, eventually,
> I've tried this:
>
>  # iptables -t mangle -A OUTPUT -d 239.255.1.0/24 -o eth0 -j ROUTE
> --tee --oif eth0
>
> but I obtain:
>
>  iptables: No chain/target/match by that name
>
> Besides that, if I try the same without specifying what ROUTE should =
do:
>
>  # iptables -t mangle -A OUTPUT -d 239.255.1.0/24 -o eth0 -j ROUTE
>
> I get:
>
>  iptables v1.3.6: ROUTE target: oif, iif or gw option required
>  Try `iptables -h' or 'iptables --help' for more information.
>
> Then, I think that the ROUTE target is included in the kernel, so I
> suppose there's no need to apply a patch and recompile the kernel but
> I don't know what to do in order to succeed in this.Hi everyone,
>
> Anyway, I would like to get some help for more experienced users or
> anyone who has dealed with this issue. Any help would be much
> appreciated.
>
>
> Thank you all,
> Javi
>
> PS: Some issues with formatted text. Sorry.
>
