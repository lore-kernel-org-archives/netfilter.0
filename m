From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: patch-o-matic problems..?
Date: Wed, 23 Jul 2008 13:56:39 +0200
Message-ID: <48871C77.5060503@netfilter.org>
References: <alpine.DEB.1.10.0807192237270.9838@fairy.dhcp.penguin>	 <alpine.LNX.1.10.0807201105300.21244@fbirervta.pbzchgretzou.qr>	 <alpine.DEB.1.10.0807201544510.8813@fairy.dhcp.penguin>	 <alpine.LNX.1.10.0807201652360.21244@fbirervta.pbzchgretzou.qr> <935fab200807221736k5c95037fgac0eac3e1e4915b2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <935fab200807221736k5c95037fgac0eac3e1e4915b2@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave <finalglide@gmail.com>
Cc: netfilter@vger.kernel.org

Dave wrote:
> I have to agree with these guys, the whole POM and Xtables things is
> extremely confusing to the newbies.

Indeed. IMO they should not exist anymore.

With regards to POM(-ng) - I cannot talk about the other project since
it is not supported by the Netfilter Project itself - it was something
that we needed during the 2.4 days, since we could not add new features
to the kernel that quickly. However, with the new 2.6 development cycle,
features can get into kernel faster. So if you need some feature or some
contibution into mainline, go and ask for it. Of course, it must suit
the standards and it must be an interesting contribution to what we
already have. On the other hand, you may also get the reason why it is
not in mainline yet.

Well, Anyway I think that we've already discussed about this in a long
thread [1].

[1] http://marc.info/?l=netfilter&m=121484288209802&w=2

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
