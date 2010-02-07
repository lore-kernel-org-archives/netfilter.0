From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Who can give me any existing iptables rules for reference?
Date: Sun, 7 Feb 2010 10:15:39 -0600
Message-ID: <20100207161539.GA21229@minipax>
References: <28efc0211002060450n782f9273i9489e289dbc62407@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <28efc0211002060450n782f9273i9489e289dbc62407@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Sat, Feb 06, 2010 at 08:50:20PM +0800, supercodeing35271
   supercodeing35271 wrote:
> Hi,i'm a rookie.As learning netfilter/iptables for the first time,=20
> i wanna look some good existing iptables rules scripts as that i=20
> think reading good rules scripts will be useful.

A problem in that is that a script is not typically the best way to
load a set of rules. Race conditions can occur when more than one
trigger invokes the firewall script, when the first instance wasn't
completed yet. iptables-restore(8) (of a ruleset which had been
saved with iptables-save(8)) is the solution to this problem; it
loads the entire ruleset into memory atomically.

I think a lot of folks who want to learn firewall skills get caught
up in trying to do fancy bash(1) things. And way too many of the
ready-made firewall scripts I have seen are clueless and over-
complicated with silly shell tricks.

> So anyone here can share some rules or tell me where to see any=20
> good rules scripts. =A0I must underline that i just need some=20
> references, i do not have any other reason about this.

I would start with a tutorial such as the ones at netfilter.org and
Oskar's frozentux tutorial. Those are slightly out of date, but
should still give you a good start. The man page is maintained, and
should be a good reference for syntax and application of the various
match and target extensions.

Unfortunately I am not aware of a good, up-to-date basic tutorial
that I could recommend. I have not had the time to try to start one,
myself.
--=20
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
