From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: Drop packets with low IP Time to Live field value
Date: Mon, 27 Dec 2004 15:25:49 +0000
Message-ID: <20041227152549.GG31888@metastasis.org.uk>
References: <41CC19DF.2766.F2FCB6D@localhost>
	<1103914608.14459.23.camel@hubcap.ljm.dom>
	<1103940492.2011.19.camel@grendel>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1103940492.2011.19.camel@grendel>
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

On Fri, Dec 24, 2004 at 09:08:12PM -0500, Chris Brenton wrote:
> On Fri, 2004-12-24 at 13:56, Jason Opperisano wrote:

> > that all being said--use the ttl match:
> > 
> >   iptables [...] -m ttl --ttl-eq 1 [...]
> >   iptables [...] -m ttl --ttl-lt 1 [...]
> > 
> > i don't condone the use of the above.
> 
> I've rejected TTL's of 5 or less with a host unreachable for many
> years and have never had a problem. Its a great way to detect, and
> usually prevent, tools such as Firewalk and TCPTrace. 

Just to back up Chris, I've done a similar thing and never had an issue
- and it does mean traceroutes and packets from similar software just
get eaten.

-- 
I love getting older. You're happier, you're more well-adjusted, you have
more money... and there is one very important thing you realize as you get
older: People in their 20's don't know a damn thing about ANYTHING. The
only thing that people in their 20's are good for is looking better than
people in their 30's and 40's. So if you're in your 20's, you can strike a
pose, but shut the f*** up! - Jim David


