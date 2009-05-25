From: Fabio Marcone <fabio.marcone@duet.it>
Subject: Re: tc and priority
Date: Mon, 25 May 2009 16:55:52 +0200
Message-ID: <4A1AB178.2010107@duet.it>
References: <4A142FF7.1050700@duet.it> <4A150D46.6090806@duet.it>	 <38db14850905210414p41bba89exda7aacd88d905637@mail.gmail.com>	 <4A15423C.5070208@duet.it>	 <38db14850905210607s11fd9126i4bce902a668dfc6@mail.gmail.com>	 <4A15572D.3000303@duet.it>	 <38db14850905210722k7818822en4d9ceb072ad1c6b6@mail.gmail.com>	 <4A156620.6050904@duet.it>	 <38db14850905211115h68364107vef2ff69c9dc1f0f2@mail.gmail.com>	 <4A16937B.8020405@duet.it> <38db14850905221105l3e940df8y5eae3688f5a9028d@mail.gmail.com> <4A1A87C9.9030007@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A1A87C9.9030007@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
I test this script:
#!/bin/bash

tc qdisc del dev eth0 root
iptables -P INPUT ACCEPT

tc qdisc add dev eth0 root handle 1: prio bands 3
tc qdisc add dev eth0 parent 1:1 handle 2 sfq perturb 10
tc qdisc add dev eth0 parent 1:2 handle 3 sfq perturb 10
tc qdisc add dev eth0 parent 1:3 handle 4 sfq perturb 10
#tc filter add dev eth0 protocol ip parent 1: prio 1 u32 match ip sport 
80 0xffff flowid 1:1
##tc filter add dev eth0 protocol ip parent 1: prio 2 <your 
criteria_middle> flowid 1:2
#tc filter add dev eth0 protocol ip parent 1: prio 3 u32 match ip sport 
81 0xffff flowid 1:3
tc filter add dev eth0 protocol ip parent 1: prio 1 u32 classid 1:1 
match ip protocol 6 0xFF match ip sport 80 0xFFFF
tc filter add dev eth0 protocol ip parent 1: prio 2 u32 classid 1:3 
match ip protocol 6 0xFF match ip sport 81 0xFFFF
tc filter add dev eth0 protocol ip parent 1: prio 3 u32 match u8 0 0 
flowid 1:2


I run 4 high priority processes (classid 1:1) and 1 low priority one 
(classid 1:3).  These are the result:
high proc1: 19.5K/s
high proc2: 5.71K/s
high proc3: 738B/s
high proc4: 12.8K/s

low proc: 5.8 K/s

I don't undestand: low process didn't stall and a high process used a 
datarate << than low process.


Help, help, help!

Fabio
