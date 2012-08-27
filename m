From: Net Warrior <netwarrior863@gmail.com>
Subject: ssh configuration issue / doubt
Date: Mon, 27 Aug 2012 16:51:05 -0300
Message-ID: <CAP7y58OmPxEPRR=73BFwChc2t=08VFuqNffTJzmqnON4yRoajQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=2vKMINUChHK6cWyWEJgt/kGqKJmjnIBiXuHTipBe0d8=;
        b=Ul4IwRhL+Dn6QHsGeH+mBm573a8xFGlIm/TaK+x6q3SPnBAVhuY72mg4f9D7C9fmBq
         JwNfocYWYFQoC7xHl+rCxhT8M8c49wLfGlJlCjlt+oo2yYXktb51NSMTFKb6k3RJEmef
         1Sh+wB3ryAD4Ja6VFSXM9VP/lB2XGcXeDK/Ijdp9deqGmp5GfeXIz/8pFxLxFYJ6RyAt
         6yu5/88QzaWiOejU2NqEq8vjot2gZUkQWU9nRrBK3Bjennvwxn2EDOjG2lC4mjG37twf
         2v5U0M365vGEmmSG47noKgqY9qxWzFNPocDJY9+Hnr8sr7cdGGzIfQM/n7myiBWXEWpy
         RZFg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there.
I've got a simple question regarding ssh configuration.
Reading the documentation and googling, It seems that to enable ssh is
the simple thing in the world, I've got this.

 $IPTABLES -A INPUT -i $ETH_PRIMARY -p tcp -s $ANY_MACHINE\
        --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT

With this rule I can connec to the machine, so far so good, now if I
want to do scp or to scp to another machine I get blocked,
I permit ALL the output chain.

The only way I'm able to do ssh to another host or do scp is by adding this

 $IPTABLES -A INPUT -i $ETH_PRIMARY -p tcp -s $ANY_MACHINE\
        --sport 22 -m state --state NEW,ESTABLISHED -j ACCEPT

So I've got this
 8   560 ACCEPT     tcp  --  eth0   *       0.0.0.0/0
0.0.0.0/0           tcp dpt:22 state NEW,ESTABLISHED
    0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0
0.0.0.0/0           tcp spt:22 state NEW,ESTABLISHED
With this two rules I can ssh to another host and do scp, I'm confused
cuz all the examples I've been reading do not
talk to enable both, only destination port.

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination


Is this the  right way or I'm missing reading something?

Thanks in advance
Best Regards
