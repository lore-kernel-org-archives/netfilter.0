From: Oskar Berggren <oskar.berggren@gmail.com>
Subject: Re: Fwd: ipset 6.24 and iptables 1.4.14, errno 22 (EINVAL)
Date: Tue, 16 Dec 2014 18:47:08 +0100
Message-ID: <CAHOuc7PbAQkxseUYAcT8CbxiwrmYHOr=XcnybKOjn5RPXUWtXQ@mail.gmail.com>
References: <CAHOuc7PVsLGVjOZSMNQfSmhfcd_tKfoD58mjbrQ89BtJN8M19g@mail.gmail.com>
 <CAHOuc7MEuNd85gv_L0LCdY7cKd=7Je6-a+rUh_dz7D2haEW9KA@mail.gmail.com>
 <alpine.DEB.2.10.1412161626180.7016@blackhole.kfki.hu> <CAHOuc7NJtFbCZNtU9MJWSBvTipcFMt8Ms_yVCFetdJxrX+4bdQ@mail.gmail.com>
 <alpine.DEB.2.10.1412161709230.7016@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=aCe8629vN4W/BzihBLNtDf7y+Y4Tgip4B0RihX+aYy8=;
        b=0iM48FiD5lcd8BIWV2491tZ+UP0HljOlpzIah+tC2mZ/CxI7xRyhpg1+WBptbVhLKN
         CLvul+tOkHUFDcPYCCaP2y2fDrp/HdgpX+gMedK6vN1JgHRtxrSJTm5Me5SGUIdE9sQY
         JZ+PD68syl1lgD4wzzpx3WP3/3dRqTrk+xiipN0R28Ds6Y0URn9m0KAxOmiW9oD+Ulap
         BHqmBGT1capD8kiad0GaAwhWyidUccboG2z5xLQ9wE1v+slZve1YA/TrPs0iVMWmFX5W
         IcSE1yjG4mlF9VONROp3DEuf0iVpS/nZcm0SSS61WGQ26oU3pZHgDAwOLiuuaSpge52d
         G7GQ==
In-Reply-To: <alpine.DEB.2.10.1412161709230.7016@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter <netfilter@vger.kernel.org>

2014-12-16 17:11 GMT+01:00 Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>:
> On Tue, 16 Dec 2014, Oskar Berggren wrote:
>
>> It's Debian 7, but with kernel from backports. uname:
>> 3.16.0-0.bpo.4-amd64   3.16.7-ckt2-1~bpo70+1
>>
>> The iptables 1.4.14 is from Debian, but we've rebuild it to increase
>> the maximum set name length to 256. But we also build ipset kernel and
>> userspace tools with this change. These patches have worked with ipset
>> 6.11, iptables 1.4.13 on Debian 6, but perhaps they might be the
>> problem if the versions themselves should be compatible.
>
> Then the IPSET_MAXNAMELEN macro was not updated in both the ipset and
> iptables source tree - I suspect in the latter, see
> include/linux/netfilter/ipset/ipset.h
>

We were patching IPSET_MAXNAMELEN in two places in ipset and one place
in iptables.

However
    ipset-6.11/kernel/include/linux/netfilter/ipset/ip_set.h
have become
    ipset-6.24/kernel/include/uapi/linux/netfilter/ipset/ip_set.h

And during the patch update, the change in this file was lost. It's
all working now!


/Oskar
