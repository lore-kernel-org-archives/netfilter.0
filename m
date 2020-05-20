From: Alexander Dahl <ada@thorsis.com>
Subject: Re: Systemd, nftables, and iptables
Date: Wed, 20 May 2020 14:01:09 +0200
Message-ID: <2332227.1KPpF0BMHE@ada>
References: <db383c6d-952e-1df3-4abb-a03d46d63959@satchell.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <db383c6d-952e-1df3-4abb-a03d46d63959@satchell.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
To: netfilter@vger.kernel.org, list@satchell.net

Hei hei,

Am Montag, 18. Mai 2020, 16:13:21 CEST schrieb Stephen Satchell:
> I'm building a CentOS 8.1 system on a Protectly four-port appliance, to
> be my new firewall.  To avoid problems, I'm trying to remove IPTABLES
> completely from the system so there is no chance of interference between
> the two firewalls.
> 
> Problem:  systemd requires iptables-lib.
> 
> 1.  Why?

Don't know.

> 2.  How to keep systemd from requiring iptables-lib?

Maybe patch it? I stumbled over a ticket lately, and for me it reads like 
systemd does not support nftables, yet?

https://github.com/systemd/systemd/issues/13307

Greets
Alex



