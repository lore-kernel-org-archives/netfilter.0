From: Andy Theuninck <gohanman@gmail.com>
Subject: Re: --iif argument unrecognized by iptables
Date: Mon, 26 Jan 2009 09:23:59 -0600
Message-ID: <f8a02f3e0901260723p66665a7ex35d712709b0f6207@mail.gmail.com>
References: <f8a02f3e0901251559q6324e3faqc75af6d16eba8038@mail.gmail.com>
	 <497D88FA.2060005@plouf.fr.eu.org>
	 <f8a02f3e0901260646p3791088dmb591400469cc2454@mail.gmail.com>
	 <497DD2F9.2010004@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=V1F3BhK17Z512z4MBvbtlL5iZhIwbrK9rp2wmFiZqAg=;
        b=aRlxSEEpBjYfoXyx33WUB2U9tUFblfRglNfgxEShqdXo22MaDaUQzcE3Bz6HwRQmXv
         WqbLhpJkABUmnLL2jex9ibiw8eNKNq7ewU/HerAmI1I6ralu4Dm30HLxdZ+M89TSPvY5
         kwm1G+RrGloya89ZEY9R8UehakMcM2fvOkA4o=
In-Reply-To: <497DD2F9.2010004@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Yep. iptables -j ROUTE -h | grep -i ROUTE gives no output at all. So
CentOS and/or RHEL must need rebuilding like you said.

I was actually trying to ROUTE to an IP alias to get around an ipsec
problem introduced by a Red Hat patch. If I have to rebuild something
either way, I'll go straight to the source of the trouble and
recompile openswan without the problem patch.

On Mon, Jan 26, 2009 at 9:12 AM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Andy Theuninck a =E9crit :
>>
>> iptables -j ROUTE -h gives identical output to iptables -h.
>
> Even at the very end ? It should display help about the ROUTE target =
like
> here :
>
>> ROUTE target v1.11 options:
>>    --oif       ifname          Route packet through `ifname' network
>> interface
>>    --iif       ifname          Change packet's incoming interface to
>> `ifname'
>>    --gw        ip              Route packet via this gateway `ip'
>>    --continue                  Route packet and continue traversing =
the
>>                                rules. Not valid with --iif or --tee.
>>    --tee                       Duplicate packet, route the duplicate=
,
>>                                continue traversing with original pac=
ket.
>>                                Not valid with --iif or --continue.
>
> Else it means this target is not supported by your iptables build.
> I remember that (by default ?) some versions built only shared librar=
ies for
> matches and target supported in the kernel, so you had to rebuild ipt=
ables
> after enabling a new feature in the kernel.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
