From: Arturo Borrero Gonzalez <arturo@debian.org>
Subject: Re: "nft add element" can't find table
Date: Mon, 10 Oct 2016 20:57:30 +0200
Message-ID: <CAOkSjBjHhArAKiP9XH8ZggaeR4Jr3pUn7gkJJjRQzNJ1hT4oTw@mail.gmail.com>
References: <d2ecc806-6c37-d1a6-f9a7-3e1668215be3@trackivity.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d2ecc806-6c37-d1a6-f9a7-3e1668215be3@trackivity.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James <vger_tracker@trackivity.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 10 October 2016 at 20:21, James <vger_tracker@trackivity.com> wrote:
> This is "nftables/xenial,now 0.5+snapshot20151106-1 amd64" on "Release
> 16.04.1 LTS (Xenial Xerus) 64-bit", "Kernel Linux 4.4.0-38-generic x86_64".
>
> The (very simple) nft ruleset below has been working well for me.
>
> But now I've tried to add the set "blackhole" and it does make it into the
> ruleset but attempting to add an element produces:
>
> # nft add element firewall blackhole { 1.2.3.4 timeout 2h }
> <cmdline>:1:1-53: Error: Could not process rule: Table 'firewall' does not
> exist
> add element firewall blackhole { 1.2.3.4 timeout 2h }
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> #

The command is missing the family spec, i.e, 'inet'.

By default, nft will use 'ip' as family, and perhaps no table
'firewall' exists in the ip family.

BTW Perhaps you could switch to a newer version of nftables. Debian
(and ubuntu) includes 0.6 already.
