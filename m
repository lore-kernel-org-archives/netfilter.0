From: Frank Gruellich <frank@home.manuelm.org>
Subject: Re: chains in the same table
Date: Thu, 6 May 2004 12:50:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040506105025.GY29115@home.manuelm.org>
References: <004c01c4334f$3f1329f0$cb0210ac@jz105>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <004c01c4334f$3f1329f0$cb0210ac@jz105>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

* Jee J.Z. <jz105@york.ac.uk>  6. May 04:
> Hi all,

Hello,

> I'm asking a basic question that in the same table (for example, the
> filter table), if a packet hit the INPUT chain while no rules are in
> the INPUT chain and the default policy is ACCEPT, will the packet be
> passed on to the FORWARD chain? If accepted again, be passed on to the
> OUTPUT chain?

No.  Any packets will traverse exactly one of INPUT, OUTPUT or FORWARD,
indepentent of policies.

HTH,
 regards, Frank.
-- 
Sigmentation fault

