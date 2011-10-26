From: Sam Roberts <vieuxtech@gmail.com>
Subject: Re: NFQNL_COPY_META not working?
Date: Wed, 26 Oct 2011 09:48:15 -0700
Message-ID: <CA+Sj9TmYSOD7my8+wzJ4Re1QSanbi+iEoRx0fAO6ast9=5KsTg@mail.gmail.com>
References: <76B3922156AB24469E781F6224C2239F0151D1@ly-ex-02.thrane.tt.ad>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=eN4CQCXHmPtg9MAJsAd3fMUwsPJrPpMxfM5kmJVb8j0=;
        b=lhbn/LpXKdSJ3rGimzFJpZE7m6bdmLsu/nFYU9BIe0MrSbf/31ZuHaWAHlrA62AfJu
         cVVD636prYUNOZrQWfvtxgBVLfK/guuZi4J7d3cOLNtQUIuo70Fn0xyzo+eNtpnPsTBr
         cjwepCgm4WMIeQSwj0iak9jCMGEDKZyHlo/qw=
In-Reply-To: <76B3922156AB24469E781F6224C2239F0151D1@ly-ex-02.thrane.tt.ad>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Andreas_Birkj=E6r_=28ABI=29?= <abi@thrane.com>, netfilter@vger.kernel.org

On Wed, Oct 26, 2011 at 4:24 AM, Andreas Birkj=E6r (ABI) <abi@thrane.co=
m> wrote:
> However, I do not want to pass the entire packet to userspace - I jus=
t need to check/modify the IP and/or TCP header and then pass the packe=
t along.

nfq_set_verdict() doesn't allow modifying only a part of the packet,
to my knowledge. You either accept/drop the entire packet, or replace
the entire packet.

Cheers,
Sam
