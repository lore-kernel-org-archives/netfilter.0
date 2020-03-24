From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: A question about priority in chains
Date: Tue, 24 Mar 2020 16:55:38 -0400
Message-ID: <b5688f99-efa0-b522-b7a7-81440d386186@fhmtech.com>
References: <62b3a8f8-d0ae-bac1-c0f1-54f19ee3d31f@mailbox.org>
 <e43d85e0-0a1c-05b8-d1b4-bed6bdcbe6a2@fhmtech.com>
 <5042488d-3299-4a53-9250-843a3e902717@mailbox.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject; bh=Ba+N4y3Ah2T2Uxvgy+311JC2FwYxwujTcrEDS+/Zl3k=;
        b=wzjhwHDRR+j7iT1xJyk5kd6sOH3prdc91PhmIrTSZJn3Bz93QDgtN5V98ADmJk9oYnPKpqKgZ4OjMuWQLsQvcPeFfKVgarMz/hR8I3sNczRAvwH8RAR+8/5lL15jSadtG5qSgO+XtXiFSz6L8BGX4938i+6xGh7ONToB5JR2Bbc=;
In-Reply-To: <5042488d-3299-4a53-9250-843a3e902717@mailbox.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: darius <dram@mailbox.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 2020/03/24 15:28, darius wrote:

> I was referring to Netfilter packet flow
> https://en.wikipedia.org/wiki/Netfilter#/media/File:Netfilter-packet-flow.svg
...
> But again, nft is replacement for netfilter and it works in slightly
> different way. that was maybe a bad idea to try to follow Netfilter
> packet flow diagram.


The Wikipedia article was conflating netfilter with iptables. nftables 
is part of netfilter; it replaces iptables, the packet-filtering portion 
of netfilter. I've made some edits to try to make this distinction.

Thanks,
Frank
