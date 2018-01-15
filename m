From: "Oliver O'Boyle" <oliver.oboyle@gmail.com>
Subject: Re: IPSET persistence on Ubuntu 16.04
Date: Mon, 15 Jan 2018 16:19:39 -0500
Message-ID: <CAMOPTEw7szxqowE50G6XB+QECr=9DtV5HzGatt1+PiY1j4bBRQ@mail.gmail.com>
References: <CAMOPTEwan+tog9RwsuDFGWGGyHbv9cq_qmua6gmdjr4XoGM7HA@mail.gmail.com>
 <d9567a92-e4ee-0b38-f7a7-5447b9cb5b25@pkfnet.co.za>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=786CR/YwFqu/e61frk5/FaTBwAKCX0w+AXq/y+Iv8Ik=;
        b=KECjS9qU4wyvuN48Ya9BWCyawK8wJ43Y72PTx3czWS6WiJzt8GGPJ+INGrTzJS3OzX
         8LNyXYaRwz5dwr7mak8COvYq3Ge57VuoWXodanaHWhb5hvwMWH5USEp23Z9Y7g5Re90C
         FbOfxN+Ya9V2e++K+acUy7TiTabpvfwOdfX3APmbPOExUeI7UtAQaqJwuqjN5PSFj9Ap
         xPyqxfniqyvR3RiCAZkPcCZIDEXEp092AUPf1mE2SbGbb7n/v1jREBR+K8z0kKIgDQ1L
         V4JjqPeFBilKFrs0AqayQPeiPxxseQfkmgkReInBv9Ifi9QvUYXDqnsMBH+OCoas9g00
         RUmw==
In-Reply-To: <d9567a92-e4ee-0b38-f7a7-5447b9cb5b25@pkfnet.co.za>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Coetser <mark@pkfnet.co.za>
Cc: netfilter@vger.kernel.org

Mark,

I've implemented this by using :

pre-up ipset restore -! < /etc/ipset/ipset.rules
post-down ipset-save -file /etc/ipset/ipset.rules

ipset rules appear with sudo ipset -L after a reboot. So all looks good there.

However, sudo ip6tables -L still shows default rules. I'm using
iptables-persistent for iptables persistence. Do you know when
iptables-persistent is run? It looks like it's being called before the
interface is in pre-up and so it's still not able to find ipset rules.

Oliver

On Mon, Jan 15, 2018 at 3:36 AM, Mark Coetser <mark@pkfnet.co.za> wrote:
>
> On 12/01/2018 23:20, Oliver O'Boyle wrote:
>>
>> Hello,
>>
>> Just started using IPSet on Ubuntu 16.04. After reboot, my set
>> disappeared and my ip6tables config vanished, leaving my fw wide open
>> with default rules. OUCH.
>>
>> What's the proper way to do IPSet persistence on Ubuntu 16.04?
>>
>> Oliver
>>
>
> either create a script that you call from /etc/network/interfaces ie
>
> up /full/path/script
>
> that has your ipset commands
>
> or just put the ipset stuff into interfaces file
>
> auto eth0
> iface eth0 inet static
>         address x.x.x.x
>         netmask x.x.x.x
>         up ipset xxxxxx
>         up ipset xxxxxx
>
>
> --
> Thank you,
>
> Mark Adrian Coetser
> mark@pkfnet.co.za
>
> What causes the mysterious death of everyone?



-- 
:o@>
