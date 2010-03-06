From: Weedy <weedy2887@gmail.com>
Subject: Re: best approach for blocklist
Date: Sat, 06 Mar 2010 02:11:16 -0500
Message-ID: <4B920014.6030103@gmail.com>
References: <4B912EA0.1060604@conversis.de> <4B914406.1090306@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=AiIFsNz87qCqQQkb2YjmYNpkSajli6Tp+v3RKx/vDvI=;
        b=ohSkkJQMnp57bIrohXkt8y35sbsVtvNoG2fuJ0mxR9yFpw9W7W4CDXZha3+DJgDe5n
         HN261+6Vq1S1Q/qycSM+mrPEA0y3GD8c0SPf5+uaWDTybE7G29DwOibW9zuX4lrNoZQN
         7sv31ioxmxItS/qg6qoUMGKzETSks2iLuuE8s=
In-Reply-To: <4B914406.1090306@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Mart Frauenlob wrote:
> On 05.03.2010 17:17, netfilter-owner@vger.kernel.org wrote:
>> Hi,
>> I'm wondering what the most efficient way to implement a blocklist is.
>> We are basically talking about blocking a few thousand IPs. Does
>> iptables do some internal optimizations when blocking based on a source
>> address or would it be better to, say, create a chain for each class A
>> net (e.g. 83.0.0.0/8) and then add the IPs in that range to that class
>> to make the matching more efficient?

There is a PDF I'm too lazy to google for about how the university of 
florida mitigated a DDOS from a worm using TARPIT. Point being they had 
to TARPIT hundreds of thousands of IPs and had to deal with the 
performance issues behind that. It's a good read.
