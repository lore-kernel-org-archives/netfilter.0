From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: REDIRECT vs. DNAT (Was: HELP! Transparent Proxy using
	bridging...)
Date: Thu, 24 Mar 2005 10:08:58 -0600
Message-ID: <4242E61A.3050308@riverviewtech.net>
References: <20050324122642.GA12171@ikkoku.ath.cx>
Reply-To: gtaylor@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050324122642.GA12171@ikkoku.ath.cx>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Toby <tobia.conforto@linux.it>
Cc: netfilter@lists.netfilter.org

Yes, REDIRECT redirects traffic passing through the system to it's self, but it does not give you an option to send the traffic any where else.  If you want to send the traffic passing through the system to a different one on the LAN or where ever you need something other than redirect.  DNAT will send the packets to the other system but appear as if it is still coming from the original client system, thus SNAT makes the traffic appear to the system that you are sending the traffic to as if it is coming from the system that is doing the redirection.  The reason the traffic has to appear as if it is coming from the system doing the redirection is b/c the traffic must travel the same path (host IPs) in reverse as to not confuse the client system with the response coming from a different IP than the request was sent too.



Grant. . . .

Toby wrote:

> Jason Opperisano wrote:
> 
>>REDIRECT is a whole different beast from DNAT.
> 
> 
> As in?
> 
> Doesn't REDIRECT just do a DNAT to the machine's own address?
> 
> 
> Toby
> 


