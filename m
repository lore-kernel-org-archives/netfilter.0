From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: PREROUTING with ULOG in what order: conn, mangle, imq, nat
Date: Tue, 15 Jul 2003 11:40:00 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030715154000.GC24604@cannon.eng.us.uu.net>
References: <1058281866.21853.66.camel@drs0.manchotnetworks.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1058281866.21853.66.camel@drs0.manchotnetworks.net>
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
To: "lartc@manchotnetworks.net" <lartc@manchotnetworks.net>
Cc: netfilter <netfilter@lists.netfilter.org>

On Tue, Jul 15, 2003 at 05:11:05PM +0200, lartc@manchotnetworks.net wrote:

[snip...]

> where does de-natting occur?
> 
> i thought it was: 

Your thought is correct. ULOG sees the packets after the conntrack.
tcpdump sees the packets before the conntrack.
And de-natting occurs at the conntrack:

> WIRE -- > PREROUTING [ conntrack --> mangle --> imq --> nat ] ...
  ^^^^                    ^^^^^^^      ^^^^^^
tcpdump                  de-natting     ULOG


Take a look at "Table 3-3. Forwarded packets" in Oscar's tutorial.
The order of mangle/nat is reverse for incoming and outgoing...

Ramin

> if i am capturing at mangle, should not the snat address be there?
> 
> Many Many Many Thanks!!
> 
> Charles
> 
> 
> 
> 

