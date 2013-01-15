From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: state match is obsolete 1.4.17
Date: Tue, 15 Jan 2013 10:11:41 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1301150958390.16853@nerf07.vanv.qr>
References: <CAMD-=V+PhM3NLpWyxB0G4KUN6D+-XKL0PZCBAuyUXUw56gmuJw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMD-=V+PhM3NLpWyxB0G4KUN6D+-XKL0PZCBAuyUXUw56gmuJw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Edwards <nick.z.edwards@gmail.com>
Cc: netfilter@vger.kernel.org


On Tuesday 2013-01-15 06:09, Nick Edwards wrote:

>WARNING: The state match is obsolete. Use conntrack instead.
>
>Getting these errors since upgrading to 1.4.17

It is a warning, not an error. (An error would not let use you
the command at all.)

>Am I right in assuming that :
>iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>must now become :
>iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
>or does that not do the same thing?

state is a redundant subset of conntrack (the latter was introduced around
Linux 2.5.32) and shall go away.
