From: Jason Opperisano <opie@817west.com>
Subject: Re: HELP! Transparent Proxy using bridging 2.6.9 and REDIRECT on
	different subnet
Date: Wed, 23 Mar 2005 14:42:07 -0500
Message-ID: <20050323194207.GA23346@bender.817west.com>
References: <2F413D5F33545D4A8465BBEE900238CC3FA74E@cymmail.cymphonix.com>
	<4241C264.5060800@riverviewtech.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4241C264.5060800@riverviewtech.net>
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

On Wed, Mar 23, 2005 at 01:24:20PM -0600, Grant Taylor wrote:
> 1)  REDIRECT or DNAT traffic coming from the client machine to proxy with a 
> known address.
> 2)  SNAT traffic coming from the proxy with a known address back to an 
> address the client machines are expecting.  I'm not sure as of how to do 
> this as the source address that they are expecting will be different 
> depending on where they are trying to connect to.  Seeing as how Squid can 
> correctly transparent proxy traffic when it is on the correct subnet I'm 
> going to assume that it knows how to handle this issue.

i didn't read the original post (or re-posts thereafter, as i have
nothing of value to add to a bridging question), but i can add this to #2
there...in the case of REDIRECT--the client is expecting a response from
the target web server--so a SNAT doesn't make sense in that scenario,
as it would be pretty much guaranteed to break the communication.

REDIRECT is a whole different beast from DNAT.

-j

--
"Facts are meaningless. You could use facts to prove anything that's
 even remotely true!"
         --The Simpsons

