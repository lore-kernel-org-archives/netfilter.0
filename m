From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: NOTRACK action question
Date: Wed, 24 Aug 2005 16:34:00 -0500
Message-ID: <200508241634.00821.rob0@gmx.co.uk>
References: <57F9959B46E0FA4D8BA88AEDFBE5829074E1@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <57F9959B46E0FA4D8BA88AEDFBE5829074E1@pxtbenexd01.pxt.primeexalia.com>
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

On Wednesday 2005-August-24 13:23, Gary W. Smith wrote:
> We are NAT'ing an IP range to a set of internal Apache servers. 
> Looking into the conntrack table we are seeing a bunch of entries on
> port 80, which make sense.  One of the web server clusters is getting
> about 1m hits a day which is starting to cause a significant jump in
> conntrack entries.  My question is do we really need to track those?

It would depend on your configuration. Oh you said NAT, DNAT I guess. 
IIUC DNAT does depend on connection tracking. Perhaps you should put 
your Apache reservation in a routed (not DNAT'ed) subnet.

> I would assume no.  But when I add a NOTRACK rule to the raw table
> Apache suddenly fails to serve the pages to external clients.

Then your assumption would seem to be in error.

> Am I doing something wrong?

If it's not working, and you want it to work, yes. :)
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

