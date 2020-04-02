From: Brett Mastbergen <bmastbergen@untangle.com>
Subject: Re: [ANNOUNCE] nftables 0.9.4 release
Date: Thu, 2 Apr 2020 09:32:08 -0400
Message-ID: <CANBx8VBF2LuGoE2dODLB_3mQixj5YUQTvvsaUTDyNniwb-Ti4w@mail.gmail.com>
References: <20200401143114.yfdfej6bldpk5inx@salvia> <8174B383-989D-4F9D-BDCA-3A82DE5090D2@gmail.com>
 <20200402124744.GY7493@orbyte.nwl.cc> <60AB079D-9481-4767-9E07-BDEE7E691B6B@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=untangle.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qbxYEcxLIAfmwv8/JFI5XlK7N/zQk0sceuC21pvNkUA=;
        b=AdaaY+gn4z7+BZ2xgWzQadQI7VaB3LbrQp8VRIoUic6M+z7EtYYK2rlHlrs2psSrIc
         OtksR+m+TO7hqyOdk4T6DAile9TGDoQhFLfSf7sjPltqkAEDCYZNpBjfiVmwl+Abv3AQ
         gLtbkxRtXJG0EhJ4iyC5KZ6Bfea2ho09JQUcs=
In-Reply-To: <60AB079D-9481-4767-9E07-BDEE7E691B6B@gmail.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: sbezverk <sbezverk@gmail.com>
Cc: Phil Sutter <phil@nwl.cc>, Pablo Neira Ayuso <pablo@netfilter.org>, netfilter <netfilter@vger.kernel.org>, netfilter-devel <netfilter-devel@vger.kernel.org>, netdev@vger.kernel.org, lwn@lwn.net

I need to revisit this patch, as I THINK the typeof support for maps
gets us close to where we want to be.


On Thu, Apr 2, 2020 at 8:52 AM sbezverk <sbezverk@gmail.com> wrote:
>
> Hi Phil,
>
> Thank you for letting me know, indeed it is sad, but hopefully it will ge=
t in sooner rather than later.
>
> Best regards
> Serguei
>
> =EF=BB=BFOn 2020-04-02, 8:47 AM, "Phil Sutter" <n0-1@orbyte.nwl.cc on beh=
alf of phil@nwl.cc> wrote:
>
>     Hi Serguei,
>
>     On Thu, Apr 02, 2020 at 08:38:10AM -0400, sbezverk wrote:
>     > Did this commit make into 0.9.4?
>     >
>     > https://patchwork.ozlabs.org/patch/1202696/
>
>     Sadly not, as it is incomplete (anonymous LHS maps don't work due to
>     lack of type info). IIRC, Florian wanted to address this but I don't
>     know how far he got with it.
>
>     Cheers, Phil
>
>
>
