From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Port Triggering in IPTables?
Date: Tue, 23 Sep 2008 15:34:49 -0500
Message-ID: <48D952E9.7070501@riverviewtech.net>
References: <37a72e270809222156l2c9a9d2ci47bf4101defd5e3d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <37a72e270809222156l2c9a9d2ci47bf4101defd5e3d@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 09/22/08 23:56, Marcin Polewski wrote:
> Does IPTables support port triggering similarly like DD-WRT does? I 
> want to build my own Linux (or FreeBSD) box with IPTables that would 
> be able to use port triggering. I don't want to use DD-WRT since I 
> want full control over my box (hardware and software).

I'm not aware of any thing in IPTables (proper or extensions) persay 
that provide port knocking support.  However I would think it trivial to 
have something watch log entries and / or ulog entries and alter 
something.  You will need to think out side of the box, but I see no 
reason that you can't solve this and get it to work.



Grant. . . .
