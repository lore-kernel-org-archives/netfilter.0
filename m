From: Denys Vlasenko <vda.linux@googlemail.com>
Subject: Re: modprobe: cannot parse modules.dep error
Date: Tue, 18 Dec 2007 11:08:23 +0000
Message-ID: <200712181108.23892.vda.linux@googlemail.com>
References: <200712181032.17947.schane@osmozis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date:user-agent:cc:references:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:message-id;
        bh=et0nqYyBUnPr8DwEUB5NgBN/48/6zG8L7fEzR1Dxjb4=;
        b=SxF+2W+CYPTb7F3C9+dH2j/l8UX/GXXKt4yU0RHLA2NqYPVlxnkuMEWk4RvHPX24XMxqEfutVoLjT/JgDvefT7ZX0kl4g9XNvzYMLh/oF6NLACmdXDCmBt7qUtwhdsdsEpguABJjOMY5d2Xrb+SPpnA5xUyy4M/qRyfhLYOxjSw=
In-Reply-To: <200712181032.17947.schane@osmozis.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: busybox@busybox.net
Cc: Saravanan Chanemouganandam <schane@osmozis.com>, netfilter@vger.kernel.org

On Tuesday 18 December 2007 09:32, Saravanan Chanemouganandam wrote:
> Hi all,
>
> I am running into the following problem when invoking a netfilter iptables
> ( v1.3.8) and xtables support in the buildroot's busybox (v1.7.2) system.
> The netfilter packet configuration and support modules are compiled and
> built into the linux-2.6.16 kernel image.
>
> When a 'C++' application code calls the iptables  through
> sprintf(buff, "%s -t mangle -A PREROUTING %s -j MARK --set-mark 512",
> Config.iptables, Config.link[i]);
> it throws the modprobe error.
>
> iptables -t mangle -A PREROUTING -d 88.160.215.156 -p icmp -j MARK
> --set-mark 512
> modprobe: cannot parse modules.dep
> modprobe: cannot parse modules.dep
> iptables -t mangle -A PREROUTING -s 88.160.215.156 -p icmp -j MARK
> --set-mark 512
> modprobe: cannot parse modules.dep
> modprobe: cannot parse modules.dep
> iptables -t mangle -A PREROUTING -d 88.160.215.156 -p tcp --dport http -j
> MARK --set-mark 512
> modprobe: cannot parse modules.dep

Can you try the following in modprobe.c?

static struct dep_t *build_dep(void) 
{
...
        filename = xasprintf("/lib/modules/%s/modules.dep", un.release);
        fd = open(filename, O_RDONLY);
        if (ENABLE_FEATURE_CLEAN_UP)
                free(filename);
        if (fd < 0) {
                /* Ok, that didn't work.  Fall back to looking in /lib/modules */
                fd = open("/lib/modules/modules.dep", O_RDONLY);
                if (fd < 0) {
-                       bb_error_msg_and_die("cannot parse modules.dep");
+                       bb_error_msg("cannot parse modules.dep");
+                       return NULL;
                }
        }
...


--
vda
