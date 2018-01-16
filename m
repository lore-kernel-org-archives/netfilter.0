From: "Oliver O'Boyle" <oliver.oboyle@gmail.com>
Subject: Re: IPSET persistence on Ubuntu 16.04
Date: Tue, 16 Jan 2018 13:08:36 -0500
Message-ID: <CAMOPTEz8SFPxh=eWMMmNMu8dRhyBYeOxwrfexy0-nWSjrMYk4Q@mail.gmail.com>
References: <CAMOPTEwan+tog9RwsuDFGWGGyHbv9cq_qmua6gmdjr4XoGM7HA@mail.gmail.com>
 <d9567a92-e4ee-0b38-f7a7-5447b9cb5b25@pkfnet.co.za> <CAMOPTEw7szxqowE50G6XB+QECr=9DtV5HzGatt1+PiY1j4bBRQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=1iEIxqTgp4l+5jekPzqlhj+k7rBvieVlFYwWNo2mJyE=;
        b=Ml1t/+kDtBQZ+gEat5ph5oXoJ80TBkuMxBA7DuXXXXC7/HXaDvSCQ2rVskNWUgfZAI
         6FQdWOn41xTE5xKOq8Qn4Fy1S2gj4eU1rZ32tSSFwGtLrvfWACxuq/aG/Ns816q5qOQa
         g1lY/DemQeRiZRx++inluH9O1aIJmgK9uGYYOhSudFO/PWDTVx5M96GPNGH6d81uA0bN
         9EN05kOsXFOwAIdNaxWA/czFlOZBPj4DQQkattHcsjuez2b02cCd8zIc97Sjy6q9pokw
         f9OKO/NE7smaV6xBotm9xpjEcef4cIzVWZnOBAmck2/ixpkWDdjeyrJ4EL6HAK4jK8y9
         SBbA==
In-Reply-To: <CAMOPTEw7szxqowE50G6XB+QECr=9DtV5HzGatt1+PiY1j4bBRQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Coetser <mark@pkfnet.co.za>
Cc: netfilter@vger.kernel.org

I've confirmed it's a service ordering issue. If I include these lines
in /etc/network/interfaces

pre-up ipset restore -! < /etc/ipset/ipset.rules
up /usr/share/netfilter-persistent/plugins.d/25-ip6tables restart

then ip6tables loads without issue.

I'm not super experienced with upstart and service ordering etc... Can
someone tell me if there's a better more elegant way to make use of
ipset and netfilter-persistent so that both ipset and ip(x)tables
remain persistent? Or, at least, please confirm that the way I'm doing
it above is the only (or best) way.

Thanks,
Oliver

On Mon, Jan 15, 2018 at 4:19 PM, Oliver O'Boyle <oliver.oboyle@gmail.com> wrote:
> Mark,
>
> I've implemented this by using :
>
> pre-up ipset restore -! < /etc/ipset/ipset.rules
> post-down ipset-save -file /etc/ipset/ipset.rules
>
> ipset rules appear with sudo ipset -L after a reboot. So all looks good there.
>
> However, sudo ip6tables -L still shows default rules. I'm using
> iptables-persistent for iptables persistence. Do you know when
> iptables-persistent is run? It looks like it's being called before the
> interface is in pre-up and so it's still not able to find ipset rules.
>
> Oliver
>
> On Mon, Jan 15, 2018 at 3:36 AM, Mark Coetser <mark@pkfnet.co.za> wrote:
>>
>> On 12/01/2018 23:20, Oliver O'Boyle wrote:
>>>
>>> Hello,
>>>
>>> Just started using IPSet on Ubuntu 16.04. After reboot, my set
>>> disappeared and my ip6tables config vanished, leaving my fw wide open
>>> with default rules. OUCH.
>>>
>>> What's the proper way to do IPSet persistence on Ubuntu 16.04?
>>>
>>> Oliver
>>>
>>
>> either create a script that you call from /etc/network/interfaces ie
>>
>> up /full/path/script
>>
>> that has your ipset commands
>>
>> or just put the ipset stuff into interfaces file
>>
>> auto eth0
>> iface eth0 inet static
>>         address x.x.x.x
>>         netmask x.x.x.x
>>         up ipset xxxxxx
>>         up ipset xxxxxx
>>
>>
>> --
>> Thank you,
>>
>> Mark Adrian Coetser
>> mark@pkfnet.co.za
>>
>> What causes the mysterious death of everyone?
>
>
>
> --
> :o@>



-- 
:o@>
