From: David ROBERT <castlebbs@gmail.com>
Subject: Re: Log and Drop with OSSEC
Date: Thu, 13 May 2010 10:47:46 +0100
Message-ID: <AANLkTimTmGE4buHzSZCgNy5XEEhR5_h0jeJf-i9CTr85@mail.gmail.com>
References: <m2x57bfe46c1005070841of1b6cdc7paaef031f3995679b@mail.gmail.com>
Reply-To: david@ombrepixel.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:reply-to
         :in-reply-to:references:date:message-id:subject:from:to:content-type;
        bh=5ri24TbdFjrMqUPyox0bo64h+R28vUR61UGVkBdtMmk=;
        b=g9osK8L8HLwllG8WH7nJnujJ2r0Zt9GXVD2zKN2AK//xuza2z+HCmTh8l66crKuiCS
         RPojLdymBiqiMQLWKTjbFmiSrC9W70neGrw51ffD1/kaXkhfVtYQivN54HhlqyfUO5eF
         2mlu5e1c7lC5MI15iNl5olwUHTuYxJLQbHSNo=
In-Reply-To: <m2x57bfe46c1005070841of1b6cdc7paaef031f3995679b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi All,

This was too obvious so I couldn't find it... I did a "-I" for the
DROP rule, so obviously it was matched before the LOG rule... tsss..

David

2010/5/7 David ROBERT <castlebbs@gmail.com>:
> Hi All,
>
> I have a very basic question. I am updating an active response script
> for OSSEC that add DROP rules. I added rules to log packets being
> dropped:
> Ex for IP 1.1.1.1
>
> iptables -I INPUT -s 1.1.1.1 -m limit --limit 1/sec -j LOG
> --log-prefix OSSEC-HIDS --log-level 7 (rule added)
> iptables -I INPUT -s 1.1.1.1 -j DROP (original rule)
>
> It doesn't log, it actually logs if I only run the first rule, as soon
> as I run the DROP rule, it DROP packets indeed, but it won't log
> anymore.


-- 
David ROBERT
