From: Hans de Bruin <jmdebruin@xmsnet.nl>
Subject: Re: packets skipping dnat rule and someting else
Date: Mon, 26 Sep 2011 23:54:33 +0200
Message-ID: <4E80F499.3070000@xmsnet.nl>
References: <4E7DE255.1070805@xmsnet.nl> <647511316877790@web18.yandex.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <647511316877790@web18.yandex.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Oleg A. Arkhangelsky" <sysoleg@yandex.ru>
Cc: netfilter@vger.kernel.org

On 09/24/2011 05:23 PM, "Oleg A. Arkhangelsky" wrote:
>
>
> 24.09.2011, 17:59, "Hans de Bruin"<jmdebruin@xmsnet.nl>:
>
>> [22734.688709] CHAINv4=in_int IN=eth3 OUT=
>> MAC=00:30:18:a6:c0:f2:00:0e:00:00:00:01:08:00 SRC=186.207.156.227
>> DST=92.254.124.152 LEN=40 TOS=0x00 PREC=0x00 TTL=112 ID=27025 DF
>> PROTO=TCP SPT=62434 DPT=16881 WINDOW=0 RES=0x00 RST URGP=0
>
> This packet doesn't belong to any valid connection from conntrack point of
> view. Maybe this RST is duplicated and conntrack entry was destroyed a
> moment before.
>
> You can use -m conntrack --ctstate INVALID to catch such packets.
>

Thanks, that rule has droped 570000 packets in my ignore chain in about 
two and a half day's. Now my logs are readable again.

Except for the RST packets there were also a lot of ACK FIN packets. I 
wonder if the 570000 packets are a small or a big percentage of the 
total number of tcp/ip sessions.

-- 
Hans
