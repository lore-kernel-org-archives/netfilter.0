From: Jon Lewis <jlewis@lewis.org>
Subject: Re: a dos?
Date: Mon, 26 Aug 2013 20:35:03 -0400 (EDT)
Message-ID: <Pine.LNX.4.61.1308262032410.17328@soloth.lewis.org>
References: <521BF007.4040907@mailinator.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <521BF007.4040907@mailinator.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Mike Wright <mike.wright@mailinator.com>
Cc: netfilter@vger.kernel.org

On Mon, 26 Aug 2013, Mike Wright wrote:

> Hi all,
>
> Don't know if this is the appropriate place to ask so if not please just 
> ignore.
>
> There is some unexplained, non-stop traffic that won't go away.
>
> 27.50.2.191:80 keeps calling me at 63.192.15.229:4460.
>
> tcpdump shows 2 types of Flags: [S.] and [.], each one's packet numbers never 
> change.  Almost all of the packets are type 1.

The [S.] is likely step 2 of the 3-way handshake in making a TCP 
connection.  If you're not sending syns to 27.50.2.191:80, then perhaps 
someone else is, either as an attack against 27.50.2.191, or because 
they're using your IP space (likely on a private network) and have leaky 
NAT.

> Something puzzling was that the source IP may be related to the DEBOGON 
> Project?

Why do you think that?

----------------------------------------------------------------------
  Jon Lewis, MCP :)           |  I route
                              |  therefore you are
_________ http://www.lewis.org/~jlewis/pgp for PGP public key_________
