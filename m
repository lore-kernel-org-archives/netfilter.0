From: "James R. Hay" <jrhay@HayA.QC.CA>
Subject: Re: Filtering out spoofed network addresses
Date: Wed, 2 Jul 2003 12:42:02 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0307021240500.11520-100000@hay.haya.qc.ca>
References: <20030701194925.GA353@cannon.eng.us.uu.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030701194925.GA353@cannon.eng.us.uu.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: Martin Josefsson <gandalf@wlug.westbo.se>, Netfilter <netfilter@lists.netfilter.org>

On Tue, 1 Jul 2003, Ramin Dousti wrote:

> > > Indeed, you cannot do this with netfilter. Netfilter does not provide you
> > > with the "don't care bits" as cisco calls it.
> >
> > What's wrong with:
> >
> > -s 0.0.0.0/0.0.255.255
>
> Yes. Just tried it and it worked. Excellent! So the mask is just an arbitrary
> mask. Thanks for pointing that out :-) I have to go and redo lots of rules
> that I made under a false assumption...

Well, I too just applied it and I am delighted to say that it works like a
charm.  Thank you VERY much.

James R. Hay				jrhay@haya.qc.ca
Hay-Net Networks
P.O. Box 46051
Pointe Claire, QC
H9R 5R4


