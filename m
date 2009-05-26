From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Firewall in Load Balance - Active/Active
Date: Wed, 27 May 2009 01:04:21 +0200
Message-ID: <20090526230421.GA31716@internet24.de>
References: <3e7107590905250446g2f3aa95dua9691dc63cc3dfec@mail.gmail.com> <4A1A9756.6040401@netfilter.org> <3e7107590905250635w5c3b78a6m59acf268b5d57a5@mail.gmail.com> <1814bfe70905261139o3dfa9e65ue51626a61d0f4641@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1814bfe70905261139o3dfa9e65ue51626a61d0f4641@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Elvir Kuric <omasnjak@gmail.com>
Cc: Eduardo Sachs <edu.sachs@gmail.com>, netfilter@vger.kernel.org

Danger. Possible flame bait ahead.

On Tue, May 26, 2009 at 08:39:02PM +0200, Elvir Kuric wrote:
> Use CARP, it is best and try to set up it on OpenBSD. On linux it is
> ucarp, but I would recommend
> OpenBSD + CARP

Given that the OP was looking for an active/active solution and thus is presumably
interested in performance as well, I wonder why you would recommend
OpenBSD's pf+carp. In the last performance comparison I read some years back
pf was almost an order of magnitude slower than iptables at the time.

We for instance run a pair of OpenBSD boxen on some old 933 GHz P3s with
4 ste/Sundance ST201-NICs each and they basically don't even manage data 
transfers at the full 100mbit/s.

Stability?
Features?
Security?

Just curious...
