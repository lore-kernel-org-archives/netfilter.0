From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Wrapper script for ipset listing
Date: Sat, 5 Jan 2013 18:10:25 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1301051809460.23031@nerf07.vanv.qr>
References: <50E84F5E.8060704@airpost.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50E84F5E.8060704@airpost.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Born Without <blackhole@airpost.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Saturday 2013-01-05 17:05, Born Without wrote:

> Hello list!
>
> As I was missing those features in the ipset set listing capabilities:
>
> - show sum of set members
> - suppress listing of headers
> - choose a delimiter character for separating member entries
>
> I wrote a little wrapper script (for the bash shell) to support them.
> For those who like, you'll find it attached.

There's libipset, with which this task should be achievable to the 
maximum customizable degree without involving ugly text parsing with sh.
