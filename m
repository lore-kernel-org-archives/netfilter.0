From: Ralph de Boom <lkml@deboom.biz>
Subject: Re: Iptables v1.4.4 + kernel 2.6.31 mangle marking changed?
Date: Tue, 10 Nov 2009 18:34:15 +0100
Message-ID: <4AF9A417.4080005@deboom.biz>
References: <4AF0CF8C.7000602@deboom.biz> <4AF1628D.5080401@trash.net>	 <4AF17E57.2060206@deboom.biz> <4AF18B57.6060707@trash.net>	 <4AF1A397.90806@deboom.biz> <56378e320911050352p64455be8ga21655668c361d95@mail.gmail.com> <4AF310FC.1060505@deboom.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AF310FC.1060505@deboom.biz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Richard Horton <richard.horton@solstans.co.uk>
Cc: Patrick McHardy <kaber@trash.net>, netfilter@vger.kernel.org

Ralph de Boom schreef:
> Richard Horton schreef:
>>> Right, at this point you've lost me, how I will manage to do that, 
>>> and where
>>> does the infomation get stored?
>>>     
>>
>> You will need to turn trace on...
>> iptables -A PREROUTING -t raw -J TRACE will turn tracing on for 
>> everything.
>>
>> The information is then stored in the syslog as per your syslog
>> configuration - TRACE will show which rules etc your packets have
>> encountered.
>>
>>   
> Ok got that since kern.log will get majorly flooded I grepped the output.
> If needed I can attach the whole log?
>
> cat kern.log | grep 81.4.97.
>
> Nov  5 18:48:14 sakura kernel: [  194.028498] fwmark 0x1: IN=eth1 OUT= 
> MAC=00:1b:21:2d:a9:fa:00:1b:21:32:99:5f:08:00 SRC=192.168.1.30 
> DST=81.4.97.160 LEN=48 TOS=0x00 PREC=0x00 TTL=128 ID=13005 DF 
> PROTO=TCP SPT=52436 DPT=80 WINDOW=8192 RES=0x00 SYN URGP=0 MARK=0x1
> Nov  5 18:48:14 sakura kernel: [  194.028527] TRACE: 
> mangle:PREROUTING:policy:3 IN=eth1 OUT= 
> MAC=00:1b:21:2d:a9:fa:00:1b:21:32:99:5f:08:00 SRC=192.168.1.30 
> DST=81.4.97.160 LEN=48 TOS=0x00 PREC=0x00 TTL=128 ID=13005 DF 
> PROTO=TCP SPT=52436 DPT=80 SEQ=2949910603 ACK=0 WINDOW=8192 RES=0x00 
> SYN URGP=0 OPT (0204116C01010402) MARK=0x1
> Nov  5 18:48:14 sakura kernel: [  194.028570] TRACE: 
> mangle:FORWARD:policy:1 IN=eth1 OUT=eth0 SRC=192.168.1.30 
> DST=81.4.97.160 LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=13005 DF 
> PROTO=TCP SPT=52436 DPT=80 SEQ=2949910603 ACK=0 WINDOW=8192 RES=0x00 
> SYN URGP=0 OPT (0204116C01010402) MARK=0x1
> Nov  5 18:48:14 sakura kernel: [  194.028598] TRACE: 
> filter:FORWARD:rule:1 IN=eth1 OUT=eth0 SRC=192.168.1.30 
> DST=81.4.97.160 LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=13005 DF 
> PROTO=TCP SPT=52436 DPT=80 SEQ=2949910603 ACK=0 WINDOW=8192 RES=0x00 
> SYN URGP=0 OPT (0204116C01010402) MARK=0x1
> Nov  5 18:48:14 sakura kernel: [  194.028626] TRACE: 
> mangle:POSTROUTING:policy:1 IN= OUT=eth0 SRC=192.168.1.30 
> DST=81.4.97.160 LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=13005 DF 
> PROTO=TCP SPT=52436 DPT=80 SEQ=2949910603 ACK=0 WINDOW=8192 RES=0x00 
> SYN URGP=0 OPT (0204116C01010402) MARK=0x1
> Nov  5 18:48:14 sakura kernel: [  194.149805] TRACE: 
> raw:PREROUTING:policy:2 IN=eth0 OUT= 
> MAC=00:50:bf:65:b7:c1:00:18:39:27:fc:5a:08:00 SRC=81.4.97.160 
> DST=192.168.2.40 LEN=48 TOS=0x00 PREC=0x00 TTL=58 ID=0 DF PROTO=TCP 
> SPT=80 DPT=52436 SEQ=3690844742 ACK=2949910604 WINDOW=5840 RES=0x00 
> ACK SYN URGP=0 OPT (020405B401010402)
> Nov  5 18:48:14 sakura kernel: [  194.149861] TRACE: 
> mangle:PREROUTING:policy:3 IN=eth0 OUT= 
> MAC=00:50:bf:65:b7:c1:00:18:39:27:fc:5a:08:00 SRC=81.4.97.160 
> DST=192.168.2.40 LEN=48 TOS=0x00 PREC=0x00 TTL=58 ID=0 DF PROTO=TCP 
> SPT=80 DPT=52436 SEQ=3690844742 ACK=2949910604 WINDOW=5840 RES=0x00 
> ACK SYN URGP=0 OPT (020405B401010402)
> Nov  5 18:48:15 sakura kernel: [  195.173980] TRACE: 
> raw:PREROUTING:policy:2 IN=eth0 OUT= 
> MAC=00:50:bf:65:b7:c1:00:18:39:27:fc:5a:08:00 SRC=81.4.97.160 
> DST=192.168.2.40 LEN=48 TOS=0x00 PREC=0x00 TTL=58 ID=0 DF PROTO=TCP 
> SPT=80 DPT=52436 SEQ=3690844742 ACK=2949910604 WINDOW=5840 RES=0x00 
> ACK SYN URGP=0 OPT (020405B401010402)
> Nov  5 18:48:15 sakura kernel: [  195.174046] TRACE: 
> mangle:PREROUTING:policy:3 IN=eth0 OUT= 
> MAC=00:50:bf:65:b7:c1:00:18:39:27:fc:5a:08:00 SRC=81.4.97.160 
> DST=192.168.2.40 LEN=48 TOS=0x00 PREC=0x00 TTL=58 ID=0 DF PROTO=TCP 
> SPT=80 DPT=52436 SEQ=3690844742 ACK=2949910604 WINDOW=5840 RES=0x00 
> ACK SYN URGP=0 OPT (020405B401010402)
> Nov  5 18:48:27 sakura kernel: [  207.173329] TRACE: 
> raw:PREROUTING:policy:2 IN=eth0 OUT= 
> MAC=00:50:bf:65:b7:c1:00:18:39:27:fc:5a:08:00 SRC=81.4.97.160 
> DST=192.168.2.40 LEN=48 TOS=0x00 PREC=0x00 TTL=58 ID=0 DF PROTO=TCP 
> SPT=80 DPT=52436 SEQ=3690844742 ACK=2949910604 WINDOW=5840 RES=0x00 
> ACK SYN URGP=0 OPT (020405B401010402)
> Nov  5 18:48:27 sakura kernel: [  207.173394] TRACE: 
> mangle:PREROUTING:policy:3 IN=eth0 OUT= 
> MAC=00:50:bf:65:b7:c1:00:18:39:27:fc:5a:08:00 SRC=81.4.97.160 
> DST=192.168.2.40 LEN=48 TOS=0x00 PREC=0x00 TTL=58 ID=0 DF PROTO=TCP 
> SPT=80 DPT=52436 SEQ=3690844742 ACK=2949910604 WINDOW=5840 RES=0x00 
> ACK SYN URGP=0 OPT (020405B401010402)
> Nov  5 18:48:52 sakura kernel: [  231.380824] TRACE: 
> raw:PREROUTING:policy:2 IN=eth0 OUT= 
> MAC=00:50:bf:65:b7:c1:00:18:39:27:fc:5a:08:00 SRC=81.4.97.160 
> DST=192.168.2.40 LEN=48 TOS=0x00 PREC=0x00 TTL=58 ID=0 DF PROTO=TCP 
> SPT=80 DPT=52436 SEQ=3690844742 ACK=2949910604 WINDOW=5840 RES=0x00 
> ACK SYN URGP=0 OPT (020405B401010402)
> Nov  5 18:48:52 sakura kernel: [  231.380891] TRACE: 
> mangle:PREROUTING:policy:3 IN=eth0 OUT= 
> MAC=00:50:bf:65:b7:c1:00:18:39:27:fc:5a:08:00 SRC=81.4.97.160 
> DST=192.168.2.40 LEN=48 TOS=0x00 PREC=0x00 TTL=58 ID=0 DF PROTO=TCP 
> SPT=80 DPT=52436 SEQ=3690844742 ACK=2949910604 WINDOW=5840 RES=0x00 
> ACK SYN URGP=0 OPT (020405B401010402)
> Nov  5 18:49:40 sakura kernel: [  279.579532] TRACE: 
> raw:PREROUTING:policy:2 IN=eth0 OUT= 
> MAC=00:50:bf:65:b7:c1:00:18:39:27:fc:5a:08:00 SRC=81.4.97.160 
> DST=192.168.2.40 LEN=48 TOS=0x00 PREC=0x00 TTL=58 ID=0 DF PROTO=TCP 
> SPT=80 DPT=52436 SEQ=3690844742 ACK=2949910604 WINDOW=5840 RES=0x00 
> ACK SYN URGP=0 OPT (020405B401010402)
> Nov  5 18:49:40 sakura kernel: [  279.579591] TRACE: 
> mangle:PREROUTING:policy:3 IN=eth0 OUT= 
> MAC=00:50:bf:65:b7:c1:00:18:39:27:fc:5a:08:00 SRC=81.4.97.160 
> DST=192.168.2.40 LEN=48 TOS=0x00 PREC=0x00 TTL=58 ID=0 DF PROTO=TCP 
> SPT=80 DPT=52436 SEQ=3690844742 ACK=2949910604 WINDOW=5840 RES=0x00 
> ACK SYN URGP=0 OPT (020405B401010402)
Im pretty patient, but since I haven't seen a response in a week I'm 
poking you guys again.


