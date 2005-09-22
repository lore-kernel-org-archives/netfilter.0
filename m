From: Alexey Toptygin <alexeyt@freeshell.org>
Subject: Re: raw packet capture based on offset
Date: Thu, 22 Sep 2005 19:25:11 +0000 (UTC)
Message-ID: <Pine.NEB.4.62.0509221923220.22381@otaku.freeshell.org>
References: <1127361547.43322c0b7a8da@mail.sify.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1127361547.43322c0b7a8da@mail.sify.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: colorchip@sify.com
Cc: netfilter@lists.netfilter.org

On Thu, 22 Sep 2005 colorchip@sify.com wrote:

> I want to capture raw packets based on the ethernet source (mac) and a 
> 16 bit identifier following the ethtype. I am unable to find a generic 
> filter which gives me a freedom to filter the packet based on any bit 
> length and offset from the beginning of the packet. Can anyone help?

I think you want the u32 match from POM-ng.

 			Alexey

