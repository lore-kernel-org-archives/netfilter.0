From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Traffic going out wrong interface
Date: Thu, 11 Sep 2003 00:36:28 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030911003628.5e080cc7.arnt@c2i.net>
References: <3F4D5905.9030400@chrisbrenton.org>
	<Pine.LNX.4.44.0309101747300.23381-100000@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0309101747300.23381-100000@localhost>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 10 Sep 2003 17:51:57 +0100 (BST), 
Chris Wilson <chris@netservers.co.uk> wrote in message 
<Pine.LNX.4.44.0309101747300.23381-100000@localhost>:

> Hi Chris,
> 
> > So it appears that something about having iptables kick back RST's 
> > rather than type 3's caused the bogus ARP packets as well as the RST
> > being transmitted out the wrong interface as I described below. I'm
> > not sure if I'm the only one having this problem, but then again I'm
> > not sure how many people scrutinize layer 2 as deeply as I do. ;-)
> 
> If it is the same problem as the RSTs (which looks likely, given the
> symptoms), you could try applying the latest patch-o-matic, or at
> least submitted/66_netfilter-policy-routing.patch.
> 
> Cheers, Chris.

..not this bug again?:
https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=89171

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


