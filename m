From: Grant Coady <gcoady.lk@gmail.com>
Subject: Re: Error when IPRANGE used on 2.4 Kernel
Date: Fri, 07 Nov 2008 06:45:15 +1100
Message-ID: <t5i6h45u4obkg5sr886oppkde0ep1bvnbl@4ax.com>
References: <13c27d00811060625v7da1b917t37b0dd8a84c58f71@mail.gmail.com>  <alpine.DEB.2.00.0811061552340.29399@aurora.sdinet.de> <13c27d00811060704p70f36b48hfb87dbaeaddbf717@mail.gmail.com> <alpine.DEB.2.00.0811061615050.29399@aurora.sdinet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :organization:message-id:references:in-reply-to:x-mailer
         :mime-version:content-type:content-transfer-encoding;
        bh=UK/mftnzIq0EcJyFOBW5uclgtUJoNVjxx3XOfRkT+YM=;
        b=wS5TClIelTtMOu4Xd5vdII/d/BkeG7nrm8sgw+fSp2gV2CR0FjeMBA6XhsUNaj8mQZ
         tExiyaAU2vhlfR12C2+eJRFxJJ/9ZODfieL/BFG+OS/f9s8Rudn6PSewCfUA/WmDY8OE
         qifvTKE0gFX8Y/NPFPjhJboVOsq1AAeyRF2A8=
In-Reply-To: <alpine.DEB.2.00.0811061615050.29399@aurora.sdinet.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sven-Haegar Koch <haegar@sdinet.de>
Cc: Karthik V <karthikv.vk@gmail.com>, netfilter@vger.kernel.org

On Thu, 6 Nov 2008 16:15:59 +0100 (CET), you wrote:

>On Thu, 6 Nov 2008, Karthik V wrote:
>
>> I agree with the stupid IP part...it was just for the mail. I did try
>> quite a few IP addresses.
>> 
>> But on the comment about it not being part of 2.4. I assumed that
>> iprange is patched when I received the following message:
>> Error: iprange: Bad IP Address ..... Pretty sure it entered
>> libipt_iprange: parse_iprange function.
>
>I think this message just means that your userspace iptables tool 
>supports iprange, and does not say anything about the kernel side.

2.4 kernel does not have iprange unless you patched it, iptables error messages 
are not very helpful due to the kernel / userspace functional split.

Grant.
-- 
http://bugsplatter.id.au
