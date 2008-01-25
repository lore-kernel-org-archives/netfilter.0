From: "Robert M. Albrecht" <romal@gmx.de>
Subject: Port 993 and TimeOut
Date: Fri, 25 Jan 2008 11:50:32 +0100
Message-ID: <4799BEF8.7020507@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I keep getting log-entries (caused by dropping this packets) when my 
Thunderbird is running (sitting in the background waiting for mail).

IN=br-lan OUT=ppp0 SRC=xxxxxxxx DST=xxxxxx LEN=52 TOS=0x00 PREC=0x00 TTL=63 
ID=56403 DF PROTO=TCP SPT=49759 DPT=993 WINDOW=65535 RES=0x00 ACK FIN URGP=0

993 is IMAP over SSL.

They happen between 5 and 10 seconds and they come in bulks of 10 to 20 
every few minutes.

First I suspected netfilters timeout to close this "stale" tcp-session, but 
increasing the time-out hasn`t changed anything.

Thunderbird does not complain.

Any ideas what might cause this ?

cu romal
