From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Two connections shared by ports
Date: Wed, 3 Nov 2004 16:30:12 +0000
Message-ID: <200411031630.12818.gdh@acentral.co.uk>
References: <41890694.8070706@treedesign.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41890694.8070706@treedesign.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Wednesday 03 November 2004 16:25, Tony VanScoy wrote:
> My Goal:  Setup ipfilter to share two Internet connections.
>
> The problem is that our office uploads numerous files through mail and
> ftp that are usually 50M, possibly larger.

You're in a very fortunate position - because your problem is related to 
excessive data leaving your network, you can implement traffic shaping... 
google for 'wonder shaper' - it should be the first hit...

Then you can use the second connection purely for your own BitTorrents ;)

Cheers,
Gavin.

