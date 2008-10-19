From: Simon <tanstaafl@libertytrek.org>
Subject: Re: Log flooded with these...
Date: Sun, 19 Oct 2008 11:53:19 -0400
Message-ID: <48FB57EF.2090505@libertytrek.org>
References: <48FB4FD8.7090307@libertytrek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48FB4FD8.7090307@libertytrek.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/19/2008 11:18 AM, Simon wrote:
> Hello,
> 
> I'm not sure whats going on here, but I came in today and my log is
> being flooded with these... about once per second, I get 2 or 3 of the
> following:

Ok, reviewing the logs to see when these started, it was right at 3:00pm
yesterday (Saturday), and less than a minute after the hourly cron job
ran - up until then, the logs looked completely normal:

Oct 18 15:00:01 myhost cron[22911]: (root) CMD (rm -f
/var/spool/cron/lastrun/cron.hourly)
Oct 18 15:00:01 myhost cron[22912]: (root) CMD (test -x
/usr/sbin/run-crons && /usr/sbin/run-crons )
Oct 18 15:00:51 myhost IPTABLES-IN Default Drop: IN=eth0 OUT=
MAC=ff:ff:ff:ff:ff:ff:00:11:2f:36:c6:4c:08:00 SRC=192.168.1.47
DST=255.255.255.
255 LEN=328 TOS=0x00 PREC=0x00 TTL=128 ID=18229 PROTO=UDP SPT=68 DPT=67
LEN=308
Oct 18 15:01:38 myhost IPTABLES-IN Default Drop: IN=eth0 OUT=
MAC=ff:ff:ff:ff:ff:ff:00:1c:c0:69:16:89:08:00 SRC=0.0.0.0
DST=255.255.255.255 L
EN=328 TOS=0x00 PREC=0x00 TTL=128 ID=351 PROTO=UDP SPT=68 DPT=67 LEN=308
Oct 18 15:01:38 myhost IPTABLES-IN Default Drop: IN=eth0 OUT=
MAC=ff:ff:ff:ff:ff:ff:00:04:5a:8f:d6:11:08:00 SRC=192.168.1.250
DST=255.255.255
.255 LEN=347 TOS=0x00 PREC=0x00 TTL=128 ID=12140 PROTO=UDP SPT=67 DPT=68
LEN=327
Oct 18 15:01:38 myhost IPTABLES-IN Default Drop: IN=eth0 OUT=
MAC=ff:ff:ff:ff:ff:ff:00:1c:c0:69:16:89:08:00 SRC=0.0.0.0
DST=255.255.255.255 L
EN=360 TOS=0x00 PREC=0x00 TTL=128 ID=352 PROTO=UDP SPT=68 DPT=67 LEN=340

I have installed a few updates recently, but not iptables...

There was an update available for it - has been for a while - so I went
ahead and updated it, but the problem persists... I also tried updating
the kernel (there's been an update available for it for a while too) and
rebooted, but again, the problem remains...

Everything else on this server seems fine (mail, web)...

Is the domain controller actually doing something it shouldn't? It seems
to be fine, nothing unusual in the logs for it...

Besides - it is just way too suspicious that this started exactly at
3:00pm, and immediately following the hourly cron job...

Anyone have any ideas?
