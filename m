From: "julien vehent" <julien@linuxwall.info>
Subject: Re: IPMARK
Date: Thu, 18 Sep 2008 11:45:21 +0200
Message-ID: <66c343c00809180245p1404832evb58e7321c65581f1@mail.gmail.com>
References: <397309.80901.qm@web37302.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender
         :to:subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references
         :x-google-sender-auth;
        bh=2nQnayEbdtzXA2mIkBVk7XXW5SS19Ya+OF5qd9o/Lcw=;
        b=aVkHy2/Q+gCif9axZ0r1XLjqPqMixv09JJKvo6mVxgq9xzj3BgIx5VCplus2F7RiUV
         kUOOWYZcKaJox7O88mmEHRAEZ/w0DEp+7BB+JlSGtp4YpF8byg1JxjF9Bd2lHKj1cFaK
         cd4clk5XVYnY3DkVuFwMVO0spqh9tAvP2ivC4=
In-Reply-To: <397309.80901.qm@web37302.mail.mud.yahoo.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sky_jason@yahoo.com
Cc: netfilter@vger.kernel.org

2008/9/18 Jason Cosby <sky_jason@yahoo.com>:
> All,
>
> Sorry to post here, but the LARTC list has gone belly up. I have a LAN of 35 with IPs from 192.168.1.6 thru 192.168.1.40 sharing a satellite link. I need to limit total bandwidth to 512Kbps and divide it evenly between all 35 clients. My plan is to create 35 individual queues and allow 100% borrowing so that the queues don't have to constantly be deleted/recreated upon user enter/exit. All traffic is run through NAT at the gateway computer.
>

I think if you just create one queue that is limited to 512kbps and
redirect the 35 clients to this queue, the outgoing traffic will be
divided evenly between them.

Try this (assuming your network card is eth0):

tc qdisc add dev eth0 root handle 1: htb default 10
tc class add dev eth0 parent 1:1 classid 1:10 htb rate 512kbps
tc filter add dev eth0 parent 1:0 protocol ip prio 1 handle 1 fw flowid 1:10
iptables -t mangle -A PREROUTING -s 192.168.1.0/24 -j MARK --set-mark 1



> I see using IPMARK as the way to go, but am not clear how to put it together. The documentation doesn't quite clear it up for me. Can anyone help me get together a simple down and dirty script to do as I described? Once I get the network under control a bit I will continue implementing proper QOS. If I don't get a handle on this soon I will be tarred, feathered, and thrown in the desert to rot (almost), so any help is GREATLY appreciated.
>
> Thanks,
> Jason
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
