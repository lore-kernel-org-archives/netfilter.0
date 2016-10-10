From: James <vger_tracker@trackivity.com>
Subject: Re: "nft add element" can't find table
Date: Mon, 10 Oct 2016 15:21:24 -0400
Message-ID: <7b4d974a-79d3-3fd9-6bdd-c23716a5185e@trackivity.com>
References: <d2ecc806-6c37-d1a6-f9a7-3e1668215be3@trackivity.com>
 <CAOkSjBjHhArAKiP9XH8ZggaeR4Jr3pUn7gkJJjRQzNJ1hT4oTw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAOkSjBjHhArAKiP9XH8ZggaeR4Jr3pUn7gkJJjRQzNJ1hT4oTw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arturo Borrero Gonzalez <arturo@debian.org>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

> The command is missing the family spec, i.e, 'inet'.

That was it!  And now my single "inet" table with both ipv4 & ipv6 blackhole drop sets configures without error.  (I expect that it will work just fine.)

Thank you.

> BTW Perhaps you could switch to a newer version of nftables. Debian
> (and ubuntu) includes 0.6 already.

In a few weeks, Ubuntu 16.10 should be released and it appears to have 0.6.

  - James

