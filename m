From: Jason Opperisano <opie@817west.com>
Subject: Re: Problem Matching Packets
Date: Tue, 5 Apr 2005 17:10:45 -0400
Message-ID: <20050405211045.GA3933@bender.817west.com>
References: <20050405221146.GB31371@gw.home.tux-labor.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050405221146.GB31371@gw.home.tux-labor.de>
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

On Wed, Apr 06, 2005 at 12:11:46AM +0200, Sebastian Docktor wrote:
> I've Problems to match a 255.255.255.255 Packet on the nat Chain.
> If i use the mangle Chain I see the Packet but on the nat Chain
> it look like the nat Chain does not receive the Packet.

you're trying to DNAT an all-ones broadcast packet--good luck.

-j

--
"Guy in chicken costume: The world is gonna end at midnight tonight. Y2K.
 Peter: Y2K? What are you selling, chicken or sex jelly?"
        --Family Guy

