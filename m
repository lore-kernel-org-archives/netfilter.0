From: Jason Opperisano <opie@817west.com>
Subject: Re: can you specify incoming *AND* outgoing NIC on a FORWARD rule?
Date: Wed, 13 Apr 2005 16:55:56 -0400
Message-ID: <20050413205556.GA31258@bender.817west.com>
References: <1113425048.3544.169.camel@seberino.spawar.navy.mil>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1113425048.3544.169.camel@seberino.spawar.navy.mil>
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

On Wed, Apr 13, 2005 at 01:44:08PM -0700, Christian Seberino wrote:
> FORWARD only table where rules can have -i *and* -o ??
> 
> It seems to make sense that you could specify 2 NICs
> with FORWARD but not with INPUT or OUTPUT.
> 
> Is that right?

precisely.

-j

--
"Lois: Chris, that's a terrible word. Pussywillow."
        --Family Guy

