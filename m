From: Florian Boelstler <euphoria@arcor.de>
Subject: Re: how to log dropped packet
Date: Wed, 29 Sep 2004 11:19:03 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <415A7E07.3070107@arcor.de>
References: <web-6413785@infinito.it>
	<41595002.70706@arcor.de>	<41598522.2060207@arcor.de>
	<200409281130.51732.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200409281130.51732.Alistair@nerdnet.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

Alistair Tonner wrote:
> 	Indeed an important component -- the point being that user created tables 
> cannot have a POLICY set and when a packet reaches the end of a user created 
> table, unless otherwise set, the packet RETURNS to the calling table and 
> continues to traverse it again at that point.

Thanks for pointing this out :)

Regards,

   Florian

