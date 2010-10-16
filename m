From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Time counter of connections (libnetfilter-conntrack?)
Date: Sat, 16 Oct 2010 10:22:00 +0200
Message-ID: <4CB960A8.3070001@netfilter.org>
References: <4CB924EC.3090906@dcc.ufba.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CB924EC.3090906@dcc.ufba.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Italo Valcy <italo@dcc.ufba.br>
Cc: netfilter@vger.kernel.org

On 16/10/10 06:07, Italo Valcy wrote:
> Hi guys!
> 
> Is there an way to get time counter of the connections using
> libnetfilter-conntrack? I mean, I'd like to know how long a connection
> had taken (since the state NEW to DESTROY).
> 
> Any ideias?

The Linux kernel does not track this connection lifetime, so you would
have to listen to NEW events, put the ct objects into some structure
(hashtable, tree, list, etc) and calculate the difference by yourself
once you receive DESTROY events.

It wouldn't be hard to extend the existing code to do this in kernel space.
