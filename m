From: whiplash <whiplash@bofhland.org>
Subject: Re: Outgoing redirection with iptables - TCP skips NAT?
Date: Thu, 19 Mar 2009 23:57:23 +0100
Message-ID: <49C2CDD3.5050202@bofhland.org>
References: <17e3a8f80903190409w3b5d8822qef94af9106f08f21@mail.gmail.com>	 <20090319144343.312510@gmx.net> <17e3a8f80903190755m58be3d8ere3b3392c8e0c98d6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <17e3a8f80903190755m58be3d8ere3b3392c8e0c98d6@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Kristian Evensen ha scritto:

> found out that it sort of works using conntrack -F and rules

There's no reason to flush the whole table when you can
flush single states by using conntrack -D .
