From: Brad Pousland <bpousland@izuma.net>
Subject: Re: setting meta priority to select link vlan qos 802.1q priority via
 egress map
Date: Wed, 11 May 2016 16:56:22 -0500
Message-ID: <CAGBdaZmVMsfGTN1iFY5pHt3=ApEWXxyb3jky=QP_n8P8kAfOGA@mail.gmail.com>
References: <CAGBdaZm-3nTMOp=zTF_=h3=epRDDAA13UCwZxnGg5jg8MV1yGg@mail.gmail.com>
	<CAGBdaZ=9bcechsjddxbcFZJGTv7UpkTSi22stnWBnyAsOvxHjw@mail.gmail.com>
	<20160511204906.GA24369@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=izuma-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc;
        bh=3O0cim8EbBHCsJwFRWP8szHXQJlp2t2GnCrOsdTQj1I=;
        b=qd+XnC/HpuajZrNvpH2ppcUp5FAmdp7S+6d96NJuKuPUAswunmdiQ9BvhATB4iORyn
         qOhCS3+cNAMFx58ocuwxp49jkmCN9LF44LUSGxGTosG5MCIK8DbSHW89JEI7YeWpoui2
         T/aB5l/e76yWYY4ZevKz1HkVzUOCd0lA1gfOnN9iMZYvnOvcpIUxwryq838BF4orPYnW
         wI9H9ajLlIZ+1gYz9Jy3I99BGWXA0R5u52yJHeehv08dfy3MIQfVzm2kswYgrVteb6xi
         5o+LVzUwurN5CtRYQb+h+/UIIzfo42HRiyKIMYrtUnXQjKPOtLEFZaz3P/FGdEDWQYS/
         t4JA==
In-Reply-To: <20160511204906.GA24369@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Decidedly not and endian issue.  It appears the the bison parser is
not allowing the colon to specify the min:max priority so this hack
allowed me to set the priority by specifying the 32-bit value:

nft add rule mangle postrouting ip protocol 6 tcp dport 22 meta
priority set 40000000 counter

diff --git a/src/meta.c b/src/meta.c
index bfc1258..60231ce 100644
--- a/src/meta.c
+++ b/src/meta.c
@@ -108,10 +108,10 @@ static struct error_record
*tchandle_type_parse(const struct expr *sym,
        } else {
                uint32_t min, max;

-               if (sscanf(sym->identifier, "%04x:%04x", &min, &max) < 0)
+               if (sscanf(sym->identifier, "%08x", &max) < 0)
                        goto err;

-               handle = max << 16 | min;
+               handle = max;// << 16 | min;
        }
        *res = constant_expr_alloc(&sym->location, sym->dtype,
                                   BYTEORDER_HOST_ENDIAN,


Brad Pousland
Principle Software Engineer
WigWag, Inc.
c - 512-963-2446
www.wigwag.com



On Wed, May 11, 2016 at 3:49 PM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> On Wed, May 11, 2016 at 03:07:42PM -0500, Brad Pousland wrote:
>> It appears to be a bug with the nftables userspace utility nft. I
>> wrote a program to decode nftables rules and found the nft utility is
>> trying to fill the BPF data register with the priority value in
>> big-endian format.  If I hack it to use little-endian format for the
>> meta value, the skb->priority is set appropriately.
>
> Could you pass your hack so we can have a look?
>
> Thanks!
