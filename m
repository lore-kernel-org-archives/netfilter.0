From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: accounting
Date: Wed, 13 Feb 2008 08:34:14 +0100
Message-ID: <000901c86e12$d6e5a4e0$0b0ffe0a@NS006819>
References: <47B28A5B.2090803@gmail.com>
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47B28A5B.2090803@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> What would be the correct method for like accounting programs
> for like a 'pay as you go' internet.
>
> Basically keep track users bandwidth usage, time etc.
>
> For the guys in the ISP market, what or how would you guys go
> about this, or am I doomed to use a commercial
> product like Checkpoint or something.
>
> Im hoping iptables has / can do something.

I'm not in the ISP market, but about a year ago I installed IP
accounting software on a server to see how it works. I looked and found
ipac-ng and iag in an old download directory but I can't remember which
one I got working.. The latest versions of both packages are not recent
(2004, 2005) but at the time I got one of them working.

Maybe you can do something with the below :
ipac-ng: http://sourceforge.net/project/showfiles.php?group_id=28513
ipac-ng (howto): http://martybugs.net/linux/ipac.cgi
iag: http://dev.lashout.net/iag/ (Needs Sablotron)

Really, I don't remember which one worked and what the results looked
like so I hope this is of any use.


Grts,
Rob


