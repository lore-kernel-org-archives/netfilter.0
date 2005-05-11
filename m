From: Sergio Penkale <spenkale@arnet.com.ar>
Subject: Re: Can anyone tell wat's going on here?
Date: Wed, 11 May 2005 20:47:01 -0300 (ART)
Message-ID: <Pine.LNX.4.63.0505112036390.13190@palangana>
References: <Pine.LNX.4.63.0505111249010.3025@palangana>
	<20050511183015.GA13507@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050511183015.GA13507@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

On Wed, 11 May 2005, Jason Opperisano wrote:

> your symptoms scream 'MTU Issue' at me.  try this rule and see if it
> fixes it:
>
>  iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN \
>    -j TCPMSS --clamp-mss-to-pmtu

It worked!!! Thanks!!
You have no idea how much i fought with this.

Thanks, Sergio.


