From: "julien vehent" <julien@linuxwall.info>
Subject: Re: IPMARK
Date: Fri, 19 Sep 2008 10:52:22 +0200
Message-ID: <66c343c00809190152j4a3789f7ue7d231c0afa40f65@mail.gmail.com>
References: <397309.80901.qm@web37302.mail.mud.yahoo.com>
	 <48D36195.1060404@ziu.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender
         :to:subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references
         :x-google-sender-auth;
        bh=IImzPaQuxY721o67KGS2NgXAmDSnEBgRZERTZ9ApJFY=;
        b=wTwCO7c7YSw3WaMRu/jE1dS6G5lXFeNGl0jTkAVxj2AefthphVcO+G3scyqBtgK7Cn
         C+qAgKJR3kP/tT7YjAGce2NgMafgBeMc1d8TlDZn7EAdWB1IZ3Sjryq1dSOxRhlmIid0
         VHEnj5MFn3UFixrqmYyVA4c5tGmqvbNNJmxEk=
In-Reply-To: <48D36195.1060404@ziu.info>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michal Soltys <nozo@ziu.info>
Cc: netfilter@vger.kernel.org

So CLASSIFY can do it too...
Are you aware of any performance difference between MARK/tc filter and
CLASSIFY ?


2008/9/19 Michal Soltys <nozo@ziu.info>:
> Jason Cosby wrote:
>>
>> All,
>>
>> I see using IPMARK as the way to go, but am not clear how to put it
>> together. The documentation doesn't quite clear it up for me. Can anyone
>> help me get together a simple down and dirty script to do as I
>>  described? Once I get the network under control a bit I will
>> continue implementing proper QOS. If I don't get a handle on this
>> soon I will be tarred, feathered, and thrown in the desert to rot
>> (almost), so any help is GREATLY appreciated.
>>
>
> You can as well use CLASSIFY target, instead of MARK+tc filter.
>
> Example (pretty crude and simplified - there're many factors to consider
> after all) of what you have in mind:
>
>
> #adjust queue lengths in "pfifo" to your needs
> #adjust interface name
> eth=eth1
>
> tc qdisc add dev $eth root handle 1:0 hfsc default 101
> tc class add dev $eth parent 1:0 classid 1:1 hfsc ls m2 512kbps \
>        ul m2 512kbps
>
> #default queue
> tc class add dev $eth parent 1:1 classid 1:101 hfsc rt m2 60kbps \
>        ls m2 200kbps
> tc qdisc add dev $eth handle 101:0 parent 1:101 pfifo limit 10
>
> #client queues
> tc class add dev $eth parent 1:1 classid 1:102 hfsc rt m2 400kbps \
>        ls m2 400kbps
> tc qdisc add dev $eth handle 102:0 parent 1:102 sfq limit 20 \
>        perturb 10 quantum 1
>
> iptables -t mangle -A FORWARD -o $eth -m iprange --src-range \
>        192.168.1.6-192.168.1.40 -j CLASSIFY --set-class 1:102
>
>
> The above will guarantee 60kbps for all the other traffic, 400kbps for
> the clients, and divide any unused bandwidth in 1:2 ratio (in hfsc -
> realtime guerantees use actual values, but linkshare criterion based on
> ratios of values - 200:400 here). SFQ will take care of distributing the
> bandwidth across all the clients. Check out recently added flow classifier
> to extend SFQ functionality similary to what was possible with ESFQ (
> http://marc.info/?l=linux-netdev&m=120180241422360&w=2 ).
>
> Alternatively - you could create 35 hfsc leaf classes in a loop, but
> getting sizes of the leaf queues can become tricky (there may be
> something I'm not aware of though), and SFQ seems like a much better thing
> (especially with mentioned above functionality extended by 'flow').
>
> E.g. something along the lines of:
>
> for i in `seq -w 6 1 40` ; do
>        iptables -t mangle -A MARKCHAIN -s 192.168.1.1${i} \
>                -j CLASSIFY --set-class 1:1${i}
>        tc class add dev $eth parent 1:1 classid 1:1${i} \
>                hfsc sc m2 10000
>        tc qdisc add dev $eth handle 1${i}:0 parent 1:1${i} \
>                pfifo limit 3
> done
>
> If you gonna read about traffic shaping, be sure to check out:
>
> http://ace-host.stuart.id.au/russell/files/tc/doc/
>
> It's the very good source of info for u32 filter, among other things (old
> lartc faq is very innacurate here).
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
