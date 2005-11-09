From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: SNAT vs MASQUERADE ... RE: ftp conntrack - nat problem
Date: Wed, 9 Nov 2005 09:51:31 -0600
Message-ID: <200511090951.31228.rob0@gmx.co.uk>
References: <NEBBLLCNFOFHMALJMDDEGEPNBEAB.pablo@blueoakdb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <NEBBLLCNFOFHMALJMDDEGEPNBEAB.pablo@blueoakdb.com>
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

On Wednesday 2005-November-09 09:23, Pablo Sanchez wrote:
> When you say the SNAT target is better.  Can you quantify 'better?' 
> Are there any functional limitations overcome by SNAT over the
> MASQUERADE target?

Ooooh, I was afraid someone might ask that. Unfortunately I am only 
parroting the party line. From "MASQUERADE" in "man iptables":
  MASQUERADE
       This target is only valid in the nat table, in the POSTROUTING
       chain.  It  should  only  be used with dynamically assigned IP
       (dialup)  connections:  if you have a static IP  address,  you
       should use the SNAT target.

Perhaps someone else can explain why. I think one benefit of SNAT is 
that a SNAT'ed TCP connection can survive a router reset. That's 
important to me, because sometimes I leave ssh sessions open for weeks 
at a time.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

