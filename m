From: richard lucassen <mailinglists@lucassen.org>
Subject: ^N in TRACE output
Date: Mon, 18 Oct 2010 21:20:42 +0200
Message-ID: <20101018212042.a84d4e5a.mailinglists@lucassen.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'm trying to find out why the DNAT is dropping packets without any
reason in a certain configuration.

One difference between a working machine and a machine that drops
packets is a ^N in the TRACE output on the 2nd line where the packet
enters the mangle table (after "mangle:PREROUTING:rule:2 ^N")

Non-working machine:

Oct 18 21:02:08 panoramix TRACE: raw:PREROUTING:policy:2  IN=eth1 OUT=
MAC=00:1e:58:df:ae:04:00:10:a4:ed:a1:e8:08:00  SRC=192.0.0.1
DST=192.0.0.3 LEN=60 TOS=10 PREC=0x00 TTL=64 ID=5684 DF PROTO=TCP
SPT=39276 DPT=22 SEQ=3759103341 ACK=0 WINDOW=5840 SYN URGP=0 Oct 18

21:02:08 panoramix TRACE: mangle:PREROUTING:rule:2 ^N IN=eth1 OUT=
MAC=00:1e:58:df:ae:04:00:10:a4:ed:a1:e8:08:00  SRC=192.0.0.1
DST=192.0.0.3 LEN=60 TOS=10 PREC=0x00 TTL=64 ID=5684 DF PROTO=TCP
SPT=39276 DPT=22 SEQ=3759103341 ACK=0 WINDOW=5840 SYN URGP=0 

Working machine:

Oct 18 21:13:06 fw1 TRACE: raw:PREROUTING:policy:2  IN=eth3 OUT=
MAC=00:15:17:f4:41:47:80:71:1f:3c:f2:81:08:00  SRC=92.68.12.178
DST=213.125.58.53 LEN=84 TOS=00 PREC=0x20 TTL=51 ID=0 DF PROTO=ICMP
TYPE=8 CODE=0 ID=1322 SEQ=1

Oct 18 21:13:06 fw1 TRACE: mangle:PREROUTING:rule:2  IN=eth3 OUT=
MAC=00:15:17:f4:41:47:80:71:1f:3c:f2:81:08:00  SRC=92.68.12.178
DST=213.125.58.53 LEN=84 TOS=00 PREC=0x20 TTL=51 ID=0 DF PROTO=ICMP
TYPE=8 CODE=0 ID=1322 SEQ=1

Does this ^N have a special meaning, or is it an indication to where
the problem is? (bug #680)

R.

-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
| Public key and email address:                                    |
| http://www.lucassen.org/mail-pubkey.html                         |
+------------------------------------------------------------------+
