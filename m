From: Gadre Nayan <gadrenayan@gmail.com>
Subject: Re: Connection tracking notification events
Date: Tue, 8 Mar 2016 20:59:48 +0530
Message-ID: <CAKJ7aR7obCuFwMW9BDq3ytcpFw5BpUrwJa+apgvVaHfaq1U0wg@mail.gmail.com>
References: <CAD54ZaUgBnhPObX7PkJ6+pJin5ynZQwuKvVyRWSY7TdC1z9KyA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc;
        bh=97zABq83WMQ6sGtK2ov9yHToRyRTjaeB6E4MKIP+b9Y=;
        b=Gbc41ZJIbMgPLm9PuaWeyELsSF1u6lu5U3UWqSvuaYdzcL1bl2ydPprQ6qH0a48KP+
         xh2xubIjWPsS8b9GEOek67wlYYqrBYWq1ElLCvsuHKBMyl+PrErbfQfvQx86rIZoPMB+
         Gtppo52GQtjm0jju2x2PZOYTtB3AQy9A49/NouM7CrUlZ7hh8DvWP4gSHtPtM9tIjbKQ
         IUYTMDdJJAbbGkVIpSuO8sZoiQvDRKI2799SU3YJyqopKiJ9rSIHfRN+evVdwjCZQiXL
         Q/tveXwYUxnLpA4vYyFj2B4mQulXu7yTt0IRMOswtBwouQ7X79qZpZCcVOrvV6NR5bch
         B2ew==
In-Reply-To: <CAD54ZaUgBnhPObX7PkJ6+pJin5ynZQwuKvVyRWSY7TdC1z9KyA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anil kumar <anilkumar508@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Anil,

When you enable "CONFIG_NF_CONNTRACK_EVENTS" there is a notifier that
gets registered automatically.

I think you should disable this Configuration and then register your
module with your own event notifier structure.

Regards

On Tue, Mar 8, 2016 at 5:58 PM, Anil kumar <anilkumar508@gmail.com> wrote:
> Hi All,
>
> I am trying to test the connection tracking notification events.  For
> this i have enabled the config "CONFIG_NF_CONNTRACK_EVENTS" and trying
> to register for the notifications using nf_conntrack_register_notifier
> function.
>
> static struct nf_ct_event_notifier fp_conntrack_event_nb = {
>         .fcn = fp_conntrack_event,
> };
>
> ret = nf_conntrack_register_notifier(&init_net, &fp_conntrack_event_nb);
>
>
> This registration function is failing (return value is less than 0).
> Also tried in older kernel (in 3.1 kernel, the function takes single
> argument) the function is failing.
> Do we need enable any other configs ?
>
>
> Thanks,
> Anil
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
