From: Simon <tanstaafl@libertytrek.org>
Subject: Re: Log flooded with these...
Date: Sun, 19 Oct 2008 12:42:05 -0400
Message-ID: <48FB635D.2050603@libertytrek.org>
References: <48FB4FD8.7090307@libertytrek.org>	 <48FB57EF.2090505@libertytrek.org> <78e398b30810190903i610b64e3l56fa51402e607cc6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <78e398b30810190903i610b64e3l56fa51402e607cc6@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Doc Nielsen <docnielsen@gmail.com>
Cc: Netfilter list <netfilter@vger.kernel.org>

On 10/19/2008 12:03 PM, Doc Nielsen wrote:
> SPT=68 DPT=67 = DHCP
> 
> did you allow dhcp client/server requests and responses in the
> firewall?

Hey Doc,

Thanks for taking a look...

This is an well-established network, no major/unusual changes prior to
these entries showing up in the log, especially to firewall rules.

> do you have a running dhcp server/client?

The domain controller is the DHCP/DNS server, running Windows Server
2000. The linux server running iptables that has this logging issue has
a static IP, and is not (obviously) running a DHCP server or client.

> what kind of firewall are you using, as frontend for iptables?

I'm not using a 'front-end' - this is a gentoo linux box that serves a
mail and web server, which I also run iptables on for obvious reasons.
It has been running for over 3 years, is kept updated regularly (though
not obsessively so), and survived all of the ensuing major updates to date.

The only things I updated that day - but it was a few hours before this
started - was libpcre and udev...

Any other ideas?
