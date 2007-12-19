From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: iptables performance problems
Date: Wed, 19 Dec 2007 10:28:19 +0000 (GMT)
Message-ID: <Pine.LNX.4.58.0712191012530.15373@mail3.jubileegroup.co.uk>
References: <4768EA52.7070602@oranged.to>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4768EA52.7070602@oranged.to>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,

On Wed, 19 Dec 2007, Jimmy Stewpot wrote:

> I am currently using iptables on Linux kernel version 2.6.15 (Ubuntu
> Dapper). I have recently been having problems with my servers load going
> through the roof as remote hosts do nmap scans against the server. My
> current iptables configuration is as follows
> [snip]
> It seems from my performance diagnostics its the logging which is
> causing the system to buckle rather than the packet rate or anything
> like that. Since I first noticed the system being hammered I put the -m
> limit --limit 10/min on the LOG rule but it appears to either not work
> or I have put it in the wrong place. Can anyone give me some advice
> regarding performance and logging.

Most of the time I see no point in logging dropped packets with iptables.

In my systems iptables drops packets as soon as possible.  What little
logging is done is done by p0f, directly to a file.  That process can
be killed at any time, with no adverse effect on system operation.

Syslog-ng feeds data to one of several scripts, which in turn log to a
database, if (and only if) a packet is accepted.  There are different
scripts for mail, http, whatever.  Compared with the other things that
the boxes are doing, the load is negligible.

--

73,
Ged.
