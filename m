From: Curby <curby@cur.by>
Subject: Re: Blocking Ads.
Date: Tue, 22 Jun 2010 12:41:18 -0600
Message-ID: <AANLkTimRWJsPH73ASlu7nUY4iuG-ZnB_r7KpMZv64-fd@mail.gmail.com>
References: <868109.94510.qm@web112409.mail.gq1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <868109.94510.qm@web112409.mail.gq1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ninad A <ninad_adi@yahoo.com>
Cc: netfilter@vger.kernel.org

On Tue, Jun 22, 2010 at 12:18 PM, Ninad A <ninad_adi@yahoo.com> wrote:
> When we block ads or any such things with iptables then there is lot of delay caused for the application to complete as it is expecting the data which has already been dropped.
> Packets are dropped at IP Layer but who takes care of the delay caused to the application and how to minimize that delay ?

As far as I know, ad blocking is more commonly performed using DNS, by
resolving domain names to 127.0.0.1, or to a server to serve up
notices of removed content (e.g. in a business environment, users
could request that sites be unblocked).  Is there a reason why you
want to block specific IP addresses instead of domains?

Anyway, I suspect that sending back appropriate ICMP error messages
instead of DROPing such requests would provide hints to clients that
they should give up instead of wait for a reply.

--Mike
