From: Jason Opperisano <opie@817west.com>
Subject: Re: REDIRCT vs. DNAT...
Date: Fri, 22 Apr 2005 18:24:56 -0400
Message-ID: <20050422222456.GA5890@bender.817west.com>
References: <426976D9.2010009@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <426976D9.2010009@riverviewtech.net>
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

On Fri, Apr 22, 2005 at 05:12:41PM -0500, Taylor, Grant wrote:
> Are there any merits to using REDIRECT over (or under) DNAT when 
> redirecting traffic back to the box that is doing the redirecting?  
> Reference Alejandro Villarroel's post (and thread) at 
> https://lists.netfilter.org/pipermail/netfilter/2005-April/059942.html.
> 
> I responded with an email stating to REDIRECT the traffic only moments 
> after Jason Opperisano responded stating to DNAT the traffic.  I'm just 
> curious if any one knows of any performance benefits / penalties for using 
> REDIRECT vs. DNAT.

REDIRECT is a special case of DNAT, where the dst IP is rewritten to the
IP address of the interface the packet is received on (optionally
re-writing the dst port as well).

i used DNAT in my response, as it wasn't clear from the OP what local IP
the translated packets needed to be sent to.

-j

--
"Peter: I'd sell my soul to be famous.
 Satan: We've got a live one. Peter.
 Assistant: No good, sir. It seems he already sold his soul once in
 1977 for Bee Gees tickets and then again in 1983 for half a mallomar."
        --Family Guy

