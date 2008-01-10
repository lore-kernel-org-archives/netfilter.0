From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: Is there a way to DROP on OUTPUT without returning EPERM?
Date: Thu, 10 Jan 2008 22:26:47 +0000 (GMT)
Message-ID: <Pine.LNX.4.58.0801102224230.23731@mail3.jubileegroup.co.uk>
References: <20080110213605.GA14931@club.cc.cmu.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080110213605.GA14931@club.cc.cmu.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,

On Thu, 10 Jan 2008, Mike Kasick wrote:

> iptables -A OUTPUT -o eth1 -m statistic --mode random --probability 0.5 -j DROP
>
> has the side effect of returning EPERM ... I'd really like to drop
> packets silently without the user application being notified.
>
> Is there a way I can achieve a truly silent DROP on the OUTPUT chain?  Is
> there an extension target that does this that I've missed?

Instead of DROPping it, why not just send it somewhere else?

--

73,
Ged.
