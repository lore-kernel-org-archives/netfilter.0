From: Florian Westphal <fw@strlen.de>
Subject: Re: Let me make sure I have this right (fib)
Date: Thu, 28 May 2020 15:13:16 +0200
Message-ID: <20200528131316.GK2915@breakpoint.cc>
References: <77539167-132b-1497-c45d-cbd232597beb@satchell.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <77539167-132b-1497-c45d-cbd232597beb@satchell.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Satchell <list@satchell.net>
Cc: Linux Netfilter Users List <netfilter@vger.kernel.org>

Stephen Satchell <list@satchell.net> wrote:
> firewall box is compromised.  Earlier comments indicated that "fib saddr
> type <x>" and "fib saddr oif <x> are not allowed in the FILTER/OUTPUT and
> FILTER/POSTROUTING chains.

saddr isn't a problem.  'saddr . iif' is (there is no 'input
interface').
