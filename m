From: Tiago <tiago.deb@gmail.com>
Subject: Re: Where is nfmark stored on a package?
Date: Thu, 22 Nov 2007 18:57:32 +0000
Message-ID: <9c1c9eb80711221057j40fd4345o3b94c7fdc7c07516@mail.gmail.com>
References: <1195750926.19128.5.camel@ws-diego.consuldata.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=UjB/65Uf9S//Ylo9THXiYcwZdE8gpPmJjvtfV25yiQk=;
        b=M3rpu7tJQm9ScVpnfezebnp/Ce45lmhSIIsLVfEA1aROKA6ZEDowZwjpCtdkngwZh5w+s5/GqdPnrErNL34WZ5wwT1dk1+yOeRPhDYAbF983koDZcoNrZKIrjDMLj8By/XXNv5SWlRdTC80Y7d4xHHBE/Hvb99MZO32i5GDcyRk=
In-Reply-To: <1195750926.19128.5.camel@ws-diego.consuldata.lan>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Nov 22, 2007 5:02 PM, Diego Alencar Alves de Lima
<listas@diegolima.org> wrote:
> Greetings,
>
> I was reading documentation about using iptables's connmark along with
> iproute2, but I didn't find documentation about how exactly this package
> marking is done. I read on some places that it isn't done by changing
> any TCP header. How exactly does that work?
>
> Thank you.
>
> --
> Diego Alencar Alves de Lima
> Linux User #405564
> http://www.diegolima.org
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

Hi Diego,

The netfilter mark the nfmark field, in the IP packets, for QoS
reasons. But this marking cannot be forwarded on the IP packets, is
only used in the kernel space, is not forwarded over the network.

The comment on the kernel of this skbuff field is:
@nfmark: Can be used for communication between hooks

You could modify the field DSCP, this is forwarded in the IP packets
over the network.

Regards

Tiago
