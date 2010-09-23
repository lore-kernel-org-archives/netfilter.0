From: Eric Paris <eparis@parisplace.org>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Thu, 23 Sep 2010 18:42:30 -0400
Message-ID: <AANLkTimUgBXheRfZ+FDKfzL=4E9YO4-tx5f7-BCaJeCF@mail.gmail.com>
References: <4C9696E5.4030803@googlemail.com>
	<AANLkTiny3JCZnWOwHs9OY1vWqTsWAfxFqkiRW5RrRxX+@mail.gmail.com>
	<AANLkTi=qDZW0DMugh__Z76_qYj3_Oq-uEMt8rB0-svz-@mail.gmail.com>
	<alpine.LNX.2.01.1009220041490.23976@obet.zrqbmnf.qr>
	<AANLkTim4b06FySMibSw-4sZdUqtPMmfQFtt94kAgAtr=@mail.gmail.com>
	<alpine.LNX.2.01.1009220130370.25442@obet.zrqbmnf.qr>
	<AANLkTimgV+ZURC+G_R2NOqUmMYQzuDOub7hB35yJS27u@mail.gmail.com>
	<alpine.LNX.2.01.1009232045150.16976@obet.zrqbmnf.qr>
	<AANLkTin+7TrO3BgsCaWn7MfkMjqPYK+1ipu6WozViyxw@mail.gmail.com>
	<alpine.LNX.2.01.1009232054180.16976@obet.zrqbmnf.qr>
	<4C9BA88E.7080507@googlemail.com>
	<alpine.LNX.2.01.1009232148010.18921@obet.zrqbmnf.qr>
	<4C9BB600.6020300@googlemail.com>
	<AANLkTinaGWtK2j9Ob2NKtv58E-OnNAGF7uYG8fCotQX6@mail.gmail.com>
	<alpine.LNX.2.01.1009232249450.21529@obet.zrqbmnf.qr>
	<4C9BBF0D.1010002@googlemail.com>
	<alpine.LNX.2.01.1009232309590.23838@obet.zrqbmnf.qr>
	<4C9BC8C9.2090504@googlemail.com>
	<alpine.LNX.2.01.1009240002180.25685@obet.zrqbmnf.qr>
	<4C9BD4F9.3020107@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C9BD4F9.3020107@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org, sds@tycho.nsa.gov, jmorris@namei.org

On Thu, Sep 23, 2010 at 6:30 PM, Mr Dash Four
<mr.dash.four@googlemail.com> wrote:

> Whoever designed that part of the interface (it wasn't you by any chance,
> was it?) thought, wrongly, that secmark means
> 'show-me-the-internal-number-the-kernel-uses-to-identify-that-security-mark-for-that-particular-connection'!

It was written when secmark was implemented by an SELinux hacker (and
an ex-netfilter hacker) named James Morris who should have known
better.

James, I just cc'd you on this thread.  Basically the conntrack code
exported the selinux sid instead of the context to userspace via both
procfs and its netlink interface.  Mr Dash Four would like to show the
context in both places (I'm going to stop showing the sid everywhere
no matter what).  Jan would like the netlink interface to show the
context and the procfs interface to show nothing (since procfs is
deprecated and what we have been showing has obviously gone unused)

I'll throw in my 2 cents.  I would like to see the proc interface
'fixed' or 'enhanced', I don't care what it is called, to show the
name.  However my patch series (now 6 patches long) splits the netlink
and the procfs changes into separate pieces which can be selectively
applied.

If we can come to a consensus on the question of 'should we show
nothing at all or the context in the procfs interface' then we can
start the question of who wants to carry my series (since it straddles
the security and the netfilter code)

-Eric

p.s. I'll send the series once I get the conntrack userspace code to
understand my changes to make sure I didn't screw anything up.
