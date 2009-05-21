From: Fabio Marcone <fabio.marcone@duet.it>
Subject: Re: tc and priority
Date: Thu, 21 May 2009 15:29:17 +0200
Message-ID: <4A15572D.3000303@duet.it>
References: <4A142FF7.1050700@duet.it>	 <38db14850905202353r3c494d15se7f53f4b508f1ba0@mail.gmail.com>	 <4A150D46.6090806@duet.it>	 <38db14850905210414p41bba89exda7aacd88d905637@mail.gmail.com>	 <4A15423C.5070208@duet.it> <38db14850905210607s11fd9126i4bce902a668dfc6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <38db14850905210607s11fd9126i4bce902a668dfc6@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org

Hi,
> I need additional info:
> iptables -S
> iptables -S -t mangle
> and
> tc -s filter show dev eth0.
>   
in this test I didn't use mangle table, but tc filter and u32 match:
# iptables -S
-P INPUT ACCEPT
-P FORWARD ACCEPT
-P OUTPUT ACCEPT

# iptables -S -t mangle
-P PREROUTING ACCEPT
-P INPUT ACCEPT
-P FORWARD ACCEPT
-P OUTPUT ACCEPT
-P POSTROUTING ACCEPT

# tc -s filter show dev eth0
filter parent 1: protocol ip pref 1 u32
filter parent 1: protocol ip pref 1 u32 fh 800: ht divisor 1
filter parent 1: protocol ip pref 1 u32 fh 800::800 order 2048 key ht 
800 bkt 0 flowid 1:1  (rule hit 8503 success 4851)
  match 00500000/ffff0000 at 20 (success 4851 )
filter parent 1: protocol ip pref 3 u32
filter parent 1: protocol ip pref 3 u32 fh 801: ht divisor 1
filter parent 1: protocol ip pref 3 u32 fh 801::800 order 2048 key ht 
801 bkt 0 flowid 1:3  (rule hit 3652 success 3551)
  match 00510000/ffff0000 at 20 (success 3551 )

> There must be something wrong in your packet marking scheme.
> What is your test environment?
>   

client --- INTERNET--- router --- shaper1 --- server

where:
- client runs connections using wget on different ports
- shaper1 is a linux router that limit bandwith: 1500 Kbits (download 
for server and upload for client) and 300 kbit (upload for server and 
download for client)
- server: http server configured with your script

Fabio

>
>   

