From: David Zage <djzage@gmail.com>
Subject: Re: Concurrent netfilters
Date: Mon, 30 Jan 2012 20:05:41 -0700
Message-ID: <CAN9nwp6J-5k+YYdra0+Vih_p9q=Mi5CY96w2Nsc-KSOWVPs3zg@mail.gmail.com>
References: <CAN9nwp7_EorcWaCuyHg64iuZf5_8EWYQ+kYFMkui3CK2k4rJRg@mail.gmail.com>
	<alpine.LNX.2.01.1201310127330.20597@frira.zrqbmnf.qr>
	<20120130163529.1f396148@nehalam.linuxnetplumber.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=BdKto3bb5mG2M5OO1mhLG6+0KF3K0EHiTf/toO4Eaj4=;
        b=K6Dma4sElYhZafaRMr+kk+Suy5/nhiAlTlnV8yHlmHOatWWt5wQENGNTHNt7s5rQ/P
         R4rnIH//kGRjlbSZTxWQvF/cGopj1tB2DHQL3c0BHlkc+TuBAscy7hBzsXAS8C2hnPos
         gKwtqcA6Fr0uwLYiiyzZ29POcitW5EamxcaLQ=
In-Reply-To: <20120130163529.1f396148@nehalam.linuxnetplumber.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Hemminger <shemminger@vyatta.com>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

If I understand correctly, looking at RPS and taking into account the
elimination of locking on packets, actual processing of packets by
netfilters is still inherently serial?  For example, if packet 1 is
placed on the queue for CPU1 and packet 2 is placed on CPU2 at nearly
the same time, packet 1 will be processed by netfilters and once the
rules have been exhausted, packet 2 will be processed.

On Mon, Jan 30, 2012 at 5:35 PM, Stephen Hemminger
<shemminger@vyatta.com> wrote:
> On Tue, 31 Jan 2012 01:28:21 +0100 (CET)
> Jan Engelhardt <jengelh@medozas.de> wrote:
>
>> On Tuesday 2012-01-31 00:46, David Zage wrote:
>>
>> >Has there been work on netfilter to take advantage of multiple cores
>> >(e.g., concurrent packet processing)?
>>
>> Filtering runs on the same core as networking gives us. Therefore,
>> consult with General Networking for RPS and RFS.
>
> Lots of work has gone into eliminating locking when processing packets
> on multiple cores. This makes multi-queue NIC's and RPS more efficient.
>
> Also the semantics of rule evaluation are sequential.
