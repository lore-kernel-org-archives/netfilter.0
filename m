From: Jason Opperisano <opie@817west.com>
Subject: Re: HTTP Redirection WAS: (no subject)
Date: Thu, 3 Mar 2005 11:32:15 -0500
Message-ID: <20050303163215.GA5439@bender.817west.com>
References: <20686C579479DC438276A726FE80CDAA0294C777@INEXCH1>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20686C579479DC438276A726FE80CDAA0294C777@INEXCH1>
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

On Thu, Mar 03, 2005 at 12:11:22PM +0530, Pmishra@in.safenet-inc.com wrote:
> 
> Hi Team,
> My requirement is Use SingleIP and different port with different web based
> application .
> Requirement :-
> 1.Access all the request from client with PORT 80.
> 2.Check the socket filter or net filet and forward different port as per
> hint send by client.
> Is it possible in Linux ?

REDIRECT all incoming TCP port 80 traffic to apache+mod_rewrite and
rewrite based on the HOST: Header request.

if all the web sites run on the same server, you could also simply do
name-based virtual hosting (this also utilizes the HOST: Header,
btw--see a pattern yet?).

there are roughly 8 million examples of how to do each of the above
available on the 'net.

-j

--
"Lisa, if you don't like your job you don't strike. You just go in
 there every day and do it really half-assed. That's  the American way."
        --The Simpsons

