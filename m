From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: Mark traffic on one machine, match on another machine?
Date: Wed, 5 Dec 2012 04:39:54 +0200
Message-ID: <CA+4D1sfikOc6BqVpGNxyYUOv-CA9j0ofSf-QJ_Fvz+JSw=SH3w@mail.gmail.com>
References: <08eb317b-c614-4117-855b-66ade5d2244d@tahiti.vyatta.com>
	<3a947589368a2610486404839274d7cb@imap.netsecspec.co.uk>
	<50B84725.3080608@nottheoilrig.com>
	<50B851E8.8070107@ngtech.co.il>
	<50BC6639.3090502@nottheoilrig.com>
	<50BC9297.3050507@ngtech.co.il>
	<50BCB80F.4090208@nottheoilrig.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=j8dcZS0kqwI6MDSJTcfrh0Fs2a0kTwkgFGYjUh+4Q/k=;
        b=MoiMjAHfGSIoor5rBDjUnIC4YKWNGUAZ28uzIh7Xdrp6W1dq+PJMjSxdQS3d761QIY
         u+uePT8ed9uYaKS3gZhhuGyM8cNyC9cqckXRDmKEA8s+pZmmGCSVZIQdZCzivM6iOq+U
         CN6uwC6x3LGVXfpKiuVpyumu2pCkIA2yJxHy/JuqsRyAKiJmxFDWQYdD/1HVUlTA8r8f
         MxRv0UkodOrI2Anp547QSavKF2jOdj/wa2hxmss1ZYxfHnd8DK17RPo1rD/fhSUebjqv
         nR5Iuv/rDVfjukujeJ3TCF7pcHTie1RUIAlIyUnzX23MAQCnqdyqkM4acKAhNiJX117L
         eYHQ==
In-Reply-To: <50BCB80F.4090208@nottheoilrig.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jack Bates <uo4zau@nottheoilrig.com>
Cc: netfilter@vger.kernel.org

Hi Jack,

--restore-mark should be used for existing connections and to mark new
ones you may use something like that:

iptables -t mangle -A PREROUTING -i eth0.2 -m tos --tos 1 -m conntrack
--cstate NEW,RELATED -j MARK --set-mark 1

The main idea consists in marking packets on the physical input
interface and shaping them on ifb0( where they arrive already marked
).
iptables' packet marks exist only in memory of one computer, TOS/DSCP
may be used for transmitting a map of them to another one.
BTW, use --restore-mark on the output interface of your shaper too.

2012/12/3, Jack Bates <uo4zau@nottheoilrig.com>:
> Thanks a lot for your help, how can I evaluate --restore-mark before I
> classify and shape response traffic from the origin server?
>
> I think you mean something like:
>
>    # Copy ctmart to nfmark (e.g. 1, 2)
>    iptables -A PREROUTING -t mangle -i eth0.2 -j CONNMARK --restore-mark
>
>    # Classify by nfmark (e.g. 1, 2), send unmarked traffic to class 2:2
>    tc filter add dev eth0.2 parent ffff: protocol ip handle 1 fw flowid
> 2:1 action mirred egress redirect dev ifb0
>    tc filter add dev eth0.2 parent ffff: protocol ip handle 2 fw flowid
> 2:3 action mirred egress redirect dev ifb0
>    tc filter add dev eth0.2 parent ffff: protocol ip u32 match u32 0 0
> flowid 2:2 action mirred egress redirect dev ifb0
>
> Just how can I get --restore-mark to evaluate before tc filter?
>
> Another way I can imagine is with the CLASSIFY target:
>
>    # Send unmarked traffic to class 2:2
>    iptables -A PREROUTING -t mangle -i eth0.2 -m connmark --mark 1 -j
> CLASSIFY 2:1
>    iptables -A PREROUTING -t mangle -i eth0.2 -m connmark --mark 2 -j
> CLASSIFY 2:3
>    iptables -A PREROUTING -t mangle -i eth0.2 -j CLASSIFY 2:2
>
> But I have the same challenge, how can I evaluate the CLASSIFY target
> before I shape traffic?
>
> Or is there another way to classify and shape response traffic from the
> origin server based on the TOS/DSCP field of the request?
>
> On 03/12/12 03:52 AM, Eliezer Croitoru wrote:
>> You use iptables mark + restore mark based on connection tracking.
>> you can mark the TOS on the outgoing postrouting table.
>> you can take a look at the iptabes man pages:
>> http://ipset.netfilter.org/iptables.man.html
>> which has --restore-mark  exaple.
>>
>> Eliezer
>>
>> On 12/3/2012 10:43 AM, Jack Bates wrote:
>>> I can imagine a couple ways of classifying traffic from our proxy server
>>> based on the TOS/DSCP field, and also how to set the connection mark
>>> based on this field. But how do I classify and shape response traffic
>>> from the origin server based on the connection mark?
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
Best regards
Anatoly Muliarski
