From: Paul Freeman <netfilter@lists-in.noc4.net>
Subject: Re: xtables-addons/geoip
Date: Thu, 09 Dec 2010 07:42:05 +0000
Message-ID: <80d000e763b7bb4ddbf9d6df3f7fc47a@noc4.net>
References: <2e75b596bbcd5d290630dead789faffd@noc4.net>
 <alpine.LNX.2.01.1012020245310.17073@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1012020245310.17073@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

 On Thu, 2 Dec 2010 02:46:41 +0100 (CET), Jan Engelhardt 
 <jengelh@medozas.de> wrote:
> On Monday 2010-11-29 18:08, Paul Freeman wrote:
>
>> Hi we seem to be having the following issue with the geoip match 
>> from
>> xtables_addons any input appreciated.
>>
>> ~ # iptables -A INPUT -p udp --dport 53 -m geoip --src-cc ES -j LOG
>> --log-prefix 'ES DNS: '
>> iptables: No chain/target/match by that name.
>>
>> setsockopt(3, SOL_IP, 0x40 /* IP_??? */,
>> "filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 251488) 
>> = -1
>> ENOENT (No such file or directory)
>
> This sounds like the kernel module isn't there. Which is contrary to
> your lsmod posting. Hm, is geoip in /proc/net/ip_tables_matches?
>

 it looks possible that the issue may have been an older set of linux 
 headers (2.6.30)?


