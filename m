From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Systemd, nftables, and iptables
Date: Mon, 18 May 2020 16:28:46 +0200
Message-ID: <5774f770-6f87-7924-7490-fa993c8f0549@thelounge.net>
References: <db383c6d-952e-1df3-4abb-a03d46d63959@satchell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <db383c6d-952e-1df3-4abb-a03d46d63959@satchell.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: list@satchell.net, netfilter@vger.kernel.org



Am 18.05.20 um 16:13 schrieb Stephen Satchell:
> I'm building a CentOS 8.1 system on a Protectly four-port appliance, to
> be my new firewall.  To avoid problems, I'm trying to remove IPTABLES
> completely from the system so there is no chance of interference between
> the two firewalls.
> 
> Problem:  systemd requires iptables-lib.
> 
> 1.  Why?
> 2.  How to keep systemd from requiring iptables-lib?

you are trying to solve a non-existing problem

the linked userland libraries have nothing to to with active iptables /
nftables in the kernel and rebuilding systemd just to avoid loading a
userkand library is pointless
