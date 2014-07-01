From: William Taylor <williamt@corp.sonic.net>
Subject: Re: help needed preventing bruteforce behind a reverse proxy
Date: Tue, 01 Jul 2014 08:35:49 -0700
Message-ID: <53B2D555.7060106@corp.sonic.net>
References: <53B26B4C.4030002@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <53B26B4C.4030002@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Francesco Morosinotto <francescomorosinotto@gmail.com>, netfilter@vger.kernel.org

On 7/1/2014 1:03 AM, Francesco Morosinotto wrote:
> Hi guys,
>
> I'm a young "system administrator" that works for a non profit organization.
> I've recently implemented owncloud on a local server running several
> virtual machines.
> Having only a static IP every service (running on different vms) is
> served through a reverse proxy (apache).
>
> I'm trying to secure my cloud installation in order to prevent
> bruteforce attack: I can log the attackers IP (using apache-mod-rpaf
> that reads the original ip from the x-forwarded-for header) and I was
> setting up fail2ban to add these ips to a blacklist and deny the access
> through iptables.
>
> But It seems that iptables is not able to understand where does the
> request come from and always log the internal proxy ip address.
>
> Is there a way to tell iptables to read the x-forwarded-for headers?
>
> can you suggest some other workaround?
>
> thank you guys
>
If you are logging the original source ip's with apache and having
fail2ban add them to a blacklist,
that should be all you need. Iptables should be able to block on those
ips you are feeding it unless
you aren't logging the correct ip. Even if there was an "easy" way for
iptables to reach into the packet
and read the x-forwarded-for address, it wouldn't do any good in this
case because when the packet
hits iptables it hasn't gone through your proxy yet (unless you are
trying to block it on the destination machine
and not the proxy machine). If you need more help post what your
iptables rules look like with an example
of what you are trying to block.

-william
