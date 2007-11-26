From: Quartexx <quartex73@gmail.com>
Subject: Re: Fighting DOS attacks
Date: Mon, 26 Nov 2007 20:42:29 +0100
Message-ID: <4d7bf97f0711261142s9e6cf28r7931210acf8154e6@mail.gmail.com>
References: <4d7bf97f0711220633s36cc7b91x4ac07fa0064d4bff@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=M8t5KQXlhDrbkv8wq+NtoPYOcdtBCPUB7qdkBUXjV48=;
        b=LDIGdeAAjgyMYfR9pyw1fZ/5sd5MGpZhJgkEsPEEIHoWbC6pmrE2mdDfJOlj9d8++pNFrcHpEiBx/OE42JchRRMGo3LF8QjKGF0mairY2ZutB2s57pi6soi1I5PGLDoZtXuxzcUH9Takbp3Ax0SuMdTjK6qdfOA32wNaz8DfyMI=
In-Reply-To: <4d7bf97f0711220633s36cc7b91x4ac07fa0064d4bff@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> The following kernel tunes are often reported on security books like
> dos mitigators, still I would like to know your mind about these
> kernel parameters settings:
> echo 1 > /proc/sys/net/ipv4/tcp_syncookies
> echo 30 > /proc/sys/net/ipv4/tcp_fin_timeout
> echo 1800 >/proc/sys/net/ipv4/tcp_keepalive_time
> echo 0 >/proc/sys/net/ipv4/tcp_window_scaling
> echo 0 >/proc/sys/net/ipv4/tcp_sack
> echo 0 >/proc/sys/net/ipv4/tcp_timestamps
>
> Syncookies will help for sure.  Decreasing fin_timeout (from 60 to 30)
> and keepalive_time (from 7200 to 1800) has any real benefits?
> And what about turning off  tcp_window_scaling and tcp_sack?
> Finally I think disabling tcp_timestamps is relevant only to disable
> uptime detection...
>
> As far as I can tell, all these options will only help the Linux
> firewall box itself and will not do anything to assist the hosts that the
> Linux box is being used to protect.
> So basically these parameters must be set on every host behind
> firewall.  Is this correct?

Anyone?
Thanks
