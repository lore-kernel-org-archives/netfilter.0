From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Static compile issues
Date: Thu, 29 May 2003 03:48:28 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030529034828.0cb748aa.arnt@c2i.net>
References: <1054158893.21086.62.camel@dejawu>
	<Pine.LNX.4.30.0305281709290.30704-100000@phear.lwz.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.30.0305281709290.30704-100000@phear.lwz.org>
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

On Wed, 28 May 2003 17:11:42 -0400 (EDT), 
Cory Visi <merlin@phear.lwz.org> wrote in message 
<Pine.LNX.4.30.0305281709290.30704-100000@phear.lwz.org>:

> When I compile the kernel statically and enable IP Tables support,
> ipchains compatibilty is becomes no longer available. I have the
> Invalid Argument problem with the static kernel.
> 
> When I compile the kernel with module support, I do _not_ enable
> the ipchains compatibility module.
> 
> Should I try enabling this? Obviously, I cannot insert it when the IP
> tables module is loaded. Also, this doesn't help my situation with the
> static kernel.

.._no_ and no.  Ipchains would require the removal of iptables and that 
on top of all the good reasons not to, makes it off-topic here.  ;-)

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.




