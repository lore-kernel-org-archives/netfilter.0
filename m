From: Andy Furniss <lists@andyfurniss.entadsl.com>
Subject: Re: Bi-directional packet classification with ACK prioritization
Date: Sat, 03 Jun 2006 15:40:00 +0100
Message-ID: <44819F40.8050004@andyfurniss.entadsl.com>
References: <0633E0EDB4F25F43A2D7179CA11FAFAB255421@xavier.staff.greatlakes.net>
Reply-To: lists@andyfurniss.entadsl.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-bounces@lists.netfilter.org>
In-Reply-To: <0633E0EDB4F25F43A2D7179CA11FAFAB255421@xavier.staff.greatlakes.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter-devel>, 
	<mailto:netfilter-devel-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter-devel>
List-Post: <mailto:netfilter-devel@lists.netfilter.org>
List-Help: <mailto:netfilter-devel-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter-devel>, 
	<mailto:netfilter-devel-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-devel-bounces@lists.netfilter.org
Errors-To: netfilter-devel-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Eliot, Wireless and Server Administrator,
	Great Lakes Internet" <support8@greatlakes.net>
Cc: lartc@mailman.ds9a.nl, Netfilter Development Mailinglist <netfilter-devel@lists.netfilter.org>, netfilter@lists.netfilter.org

Eliot, Wireless and Server Administrator, Great Lakes Internet wrote:

> This problem will be true for generally classified traffic and P2P
> traffic. I would use tc filters in one direction if I could possibly
> distinguish P2P traffic from other types of traffic with them.

You can match mark with u32 rather than fw - you then get to use masks 
and can and it with other matches - like MAC.

You can also and/or marks with netfilter.

Andy.

