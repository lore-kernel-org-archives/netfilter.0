From: Jason Opperisano <opie@817west.com>
Subject: Re: Network number getting mangled
Date: Tue, 1 Mar 2005 17:23:55 -0500
Message-ID: <20050301222355.GA31991@bender.817west.com>
References: <Pine.LNX.4.58.0503011618080.11531@spm.home.djb.net>
	<20050301220459.GA31857@bender.817west.com>
	<Pine.LNX.4.58.0503011711120.11531@spm.home.djb.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0503011711120.11531@spm.home.djb.net>
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

On Tue, Mar 01, 2005 at 05:17:30PM -0500, Daniel J. Brennan wrote:
> > your example of 10.0.168.0/22, actually does define a network
> > ID--10.0.168.0 - 10.0.171.255
> > 
> > as to what value you actually want--i have no idea.
> > 
> > say what you mean and mean what you say.
> 
> Thanks for the reply. But I am confused. I need to revisit the math, but
> the public IP space range is XX.XX.168.0 - XX.XX.175.255. It has a netmask 

which would be:  x.x.168.0/21

> of 255.255.242.

ahh...no...  255.255.248.0 maybe?

> As I said the private space mirrors this IP space.
> This is a legitimate public IP subnet. How do I define it to iptables,
> since the public IP space is not as I would expect in iptables either.

as a /21...

this message on IP Subnetting has been brought to you by the letter 'S.'

-j

--
"Weaseling out of things is important to learn. It's what separates
 us from the animals...except the weasel."
        --The Simpsons

