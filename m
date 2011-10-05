From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How to block ssh on specific ethernet interface
Date: Wed, 5 Oct 2011 12:17:16 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1110051214550.20695@frira.zrqbmnf.qr>
References: <A5D3AC0FAABBF34A9FD613C14AAC59B71F8AFF@sonusinmail02.sonusnet.com> <CAHEKYV4NAdedVx0JM6O5Q4SNaDxk+2mVw_YvNJiQrt7OwQbsKA@mail.gmail.com> <20111005000932.2txxwdy9vrk8wkc8@mail.dalan.us>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20111005000932.2txxwdy9vrk8wkc8@mail.dalan.us>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Alanis <canito@dalan.us>
Cc: netfilter@vger.kernel.org


On Wednesday 2011-10-05 07:09, David Alanis wrote:
>> iptables -A SERVICES  -i eth0 -p tcp -m tcp --dport 22 -m comment
>> --comment "allow ssh into machine, from eth0" -j ACCEPT
>
> Your way is another way of doing it, but isn't Ganesh's rule wrong?
>
> The man page says that you can specify the protocol with *-p* or with the match
> option *-m* so essentially that would be incorrect?
>
> MATCH EXTENSIONS
> iptables can use extended packet matching modules.  These are loaded in two
> ways: implicitly, when -p or --protocol is specified, or  with  the  -m  or
> --match options,  followed  by  the  matching  module name; after these,
> various extra command line options become available, depending on the specific
> module. You can specify multiple extended match modules in one line, and you
> can use the -h or --help options after the module has been specified to receive
> help  specific to that module.

The manpage is a little unclear here. -p and -m are very much doing
two different things, and omitting -p usually gets you to not
matching.
