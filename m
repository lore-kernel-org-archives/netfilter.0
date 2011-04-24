From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset kernel oops
Date: Sun, 24 Apr 2011 11:41:39 +0100
Message-ID: <4DB3FE63.1030305@googlemail.com>
References: <4DB1F58B.9080500@googlemail.com> <alpine.DEB.2.00.1104232026240.23429@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=t5aNkZN9Q3xG2GJzuK1YxhffveNjRyFw5KVqb5U78hg=;
        b=Wp/z5S3IC7uprrl9VpomMfHBNsJCmN3GO6+xnvb+p8udTt5deUF1145wpMQozjXcvB
         3GDJj4ED5LEYASuWf/5cqrA9dmVT8A8OhELF8i+h5KLjC2tNT8qoEW2THUSMaStmgKCI
         urozIUCBjcpmZkyhQxrxxe8PKEJbYvNGOKHLY=
In-Reply-To: <alpine.DEB.2.00.1104232026240.23429@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


> How much RAM have you got in that machine?
283248k physical RAM, 128MB swap file.

>  Are the 30k addresses 
> pseudo-random, i.e. don't come from several netblocks?
>   
99.8% from all addresses/subnets come my geoip database (IP addresses 
compiled from various countries I banned from my networks as they have 
no business accessing it) - the rest consists of pseudo-random 
(selected) subnets. It is also worth mentioning that:

1. When ipset loads these addresses during boot no such error takes 
place (though it takes about 10+ minutes for these to load as the 
machine on which this run is not very powerful);
2. The error happens when I try to load these ipsets from the command 
line (i.e. do exactly the same thing from the shell as in 1 above);
3. At no point during 1 or 2 the swap file is used, which leads me to 
believe that this error does not happen because of insufficient memory;

On a separate note, is it normal for my ipsets to take absolute *ages* 
to load (about 5 minutes on a P4 machine as well)? I am loading these 
exact sets on a Core2 machine and even though it takes much less time 
(about 20 seconds or so) I am still a bit bemused why does it take that 
long, comparing to other ipset operations? I can't complain about the 
run-time performance of ipset though - it is simply unmatched by 
anything else I used (or attempted to use)!

