From: Curby <curby@cur.by>
Subject: Re: iptables NEW or SYN
Date: Thu, 13 May 2010 12:19:05 -0600
Message-ID: <AANLkTimpGd4uEnY5UiFQDs1oE6uEji6lbLnUej7eCXoX@mail.gmail.com>
References: <hshbmv$547$1@dough.gmane.org> <alpine.LSU.2.01.1005131916320.9398@obet.zrqbmnf.qr> 
	<hshf0k$ine$1@dough.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <hshf0k$ine$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Feldmann <feldmann_markus@gmx.de>
Cc: netfilter@vger.kernel.org

On Thu, May 13, 2010 at 12:05 PM, Markus Feldmann
<feldmann_markus@gmx.de> wrote:
> What are CTs?

Mebbe Conntrack?  The basic point that Jan's trying to make is that
NEW/ESTABLISHED/INVALID/RELATED describes packets as they're seen by
the connection tracking.  It is not necessarily related to whether a
TCP packet has the SYN flag set.

If a new and valid ICMP ping packet comes in, it's considered NEW by
conntrack because it's not associated with any other traffic, not is
it INVALID.  That's an example of NEW packets that don't have to be
TCP SYN.

--Mike
