From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: block ssh and ping
Date: Mon, 14 Feb 2005 09:11:06 +0000
Message-ID: <20050214091106.GH28553@metastasis.org.uk>
References: <5e36ca5e45b4.5e45b45e36ca@vsnl.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5e36ca5e45b4.5e45b45e36ca@vsnl.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Feb 08, 2005 at 04:52:53PM +0500, varun_saa@vsnl.net wrote:
> Hello,
>       My server is Mandrake 10.1
> eth0 is WAN with static IP connected to 512k DSL
> eth1 is LAN.
> 
> 1. I would like to block ping to my external static IP
> 
> 2. I would like to block ssh to my external static IP
> 
> Howto to do that ?

Out of interest - why do you specifically want to block those protocols?
It's a good idea to block everything inbound and only permit what's
required so I'm wondering why you want to block these two.

-- 
Where are we going and what's with the hand basket?

