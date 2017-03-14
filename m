From: V Kurien <kurien.varugis@gmail.com>
Subject: Re: Year missing from ulogd2 timestamp
Date: Tue, 14 Mar 2017 12:04:46 -0700
Message-ID: <CACmTqUmm4y+6_gQJ8t4r+ZPDmJ_z7XRRm=jX9QGAAh8cCQD4cg@mail.gmail.com>
References: <CAAzdDtMV=OaFftNs8A_AF9-TXCvn-pxmVDqdDHCBD_2HTu3t3g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=6+SfX0aLD0LNi56GCSbFomkdHKcmi3Y9PyMrmNcbzHA=;
        b=PpGhB2EsCKCCIY231ffjbSdJb5QNGeBvr1HlWz41YoqJNTs7teez9DekbnmgSHZa7H
         2dMVq68nLtpH+/zOtOeOdsg7xcS49+8jhXCLU0rPpb7Ada5YlheNvLGCmvucFhwzGHZi
         dlwKxUpEwJorkzSeFmqvNcPx9mo7Naz5Bju5suAr12szKh3aLMEvEYgIZvxKBynWp17n
         50do7et9nxrti5/j4n4iI27rX3mbKvSSrGWsYP7j2mJd4tFSD+IEeXCgw7hfQ4MjOWhY
         dPwWv16UkES2D5S6Lyr9vit6w01fU4AkEFW1RZ2TIoY6bExHr0ilEwrHulKoEPF8ASP/
         gC2w==
In-Reply-To: <CAAzdDtMV=OaFftNs8A_AF9-TXCvn-pxmVDqdDHCBD_2HTu3t3g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Muhammad Faisal <faisalusuf@gmail.com>
Cc: netfilter@vger.kernel.org

Don't you have to enable timestamp and byte logging support?
/bin/echo "1" > /proc/sys/net/netfilter/nf_conntrack_acct
/bin/echo "1"> /proc/sys/net/netfilter/nf_conntrack_timestamp

On Tue, Mar 14, 2017 at 11:55 AM, Muhammad Faisal <faisalusuf@gmail.com> wrote:
> Hello,
> I would like to understand is this a feature or a possible bug that
> Year info is missing from the ulogd2 output.
>
>
> Mar 11 15:55:59 wc01 ulogd[14289]: [NEW] ORIG: SRC=5.55.22.172
> DST=192.168.1.3 PROTO=TCP SPT=2083 DPT=5158 PKTS=0 BYTES=0 , REPLY:
> SRC=192.168.1.3 DST=5.55.22.172 PROTO=TCP SPT=5158 DPT=2083 PKTS=0
> BYTES=0
>
>
> Best Regards,
> Muhammad Faisal
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
