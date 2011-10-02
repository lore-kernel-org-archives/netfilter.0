From: Ed W <lists@wildgooses.com>
Subject: Re: [SOLVED] Routing locally generated traffic on fwmark
Date: Sun, 02 Oct 2011 14:11:50 +0100
Message-ID: <4E886316.9030502@wildgooses.com>
References: <1317248412.26402.39.camel@andybev-desktop> <1317279076.26402.52.camel@andybev-desktop> <CAA2qdGUrc31FekJM6r1_s2COoFi5g5iwfpJeozeLED2pYsy3Fw@mail.gmail.com> <1317282807.26402.58.camel@andybev-desktop> <CAA2qdGXAVVu5FwxGDmEztWTNq5=9q+oauo09nx2nH7nQyj3riw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA2qdGXAVVu5FwxGDmEztWTNq5=9q+oauo09nx2nH7nQyj3riw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pandu Poluan <pandu@poluan.info>
Cc: Andrew Beverley <andy@andybev.com>, netfilter@vger.kernel.org

On 29/09/2011 09:29, Pandu Poluan wrote:
> That's why I now no longer write iptables commands directly on the
> shell. I keep my firewall rules in a file /etc/opt/firewall, and if I
> need to add new rules, I just do: `vi /etc/opt/firewall &&
> iptables-restore < /etc/opt/firewall`
>
> (Of course, to seed the file I'd do `iptables-save > /etc/opt/firewall` )
>
> This has the added benefit of allowing me to document all firewall
> changes by doing `hg commit` followed by `hg push` to a local
> Mercurial repository.
>
> (The reason why I put the rules in /etc/opt instead of /etc is so that
> I don't have to create an .hgignore file)
>

Can I also leave a plug for shorewall for similar reasons.  It is a
fairly thin wrapper over iptables (etc), but it allows you to think at a
slightly higher level and wraps things such as setting/restoring fwmarks
and routing, breaks them out from the general access rules.

I find it picks a very nice level between firewall guis and raw editing
of iptables commands.  Give it a try.

Also it's text file based so it's very easy to track via some source
code control system

Cheers

Ed W
