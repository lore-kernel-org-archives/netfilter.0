From: "Payam Chychi" <pchychi@gmail.com>
Subject: Re: Bug in limit match?
Date: Wed, 17 Dec 2008 07:02:01 -0800
Message-ID: <f08c15d10812170702i443f4963t91913747a6925be0@mail.gmail.com>
References: <4948C9F9.5010803@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=CJxfHWxBCWcnUMQ5EVC274myysiVLxLFYqNrfgx1N7M=;
        b=qTVs9BmegB8LRXpYw0luDI5IMbY1ZyY44XQkoIT38yMPczq22TkCdcr2UTsuHnjIeR
         UA363XNdoA36H+Ru62SYCmM8WW24G+JE4WftKdJ6c42piKKz3KS0duHRTMkmLjab/Ohi
         oOL/NBbWhkSBtgTRQes2E0TCt5AlToMASwz60=
In-Reply-To: <4948C9F9.5010803@chello.at>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mart Frauenlob <mart.frauenlob@chello.at>
Cc: netfilter@vger.kernel.org

Hey,

The algorithm used in iptables for the limit feature is incorrect and
so for example the value for the $time is only estimated and also
cannot go above 1000 packets per second unless u use a limit of 10000
and a burst of 500 which estimates to give you around 10,000 pps. Ive
tried fixing it but ive had no luck

better luck to you

-- 
Payam Tarverdyan Chychi
Network Security Specialist / Network Engineer


On Wed, Dec 17, 2008 at 1:44 AM, Mart Frauenlob
<mart.frauenlob@chello.at> wrote:
> Hello netfilter user mailing list!
>
> I think i discovered a small problem with the limit match of iptables:
>
> eris:~# iptables -A INPUT -i eth2 -s 123.123.123.123 -m limit --limit 1/day
> -j LOG
> iptables: Invalid argument
> eris:~#
>
> eris:~# iptables -A INPUT -i eth2 -s 123.123.123.123 -m limit --limit 2/day
> -j LOG
> eris:~# echo $?
> 0
> eris:~#
>
> eris:~# iptables -A INPUT -i eth2 -s 123.123.123.123 -m limit --limit 3/day
> -j LOG
> iptables: Invalid argument
> eris:~#
>
> eris:~# iptables -A INPUT -i eth2 -s 123.123.123.123 -m limit --limit 4/day
> -j LOG
> eris:~# echo $?
> 0
> eris:~#
>
> the invalid argument error, happens with 1/d(ay) or 3/d(ay) limt rate value.
> not that i really want to log 1 or 3 packets a day, but... looks like a bug
> to me.
>
> eris:~# iptables -V
> iptables v1.3.6
>
> debian etch:
> eris:~# uname -a
> Linux eris 2.6.18-6-686 #1 SMP Mon Oct 13 16:13:09 UTC 2008 i686 GNU/Linux
>
>
> Also the man page says:
> A rule using this extension will match until this limit is  reached  (unless
>  the  `!' flag is used).
>
> well...:
>
> eris:~# iptables -A INPUT -i eth2 -s 123.123.123.123 -m limit ! --limit 3/s
> -j LOG
> iptables v1.3.6: limit does not support invert
> Try `iptables -h' or 'iptables --help' for more information.
> eris:~#
>
> eris:~# iptables -A INPUT -i eth2 -s 123.123.123.123 -m limit --limit ! 3/s
> -j LOG
> iptables v1.3.6: limit does not support invert
> Try `iptables -h' or 'iptables --help' for more information.
> eris:~#
>
> Either the man page, or the program is wrong. Or does the man page refer to
> negating any other value in the rule? I could not think about anything
> reverting the limit match.
>
> Please correct me if i'm wrong!
> If this should be bug reported, what would I need to do?
> Maybe this is fixed in newer releases of iptables. I don't know.
>
> Good day
>
> Mart
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
