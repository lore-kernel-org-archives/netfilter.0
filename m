From: mouss <mouss@netoyen.net>
Subject: Re: Port 993 and TimeOut
Date: Sun, 27 Jan 2008 01:05:10 +0100
Message-ID: <479BCAB6.4000708@netoyen.net>
References: <4799BEF8.7020507@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4799BEF8.7020507@gmx.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org

Robert M. Albrecht wrote:
> Hi,
>
> I keep getting log-entries (caused by dropping this packets) when my 
> Thunderbird is running (sitting in the background waiting for mail).
>
> IN=br-lan OUT=ppp0 SRC=xxxxxxxx DST=xxxxxx LEN=52 TOS=0x00 PREC=0x00 
> TTL=63 ID=56403 DF PROTO=TCP SPT=49759 DPT=993 WINDOW=65535 RES=0x00 
> ACK FIN URGP=0
>
> 993 is IMAP over SSL.
>
> They happen between 5 and 10 seconds and they come in bulks of 10 to 
> 20 every few minutes.
>
> First I suspected netfilters timeout to close this "stale" 
> tcp-session, but increasing the time-out hasn`t changed anything.
>
> Thunderbird does not complain.
>
> Any ideas what might cause this ?

your antivirus?
