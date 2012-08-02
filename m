From: Andreas Herz <andi@geekosphere.org>
Subject: Re: Using multiple ipsets in a single rule.
Date: Thu, 2 Aug 2012 09:52:16 +0200
Message-ID: <20120802075216.GY1755@workstation>
References: <1343879433.4471.3.camel@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1343879433.4471.3.camel@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On 02/08/12 at 13:50, Nikolai Lusan wrote:
> After receiving advice that multiple set matching was supported I have
> written a firewall that uses multiple set matches in a single iptables
> rule only to receive the error message "--match-set can on be used
> once". Is there support for matching against more than one set? Or is it
> possible that this can be done in a future release?

Can you give an example?
If i'm right, this is not possible yet but as i'm also patching ipset
for my needs i would say that it could be done in a future release.

-- 
Andreas Herz
