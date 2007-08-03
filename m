From: Florin Andrei <florin@andrei.myip.org>
Subject: Re: NAT on stateless firewall ?
Date: Thu, 02 Aug 2007 20:30:31 -0700
Message-ID: <46B2A157.9080108@andrei.myip.org>
References: <46B26400.7050504@andrei.myip.org>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46B26400.7050504@andrei.myip.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Florin Andrei wrote:
> 
> Is there a way to do NAT on a true stateless firewall? (no conntrack 
> loaded)

I stumbled upon "-t raw" and I'm testing it, looks like it does what I 
need. I'll do some tests.

Currently the biggest problem is that I can't seem to enable proxy ARP 
with DNAT (which should be quite simple, or so I thought), but that's an 
entirely different issue.

-- 
Florin Andrei

http://florin.myip.org/

