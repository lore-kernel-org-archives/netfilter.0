From: /dev/rob0 <rob0@gmx.co.uk>
Subject: -p udp and --ctstate NEW
Date: Tue, 16 Nov 2010 18:15:17 -0600
Message-ID: <20101117001517.GV23013@cardinal>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm experimenting with -m recent to stem SIP attacks. As part of the 
experiment I have a --ctstate NEW -p udp --dport 5060 -j LOG rule to 
log new SIP "connections".

I'm currently under attack from 61.135.88.173 in China, and the 
strange thing was that all those LOG lines were identical except for 
slight fluxuations in length. All same source port, 5164. (The length 
fluxuations make sense, I saw part of the attack as it began, and it 
was running through a dictionary of names.)

What I'm curious about is how those were all --ctstate NEW, why not 
ESTABLISHED? I thought the same source.IP:sport -> dest.IP:dport 
would be seen as ESTABLISHED.

Asterisk console snippet of the attack before blocking:

[Nov 16 16:39:23] NOTICE[2072]: chan_sip.c:21639 handle_request_register: Registration from '"hannibal"<sip:hannibal@192.0.2.160>' failed for '61.135.88.173' - No matching peer found
[Nov 16 16:39:23] NOTICE[2072]: chan_sip.c:21639 handle_request_register: Registration from '"hannible"<sip:hannible@192.0.2.160>' failed for '61.135.88.173' - No matching peer found
[Nov 16 16:39:23] NOTICE[2072]: chan_sip.c:21639 handle_request_register: Registration from '"harding"<sip:harding@192.0.2.160>' failed for '61.135.88.173' - No matching peer found
[Nov 16 16:39:23] NOTICE[2072]: chan_sip.c:21639 handle_request_register: Registration from '"harrison"<sip:harrison@192.0.2.160>' failed for '61.135.88.173' - No matching peer found
[Nov 16 16:39:23] NOTICE[2072]: chan_sip.c:21639 handle_request_register: Registration from '"harvard"<sip:harvard@192.0.2.160>' failed for '61.135.88.173' - No matching peer found
[Nov 16 16:39:23] NOTICE[2072]: chan_sip.c:21639 handle_request_register: Registration from '"hathaway"<sip:hathaway@192.0.2.160>' failed for '61.135.88.173' - No matching peer found

LOG rules:
[1:362] -A BadGuy -p udp -j LOG --log-prefix "SIP attacker: "
...
[19:6866] -A WAN -p udp -m conntrack --ctstate NEW -m udp --dport 5060 -j LOG --log-prefix "NEW SIP: "

$ dmesg | tail -20
NEW SIP: IN=eth1 OUT= MAC=00:12:9b:aa:ae:2b:00:17:e1:2d:fa:3f:09:00 SRC=61.135.88.173 DST=192.0.2.160 LEN=362 TOS=0x00 PREC=0x00 TTL=44 ID=0 DF PROTO=UDP SPT=5164 DPT=5060 LEN=342
NEW SIP: IN=eth1 OUT= MAC=00:12:9b:aa:ae:2b:00:17:e1:2d:fa:3f:09:00 SRC=61.135.88.173 DST=192.0.2.160 LEN=361 TOS=0x00 PREC=0x00 TTL=44 ID=0 DF PROTO=UDP SPT=5164 DPT=5060 LEN=341
NEW SIP: IN=eth1 OUT= MAC=00:12:9b:aa:ae:2b:00:17:e1:2d:fa:3f:09:00 SRC=61.135.88.173 DST=192.0.2.160 LEN=361 TOS=0x00 PREC=0x00 TTL=44 ID=0 DF PROTO=UDP SPT=5164 DPT=5060 LEN=341
NEW SIP: IN=eth1 OUT= MAC=00:12:9b:aa:ae:2b:00:17:e1:2d:fa:3f:09:00 SRC=61.135.88.173 DST=192.0.2.160 LEN=360 TOS=0x00 PREC=0x00 TTL=44 ID=0 DF PROTO=UDP SPT=5164 DPT=5060 LEN=340
NEW SIP: IN=eth1 OUT= MAC=00:12:9b:aa:ae:2b:00:17:e1:2d:fa:3f:09:00 SRC=61.135.88.173 DST=192.0.2.160 LEN=362 TOS=0x00 PREC=0x00 TTL=44 ID=0 DF PROTO=UDP SPT=5164 DPT=5060 LEN=342
NEW SIP: IN=eth1 OUT= MAC=00:12:9b:aa:ae:2b:00:17:e1:2d:fa:3f:09:00 SRC=61.135.88.173 DST=192.0.2.160 LEN=361 TOS=0x00 PREC=0x00 TTL=44 ID=0 DF PROTO=UDP SPT=5164 DPT=5060 LEN=341
NEW SIP: IN=eth1 OUT= MAC=00:12:9b:aa:ae:2b:00:17:e1:2d:fa:3f:09:00 SRC=61.135.88.173 DST=192.0.2.160 LEN=359 TOS=0x00 PREC=0x00 TTL=44 ID=0 DF PROTO=UDP SPT=5164 DPT=5060 LEN=339
NEW SIP: IN=eth1 OUT= MAC=00:12:9b:aa:ae:2b:00:17:e1:2d:fa:3f:09:00 SRC=61.135.88.173 DST=192.0.2.160 LEN=362 TOS=0x00 PREC=0x00 TTL=44 ID=0 DF PROTO=UDP SPT=5164 DPT=5060 LEN=342
NEW SIP: IN=eth1 OUT= MAC=00:12:9b:aa:ae:2b:00:17:e1:2d:fa:3f:09:00 SRC=61.135.88.173 DST=192.0.2.160 LEN=361 TOS=0x00 PREC=0x00 TTL=44 ID=0 DF PROTO=UDP SPT=5164 DPT=5060 LEN=341
NEW SIP: IN=eth1 OUT= MAC=00:12:9b:aa:ae:2b:00:17:e1:2d:fa:3f:09:00 SRC=61.135.88.173 DST=192.0.2.160 LEN=362 TOS=0x00 PREC=0x00 TTL=44 ID=0 DF PROTO=UDP SPT=5164 DPT=5060 LEN=342
NEW SIP: IN=eth1 OUT= MAC=00:12:9b:aa:ae:2b:00:17:e1:2d:fa:3f:09:00 SRC=61.135.88.173 DST=192.0.2.160 LEN=362 TOS=0x00 PREC=0x00 TTL=44 ID=0 DF PROTO=UDP SPT=5164 DPT=5060 LEN=342
NEW SIP: IN=eth1 OUT= MAC=00:12:9b:aa:ae:2b:00:17:e1:2d:fa:3f:09:00 SRC=61.135.88.173 DST=192.0.2.160 LEN=362 TOS=0x00 PREC=0x00 TTL=44 ID=0 DF PROTO=UDP SPT=5164 DPT=5060 LEN=342
NEW SIP: IN=eth1 OUT= MAC=00:12:9b:aa:ae:2b:00:17:e1:2d:fa:3f:09:00 SRC=61.135.88.173 DST=192.0.2.160 LEN=361 TOS=0x00 PREC=0x00 TTL=44 ID=0 DF PROTO=UDP SPT=5164 DPT=5060 LEN=341
NEW SIP: IN=eth1 OUT= MAC=00:12:9b:aa:ae:2b:00:17:e1:2d:fa:3f:09:00 SRC=61.135.88.173 DST=192.0.2.160 LEN=362 TOS=0x00 PREC=0x00 TTL=44 ID=0 DF PROTO=UDP SPT=5164 DPT=5060 LEN=342
NEW SIP: IN=eth1 OUT= MAC=00:12:9b:aa:ae:2b:00:17:e1:2d:fa:3f:09:00 SRC=61.135.88.173 DST=192.0.2.160 LEN=361 TOS=0x00 PREC=0x00 TTL=44 ID=0 DF PROTO=UDP SPT=5164 DPT=5060 LEN=341
NEW SIP: IN=eth1 OUT= MAC=00:12:9b:aa:ae:2b:00:17:e1:2d:fa:3f:09:00 SRC=61.135.88.173 DST=192.0.2.160 LEN=362 TOS=0x00 PREC=0x00 TTL=44 ID=0 DF PROTO=UDP SPT=5164 DPT=5060 LEN=342
NEW SIP: IN=eth1 OUT= MAC=00:12:9b:aa:ae:2b:00:17:e1:2d:fa:3f:09:00 SRC=61.135.88.173 DST=192.0.2.160 LEN=362 TOS=0x00 PREC=0x00 TTL=44 ID=0 DF PROTO=UDP SPT=5164 DPT=5060 LEN=342
NEW SIP: IN=eth1 OUT= MAC=00:12:9b:aa:ae:2b:00:17:e1:2d:fa:3f:09:00 SRC=61.135.88.173 DST=192.0.2.160 LEN=361 TOS=0x00 PREC=0x00 TTL=44 ID=0 DF PROTO=UDP SPT=5164 DPT=5060 LEN=341
NEW SIP: IN=eth1 OUT= MAC=00:12:9b:aa:ae:2b:00:17:e1:2d:fa:3f:09:00 SRC=61.135.88.173 DST=192.0.2.160 LEN=362 TOS=0x00 PREC=0x00 TTL=44 ID=0 DF PROTO=UDP SPT=5164 DPT=5060 LEN=342
SIP attacker: IN=eth1 OUT= MAC=00:12:9b:aa:ae:2b:00:17:e1:2d:fa:3f:09:00 SRC=61.135.88.173 DST=192.0.2.160 LEN=362 TOS=0x00 PREC=0x00 TTL=44 ID=0 DF PROTO=UDP SPT=5164 DPT=5060 LEN=342
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
