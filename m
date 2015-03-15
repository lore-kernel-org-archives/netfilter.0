From: Bastian Bittorf <bittorf@bluebottle.com>
Subject: Re: iptables rules still working after being flushed (?)
Date: Sun, 15 Mar 2015 20:36:41 +0100
Message-ID: <20150315193641.GC3019@medion.lan>
References: <alpine.DEB.2.11.1503151144110.8487@cantor.unex.es>
 <CADGd2Dr=g9KH91jeJt3a_HSsObrYOQszmaaxvUDHjO=k9-YjpQ@mail.gmail.com>
 <20150315164105.GA13867@cantor.unex.es>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150315164105.GA13867@cantor.unex.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Santiago Vila <sanvila@unex.es>
Cc: John Lauro <johnalauro@gmail.com>, netfilter@vger.kernel.org

* Santiago Vila <sanvila@unex.es> [15.03.2015 20:11]:
> and still I can't make more than 19 ssh connections in a row.

this sounds like an sshd-issue - check:
grep Max /etc/ssh/sshd_config

bye, bastian
