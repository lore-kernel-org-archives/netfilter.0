From: Eric Leblond <eric@inl.fr>
Subject: Re: CONNMARK target
Date: Mon, 13 Oct 2008 17:10:07 +0200
Message-ID: <20081013151007.GE4148@khasse.inl.fr>
References: <ab52e4180810121012he399cf3pb7c1a4b9474f872f@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ab52e4180810121012he399cf3pb7c1a4b9474f872f@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: okahei@gmail.com
Cc: netfilter@vger.kernel.org

Hi,

On Sunday, 2008 October 12 at 19:12:58 +0200, okahei@gmail.com wrote:
> Hello list.
> 
> I've got a question with CONNMARK target.
> 
> It's possible to mark whole connection playing with this parameter ?
> 
> What i want is when a packet arrives to port 6900 UDP of firewall,
> mark it with 0x99, and when the response packet arrives again from DMZ
> interface of the firewall, are marked again with 0x99.

You can get some information a connmark on the following page :
	http://home.regit.org/?page_id=7

Basically, what you want to add to your ruleset is :
iptables -A POSTROUTING -t mangle -j CONNMARK --restore-mark
iptables -A POSTROUTING -t mangle -j CONNMARK --save-mark

First one restore mark when packet arrive (It put connection mark to the
pt mark.. Second one save packet mark to connection mark to be able
to restore it later (with --restore-mark).

BR,
-- 
Eric Leblond
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/
