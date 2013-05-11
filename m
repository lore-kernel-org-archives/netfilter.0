From: Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.19 released
Date: Sat, 11 May 2013 13:11:31 +0100
Message-ID: <518E3573.9040102@googlemail.com>
References: <alpine.DEB.2.00.1305092214320.25002@blackhole.kfki.hu> <20130510123223.GQ8305@localhost> <alpine.DEB.2.00.1305101758420.27743@blackhole.kfki.hu> <518D803B.5010702@googlemail.com> <alpine.DEB.2.00.1305111241450.29329@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=t96iZbzG/arBgof95thKf622ti018z6hgIGVxSiZK2w=;
        b=N1ACNAah+XjK0jz9MtHSgCkAiQxSGN/fRPWj9uy4QGoENtWbAYHyo84RPBlvoZUyQv
         2JdZ7PF+CxSk6jt7fxCRToo8GUd2tsMHwMWNjzd7y5Q+Cb7E0Gi2f2K7FqV0sc/3XROb
         1MtTK8g2ywB6jVFRxs0rZ/tmQKvdUkrRcmXRXqPhCR5AzHSZPhu7H/dk+yxD5VlrnObm
         wqOhJ53SfaBfE/9foreRBb3SlqWfoUBOA/c2nYssmXS4KHzXhUAmZMPBldRaXym6HTk3
         TxJDPqfVqrUgcnhvIR1ACziSRkkpWUmVogaJfnGCXh+0NluwdG9lVUvGYw/fvBGAD6UT
         pAZg==
In-Reply-To: <alpine.DEB.2.00.1305111241450.29329@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Andreas Herz <andi@geekosphere.org>, netfilter@vger.kernel.org


Jozsef Kadlecsik wrote:
> On Sat, 11 May 2013, Dash Four wrote:
>   
>> Jozsef, where is this updated iptables-extensions manpage you speak of?
>>
>> The latest released version of iptables is 1.4.18, which obviously does not
>> include any of the above since it was released before ipset 6.19. I've just
>> looked at the main iptables git repo and there aren't any git logs since that
>> release with anything related to ipset. In the ipset sources, apart from the
>> main ipset man page, there is nothing there which describes the above iptables
>> match options.
>>     
>
> As I wrote in the announcement, it's in the "next" branch of the iptables 
> git tree yet.
>   
Ah, got it now. Thanks Jozsef.

