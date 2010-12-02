From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ip6tables redirect
Date: Thu, 2 Dec 2010 21:01:37 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012022024560.23145@obet.zrqbmnf.qr>
References: <26D8DC6230C54AACAA60179B4D5E132C@WINDOWS.KVI.NL> <alpine.LNX.2.01.1012021433430.5361@obet.zrqbmnf.qr> <1F82E3373D994D9B8DECFD9435B37B49@WINDOWS.KVI.NL>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1F82E3373D994D9B8DECFD9435B37B49@WINDOWS.KVI.NL>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fred Zwarts <F.Zwarts@KVI.nl>
Cc: netfilter@vger.kernel.org


On Thursday 2010-12-02 15:55, Fred Zwarts wrote:
>
>Thanks for the suggestion, but I cannot find documentation fro TPROXY,
>nor for the local routing.

>ip6tables -A PREROUTING -t mangle -p tcp --dport 8080 -j TPROXY --to-port 587
>
>But then it complains again that it does not know option --to-port or --on-port.

Hm this seems to be an unspotted omission (bluntly, a bug) in
the userspace tool. I'll get to that ASAP.
