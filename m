From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: udplite and ports
Date: Sun, 14 Mar 2010 11:13:10 +0530
Message-ID: <cfeab66d1003132143u76cb0b6i4f88005b9d50d285@mail.gmail.com>
References: <4B9B568F.7020609@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=nu2TcUwyVSptP22u1FPM/9TWXWifERKLFoEtm3ag46A=;
        b=dYOndDlwi5aw/rpIJZNH/aBKRnsQyGuJEqaGm5Z1FQtOXmvViHQaRYOC1NslHZ2tvL
         RJWp6aJ3ARK+k6sLQMHzjbzaULnR+vGdWSvGYqmtpMTCIQKAhatPgqgkVBE6jqkbil3p
         yFRhEI2HzQfwXFT+a5P2faXyOsitsPcchiWus=
In-Reply-To: <4B9B568F.7020609@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Sat, Mar 13, 2010 at 2:40 PM, Mart Frauenlob
<mart.frauenlob@chello.at> wrote:
> Hello,
>
> what am I missing, why is that command not working:
>
> iptables -A INPUT -i eth2 -p udplite --destination-port 123 -j ACCEPT
> iptables v1.4.7: unknown option `--destination-port'
> Try `iptables -h' or 'iptables --help' for more information.
>
>
> uname -a
> Linux eris 2.6.33-eris-2010-03-06 #1 Sat Mar 6 01:36:52 CET 2010 i686
> GNU/Linux
>
> -p udplite -m multiport --ports 123,124 ... works.
>
>
> Thanks for your help!
>
>
> Best regards
>
> Mart
>
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Could you try option --dport instead of  --destination-port  ?

 These options depends on the iptables librararied . You can do a "nm"
command on  all the dynamic libraried to see whether it is supported .
It could be a problem with configuration or  right library might not
be copied .


Thanks,
Ratheesh
