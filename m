From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Mon, 20 Sep 2010 13:42:19 +0100
Message-ID: <4C9756AB.5040304@googlemail.com>
References: <4C9696E5.4030803@googlemail.com> <alpine.LNX.2.01.1009200244280.5711@obet.zrqbmnf.qr> <4C973A6A.9010809@googlemail.com> <alpine.LNX.2.01.1009201421180.13430@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=wMuLZh+qBFdkUas7GwBFRdx8dkFbf2tJiY0A3L3HnxI=;
        b=i0TTA0RwskSOqiHJTP/P3SbfcpJRUuO2XjwWYQCHc16xH+TBasOJN76mwIk/Rt6WIY
         KIrJ1cbBaG/3hurDWq3lx5O0YnGge5LCl5llAGmrnIYrMggtnYSV2iHMX/Ge45DPYmBY
         6K637YwzptZaMAdzX7xQftAGuD94vrR7fFsuE=
In-Reply-To: <alpine.LNX.2.01.1009201421180.13430@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>, netfilter-owner@vger.kernel.org


> Basically `conntrack -L`. You just need to write the patch that 
> does the secmark->name translation. :-)
>   
Actually, I've got a better idea!

I spend good part of the last hour looking at the source of iptables 
(v1.4.7 as this is what comes out of my FC13 as the 'latest' rpm) and 
found this little nugget:

=====<xt_SECMARK.h>=================
struct xt_secmark_target_selinux_info {
    __u32 selsid;
    char selctx[SECMARK_SELCTX_MAX];
};
===================================

=====<libxt_SECMARK.c>===============
static void print_secmark(const struct xt_secmark_target_info *info)
{
    switch (info->mode) {
    case SECMARK_MODE_SEL:
        printf("selctx %s ", info->u.sel.selctx);\
        break;
   
    default:
        xtables_error(OTHER_PROBLEM, PFX "invalid mode %hhu\n", info->mode);
    }
}

static void SECMARK_print(const void *ip, const struct xt_entry_target 
*target,
                          int numeric)
{
    const struct xt_secmark_target_info *info =
        (struct xt_secmark_target_info*)(target)->data;

    printf("SECMARK ");
    print_secmark(info);
}
===================================

The output of SECMARK_print is seen when I list the mangle table with 
iptables ('iptables -t mangle -L -n' for example) and there is the 
SELinux context in full view as I originally registered the rule match 
with. So, if I am to kindly ask the devs maintaining the iptables code 
to change the above function to include the following line:

printf("selctx %s [%u]", info->u.sel.selctx,info->u.sel.selsid);\

instead of:

printf("selctx %s ", info->u.sel.selctx);\

I would, at least, have an idea of what SELinux contexts maps to which 
number (I am assuming that 'selsid' is the actual number printed in the 
'secmark=XXX' - I haven't gone that far in the code yet to verify this!).

Ideally, I would *love* to have a separate branch in, say 
'/proc/net/selctx', listing all registered contexts with 
iptables/netfilter together with their numbers (basically a printout of 
the whole xt_secmark_target_selinux_info struct as defined above).

That would not be too much to ask now, would it? :-)
