From: Scott Mcdermott <smcdermott@questra.com>
Subject: Re: SNAT interaction with kernel-based IPSEC (in 2.6)
Date: Thu, 4 Sep 2003 07:15:43 -0400
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <20030904111543.GT17837@questra.com>
References: <20030904091525.GO17837@questra.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20030904091525.GO17837@questra.com>
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org, linux-kernel@vger.kernel.org

To netfilter@lists.netfilter.org on Thu  4/09 05:15 -0400:
> I'm having some difficulty doing simple pings over an
> IPSEC tunnel using the implementation in 2.6.0-test4 (with
> Racoon, and successful Phase 1 and 2, I get the IPSEC SA
> fine), in combination with iptables.

Nevermind this, I had set the security policy with the wrong
/24 on the remote end.  It's now working great with IPSEC
and doing SNAT only when it doesn't traverse the tunnel.
I'm really surprised that it "just works."  The IPSEC in 2.6
is very good IMO, basically turnkey.

It still would be nice to know where IPSEC fits in to the
Netfilter engine (ie, why it does "just work" and not SNAT
when it goes over the tunnel), but it works great now...I
think RTFS is in order.
