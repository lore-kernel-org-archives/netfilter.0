From: Jason Opperisano <opie@817west.com>
Subject: Re: site not seen through squid
Date: Wed, 16 Feb 2005 14:18:07 -0500
Message-ID: <20050216191807.GA24223@bender.817west.com>
References: <20050216155116.GA3520@tranquility.scriptkitchen.com>
	<20050216181943.GA24001@bender.817west.com>
	<20050216185121.GA8212@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050216185121.GA8212@tranquility.scriptkitchen.com>
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

On Wed, Feb 16, 2005 at 01:51:21PM -0500, Payal Rathod wrote:
> On Wed, Feb 16, 2005 at 01:19:43PM -0500, Jason Opperisano wrote:
> > my guess is that your friend is using transparent redirection to 
> > the
> > squid proxy and not explicit proxying (i.e. configuring the proxy in the
> 
> No it is not transparent proxy. She has it configured in all browsers 
> in her office.
> Any clues?

then my next guess is that the sharepoint server uses NTLM
authentication, and the problem is:

  http://www.squid-cache.org/Doc/FAQ/FAQ-11.html#ss11.14

which links to:

  http://support.microsoft.com/kb/q198116/

punch line:  you can't put a proxy between a client and a server that
does NTLM authentication

again--you'll have to bypass the proxy for this destination server (or
configure the web server to use another authentication method).

-j

ps - this is starting to sound more like a squid question than a
netfilter question.

--
"Kids, you tried your best and you failed miserably. The lesson is,
 never try."
        --The Simpsons

