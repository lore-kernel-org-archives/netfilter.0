From: Robert White <rwhite@pobox.com>
Subject: Re: Open Ports for Mosh
Date: Sun, 9 Apr 2017 07:07:17 +0000
Message-ID: <42f5dc00-055e-c0cb-9bee-8798d8febd44@pobox.com>
References: <CADq=pgn+W1kTtUSheCDxCKAhCTk3e287cvOZ85y=FhcBwHY5cA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CADq=pgn+W1kTtUSheCDxCKAhCTk3e287cvOZ85y=FhcBwHY5cA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Josh Burghandy <kid1000002000@gmail.com>, netfilter@vger.kernel.org

On 04/09/17 05:13, Josh Burghandy wrote:
> I have written this but mosh still does not work:
> nft add rule inet filter input udp dport 60000-61000 accept

You didn't provide the entire output of "list ruleset" so I can not
really help you for sure... but here goes.

I assume you are running the mosh server on the firewall itself.

- Do you have a matching output rule to allow the responses?

- Have you already opened the SSH port for session establishment?

- Do you have ct state established and related enabled in your input and
output chains?

I looked at the firewall instructions for mosh from several of the top
google results and they strongly and silently assume that all the other
plumbing for ssh and connection tracking is in place and known to be
working.

As an aside, if you aren't expecting a thousand simultaneous mosh
sessions you should use a smaller port range. The ports are opened in
order so something more like ten ports is probably plenty.

Super Off Topic: Do be aware that since you cannot reconnect to a
dropped session in mosh, you may well end up leaking sessions or
suffering other 'disappointments', particularly when using mobile
devices. Aside from the rarely-needed bandwidth reduction, using ssh and
screen tends to be much better for remote maintenance.

--Rob.
