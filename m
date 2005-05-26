From: Jason Opperisano <opie@817west.com>
Subject: Re: netfilter Digest, Vol 10, Issue 70
Date: Thu, 26 May 2005 13:08:57 -0400
Message-ID: <20050526170857.GA21479@bender.817west.com>
References: <42943c13.3526efb1.0a62.1844SMTPIN_ADDED@mx.gmail.com>
	<9927912d050525032492c5882@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <9927912d050525032492c5882@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, May 25, 2005 at 02:24:17PM +0400, Visham Ramsurrun wrote:
> What I mean by this is that the when a protocol is unknown to the
> ip_conntrack module if you don't have or don't want to use helper
> conntrack modules like that for TCP or FTP), connection tracking
> adopts a default method for handling these packets. It resembles the
> handling of UDP packets. When this default behaviour is used, even a
> packet that is not the SYN packet is considered as NEW. A second
> packet in the reverse direction (reply packet) will set the connection
> state to ESTABLISHED.

if you're asking if there's a way to modify the conntrack code to ignore
the fact that TCP traffic is TCP traffic, and instead treat it as some
random, unknown IP protocol; i would imagine you would have to hack the
crap outta the conntrack code, basically removing
ip_conntrack_proto_tcp.c from the equation.  i have no clue how you
would go about doing this.  i also have no idea what your impetus behind
this desire is; therefore, i can make no suggestion as to whether there
may be an easier way to accomplish your goal.

-j

--
"Stewie: Mother, I come bearing a gift. I'll give you a hint: it's
 in my diaper and it's not a toaster.
 Lois: Meg, can you change Stewie?
 Meg: Fine, but this time if a boy calls, please don't tell him I'm
 wrist deep in poopy."
        --Family Guy

