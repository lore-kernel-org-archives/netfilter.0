From: Paul Robert Marino <prmarino1@gmail.com>
Subject: Re: why scapy packet no effected by ip tables
Date: Sun, 20 Jul 2014 12:27:55 -0400
Message-ID: <CAPJdpdA7JGd6g9G99sxFUhMTX4-KWkYdnwLjcoxA26C47BPOrw@mail.gmail.com>
References: <CAPpnho=+jciiQzpa9gnihrJsBRnRkniQtfWHPcrr7s4-3KHSDw@mail.gmail.com>
	<20140717152350.GA4553@home>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=U1k5jIys7kGKNG1rzOPYxKqasDvXpe8KVGqDov+kJUc=;
        b=TU/2oRXDWFo0L9aAAStbwR09fu6IZFs/4kdtyNU57/V7ysTB6Xasu0HqC/cDeepnxq
         z+2VAmrzfZ/7+nZNeQCdhwoZp8n5b64tnUlBh4IhkjHASxufe0GcnZRvIlPqgXZJt+wE
         inDlyQvF69CFVwv0DtzFgP3o8B3O+urq0bpc2cvKzDmg8J8E/rQ/qqziXgbGGg8EGz4G
         w9kl976lGFvI6u81MflGJWndhaW1+thOxn0Asb5hIJjRIUFCX13ZoXTuyjvHhrFeSfoF
         rePysZ198dy3ObGnfok3svivyXVpHqqoyZalZ4cADOgF9TYTQaKZl2IsADG6Q4JGILff
         dO4A==
In-Reply-To: <20140717152350.GA4553@home>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phil Oester <kernel@linuxace.com>
Cc: Abogholo A <abogholo@gmail.com>, netfilter@vger.kernel.org

look at ebtables instead.


On Thu, Jul 17, 2014 at 11:23 AM, Phil Oester <kernel@linuxace.com> wrote:
> On Wed, Jul 16, 2014 at 05:16:21PM +0430, Abogholo A wrote:
>> i wrote this rule for change all udp destination ip address to 8.8.8.8
>> when dport is 53:
>>
>> iptables -t nat -A OUTPUT -p udp -m udp --dport 53 -j DNAT
>> --to-destination 8.8.8.8
>>
>> but when send this packet
>>
>> sr1(IP(dst="4.2.2.4")/UDP()/DNS(rd=1,qd=DNSQR(qname="iranled.com")))
>>
>> iptables no effected to them
>>
>> why?
>
> Scapy uses raw sockets, which don't go through iptables.
>
> Phil
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
