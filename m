From: Rohan Almeida <arc_of_descent@gmx.net>
Subject: Re: patch-o-matic:  newnat and h323
Date: Wed, 25 Sep 2002 17:47:19 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020925174719.2aa01de2.arc_of_descent@gmx.net>
References: <3D8DF73A.7020408@iol.it>
	<003e01c26263$bcbef230$8201a8c0@lw1dqwin>
	<02af01c2647a$d3f37250$6e69690a@rimas>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <02af01c2647a$d3f37250$6e69690a@rimas>
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

"Rimas" <rmocius@auste.elnet.lt> thus wrote:

> What "patch-o-matic" patches I have to install for "newnat" and "h323"
> patches on kernel 2.4.19?

HI,
I had posted this earlier

o I used the following patches of pom
        ahesp-static.patch
        arptables.patch
        config-cleanup.patch
        conntrack+nat-helper-unregister.patch
        conntrack.patch
        dscp.patch
        DSCP.patch
        ecn.patch
        ECN.patch
        helper.patch
        ip_conntrack_protocol_destroy.patch
        ip_conntrack_protocol_unregister.patch
        local-nat.patch
        macro-trailing-semicolon-fix.patch
        nat-export_symbols.patch
        nat-memoryleak-fix.patch
        netfilter-arp.patch
        z-newnat16.patch
        eggdrop-conntrack.patch
        h323-conntrack-nat.patch
        pptp-conntrack-nat.patch

	I expereinced problems with the z-newnat16.patch,
	but the above sequence works fine with me.
	Most important, remember "not" to apply the connmark patch
	I don't know why, maybe somebody can clarify this.

--
arc_of_descent

