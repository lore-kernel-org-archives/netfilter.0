From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Performance Monitoring
Date: Fri, 9 Jan 2004 19:04:19 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040110000419.GA25191@cannon.eng.us.uu.net>
References: <004401c3d17c$4baa7cc0$0a01000a@xcom1> <3FF9E4B7.8010109@lintelsys.com.au> <011001c3d3f8$6a6a7e20$7700000a@lawrencewin2k> <3FFA33C7.9010806@lintelsys.com.au> <20040106033802.30955.qmail@paus.pesat.net.id> <20040105230233.27d84a49.michael@bluesuperman.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040105230233.27d84a49.michael@bluesuperman.com>
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
To: Michael Gale <michael@bluesuperman.com>
Cc: netfilter@lists.netfilter.org

On Mon, Jan 05, 2004 at 11:02:33PM -0700, Michael Gale wrote:

> 
> Hello,
> 
> 	Even if you have a script that creates the chains for each IP .. if you
> use all the IP's from .1 to .250. Then a packet will have to be compared
> to 249 chains before if matches a chain if it is from or to IP .250.

One can come up with a btree which should reduce the worst case lookup to a max
of 8 lookups for a /24.

Ramin

> 
> This is not good.
> 
> Michael.

