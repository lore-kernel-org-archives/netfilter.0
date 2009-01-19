From: Sitaram Chamarty <sitaramc@gmail.com>
Subject: Re: CONNLIMIT Questions
Date: Mon, 19 Jan 2009 15:34:16 +0000 (UTC)
Message-ID: <slrngn97bo.dts.sitaramc@sitaramc.homelinux.net>
References: <55F56AFD-736E-4FBB-9F08-B4A6A3393140@dancing.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 2009-01-18, Peter Renzland <peter@dancing.org> wrote:
> 1. Is REJECT any better than DROP?  (Will anything or anyone actually  
> get the reject message and learn anything from it?)

REJECT is better than DROP in the sense that the application
making the connection will get (and be able to pass back to
the user, presumably) a proper error message.  A DROP looks
like the packet didn't make it, and the program will not
report back to the user until some timeout or retry limit
finishes.

>      But that is not at all what I want to do.   I want to restrict  
> the number of greatly *divergent* connections to many, many different  
> servers.

> Perhaps there is a better (effective) way to limit connection attempts  
> by LAN IP?
> In any direction and for any protocol.

You could take a look at the hashlimit and the limit
modules; one of those should do what you want.  I have no
used the hashlimit one so far, and the limit one only for
incoming connections, but they seem more general than
connlimit.

