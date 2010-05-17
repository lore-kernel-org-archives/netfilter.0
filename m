From: Curby <curby@cur.by>
Subject: Re: Port Knocking with default hooks/modules
Date: Mon, 17 May 2010 00:13:53 -0600
Message-ID: <AANLkTimkd1gBIdYyOnmcanrIAO3FTTM_v9p8973JQhH7@mail.gmail.com>
References: <AANLkTikI4u4ZXG6jxCGYj-Ig5HLc47mF7Mey9sHh9tNu@mail.gmail.com> 
	<alpine.LSU.2.01.1005170749450.24718@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1005170749450.24718@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On Sun, May 16, 2010 at 11:51 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
> It doesn't use the much simpler -m pknock from Xtables-addons ;)

Thanks for the replies, folks.  I've looked at both fwknop and
xtables-addons before, but I wanted to start with something using raw
iptables rules, especially since neither of those solutions are in the
current stable Debian distribution.  I note that xtables-addons is in
squeeze and don't mind trying it out in the next distro.

I know that there are more elegant solutions out there, but the basics
should still work.  For now, is there anything obviously wrong in my
ruleset that would make it not match the forwarding rule?  For
example, is it a problem that I set the recent match in (a subchain
of) the INPUT chain but I test against it in the FORWARD chain?  Any
pointers would be appreciated.  Even if I eventually abandon this
scheme, I also have a purely academic interest of better understanding
the recent match.  Thanks again!

--Mike
