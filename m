From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: Aw: Re: Re: nft show counter
Date: Fri, 2 Apr 2021 13:10:03 -0400
Message-ID: <4f480897-1f0c-01c7-cb0b-3675984e10e6@fhmtech.com>
References: <trinity-08431e16-b4eb-4bb7-8b36-df2084481611-1617212862528@3c-app-gmx-bap62>
 <20210331214053.GB13699@breakpoint.cc>
 <d5770849-515b-5514-39ab-bb6907023ca2@fhmtech.com>
 <trinity-e144cb32-0c89-44a6-b0f6-5b9edcf5e457-1617264512699@3c-app-gmx-bap06>
 <20210401181414.GF13699@breakpoint.cc>
 <trinity-5952d750-31c3-468f-9c47-86937547349b-1617364718637@3c-app-gmx-bs22>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=+Mo8zxzUy5QlAFbz+eKT3To1wVcVjJHWhJzn/vNJC3c=;
        b=eixntJUwvuxqygpZN4e+h0GXwlG5iF90zyqPvoWUDUmKgry+zYRzBMSZlf15ygY3yoctuDHN2yECqchncVKLViE6NkmakUpyJjXMi1f5N4TpAAazwUv/kYzOSd+DzsGbWFazbkonRRi2wnJnWqvQU0SL34d56m3gObMr0NOsSEM=;
In-Reply-To: <trinity-5952d750-31c3-468f-9c47-86937547349b-1617364718637@3c-app-gmx-bs22>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Frank Wunderlich <frank-w@public-files.de>, Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

On 2021/04/02 07:58, Frank Wunderlich wrote:
> Is there a way to filter deeper into protocol stack (SIP data ignoring start registration traffic)

There's this, on the SIP connection tracking helper:
https://home.regit.org/netfilter-en/secure-use-of-helpers/

If that's not enough, you could look at queuing packets to a userspace 
program that uses libnetfilter_queue:

https://wiki.nftables.org/wiki-nftables/index.php/Queueing_to_userspace

https://home.regit.org/netfilter-en/using-nfqueue-and-libnetfilter_queue/

For an existing app, Google found:
http://genesysguru.com/blog/blog/2013/12/11/sip-interceptor/
which may or may not have morphed into
https://docs.rhino.metaswitch.com/ocdoc/books/sis-documentation/2.6.1/sis-administration-guide/managing-the-sis/managing-interceptors/index.html
Not sure that's available at reasonable cost and/or current.


Getting beyond my depth, but some other things you could look into:

* Maybe your pbx software has some filtering ability built in? (Thinking 
of something analogous to haproxy, but for SIP/RTP.)

Looking around:

FreePBX seems to have just a pre-configured iptables setup:
https://wiki.freepbx.org/display/FPG/Firewall

Asterisk / Sangoma recommends a session border controller (SBC):
https://www.sangoma.com/articles/voip-firewall/

* ... So may be worth looking into using an SBC:
https://en.wikipedia.org/wiki/Session_border_controller

Maybe someone with more recent VoIP setup experience will have 
recommendations.

Best Wishes,
Frank M.

