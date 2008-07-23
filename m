From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: patch-o-matic problems..?
Date: Wed, 23 Jul 2008 12:12:46 +0200
Message-ID: <4887041E.3060101@netfilter.org>
References: <alpine.DEB.1.10.0807192237270.9838@fairy.dhcp.penguin>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.10.0807192237270.9838@fairy.dhcp.penguin>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Zoe Parsons <zoe@zarp.org.uk>
Cc: netfilter@vger.kernel.org

Zoe Parsons wrote:
> Hi, I'm probably just missing something obvious but still....
> 
> I've had the first cause to use something out of POM in a few years
> (ipp2p not that it really matters), and when I run it I just get the
> message:
> /usr/src/iptables-1.4.1.1 doesn't look like a iptables source code
> directory to me.
> 
> I've tried it with the debian package source, a downloaded tarball from
> the  netfilter site, and finally with the git tree (using both
> downloaded and git retrieved copies of POM as well).
> 
> Oh and it's been invoked as: ./runme --download --kernel-path
> /usr/src/linux-source-2.6.25 --iptables-path /usr/src/iptables-1.4.1.1

You forgot to run ./configure in your iptables sources before running
pom-ng?

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
