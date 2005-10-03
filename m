From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: AW: Aren't these connections ESTABILISHED? (2nd take)
Date: Mon, 3 Oct 2005 10:34:28 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510031031030.22605@filer.marasystems.com>
References: <20051003001657.4046223042@ds9.ddns.anduras.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051003001657.4046223042@ds9.ddns.anduras.de>
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
To: Michael Schoen <michael@schoen.de>
Cc: netfilter@lists.netfilter.org

On Mon, 3 Oct 2005, Michael Schoen wrote:

> I think the only valid state for such pkgs would be INVALID, which makes
> those pkgs as TARGET-type available... Everything else should be mangaged
> within the user space..

CONNTRACK is not about firewalling, it is about tracking connections. 
INVALID is not "these packets is dangerous". It is "these packets can not 
under any circumstances belong to a valid session".

> I would actually DROP those targets...

Then I think you should also DROP loone ACK and a number of other packet 
types, simply done by

   -m state --state NEW -p tcp \! --syn

which clearly states that you do not accept resume of old sessions.

Regards
Henrik

