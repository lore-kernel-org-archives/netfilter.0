From: Mekabe Ramein <mrmrmrmr@gmail.com>
Subject: Re: LED trigger in iptables
Date: Thu, 26 Nov 2009 23:15:55 +0200
Message-ID: <5c0c5c050911261315h2daea812rac027c51fd4df2bd@mail.gmail.com>
References: <5c0c5c050911241359m7c8aeccqad728fe3272cb3e3@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type;
        bh=3Pran7KiS67mz6Dve4pQJ988yRdnMjzQ8gUbx8mnR18=;
        b=GnnsCsuBeoyKkNtlgthkJp2vXMW4dVCKcgRXxD3qW7CZwHUT3FYGN0xURKHPB5pEmb
         u9GVcF6pML8EaEhhdxIQZX+ZdG0JDnaLrxvvRnYw9rolxdPhHdbsHOu8EGzdcY60yF5Z
         0kOGU94Xsc2xhoJs4FH0nUcfKFJXjCthTe4sY=
In-Reply-To: <5c0c5c050911241359m7c8aeccqad728fe3272cb3e3@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'd appreciate any ideas.

Thanks,
ilker

On Tue, Nov 24, 2009 at 11:59 PM, Mekabe Ramein <mrmrmrmr@gmail.com> wrote:
> Hi,
>
> I am trying to use xt_LED module which is included in my kernel.
> However, "iptables" does not accept the "--led-trigger-id" parameter
> in the following command (which is an example given in module
> description):
>
> iptables -A OUTPUT -p udp --dport 5060 -j LED --led-trigger-id sip
> --led-delay 100
>
> My iptables version is 1.4.5 but it does not have the extension xt_LED in it.
> So I searched for this and found a patch which adds this feature. But
> I don't know where to apply the patch.
> How can I make use of it ?
>
> Should I include it in iptables source or another package ?
>
> Thanks,
>
