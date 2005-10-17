From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Bachelor Project
Date: Mon, 17 Oct 2005 16:16:48 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510171601130.21372@filer.marasystems.com>
References: <43535A41.3030106@seznam.cz>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43535A41.3030106@seznam.cz>
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
To: Jan Simbera <xcidar@seznam.cz>
Cc: netfilter@lists.netfilter.org

On Mon, 17 Oct 2005, Jan Simbera wrote:

> Has anybody implemented the linux kernel module which deals with 
> connection tracking of the protocol IPV6 or has anybody being working on 
> it presently?

Yes. Look for nf_conntrack. A very much active project and scheduled to 
replace ip conntrack in some time.

> I would also like to kno if anybody has been working on implementation 
> of the module for IPVS (using IPV6).

No idea. This question is perhaps better asked on the lvs mailing list. 
But probably not.

> Does anybody know about any contacts or addresses, where i could get 
> this information?

For more info in IPVS/LVS see http://www.linuxvirtualserver.org/

nf_conntrack is found from the netfilter page somewhere.

Regards
Henrik

