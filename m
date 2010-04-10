From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: removing black listed ip
Date: Sat, 10 Apr 2010 22:50:03 +0530
Message-ID: <z2hcfeab66d1004101020w685d24b3hc2551381819ced27@mail.gmail.com>
References: <z2xcfeab66d1004101003j5eb39eb1t38ec3b31ce3ce4b@mail.gmail.com>
	 <alpine.LSU.2.01.1004101910020.32651@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=xEd/ZR1XV/5v16avS2y5ObkWM8qIFO5pRc0ev2LJRso=;
        b=ZkZIWWoC+/gprqpVrMgw883Tk2ftGKJFilLj51mP8X3PSMXivxdXIUa+yGPTqg2yBj
         rFIidPACmm1+DT1AmNrugHx/6up2KBkJAQm2kJSInTDcPDsdgGzJSRA4HLZjIfbZUmVT
         2pHQhgffsIKn0RUUcwlLv6I4E0WoVBe2TvqYY=
In-Reply-To: <alpine.LSU.2.01.1004101910020.32651@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

> xt_recent works by comparing the difference between an entry's
> timestamps and the current time with the chosen --seconds parameter.


If an ip is black listed , when it will get removed ? . How can i
remove the list .i first thought of kernel timers ( timer_list ) , but
i have to take care of race condition and it will dampen the
performace .


> What's with all this whitespace...
>

sorry . by mistake i added space .

thanks,
ratheesh

On Sat, Apr 10, 2010 at 10:42 PM, Jan Engelhardt <jengelh@medozas.de> w=
rote:
> On Saturday 2010-04-10 19:03, ratheesh k wrote:
>
>>Hi ,
>>
>> I need to remove black listed ip if =A0 last seen packet is =A0x tim=
e
>>ago =A0. I have changed code , but here it is comparing with first se=
en
>>packet time . i need to compare last seen packet .
>
> xt_recent works by comparing the difference between an entry's
> timestamps and the current time with the chosen --seconds parameter.
>
>
>>@@ -178,6 +189,10 @@
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 e->nstamps =3D e->index;
>> =A0 =A0 =A0 e->index %=3D ip_pkt_list_tot;
>> =A0 =A0 =A0 list_move_tail(&e->lru_list, &t->lru_list);
>>+
>>+
>>+
>>+
>> }
>>
>> static struct recent_table *recent_table_lookup(const char *name)
>>
>>
>
> What's with all this whitespace...
>
