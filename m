From: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Subject: Re: some web sites need more than port 80?....
Date: Sun, 6 Mar 2005 19:19:23 +0200
Message-ID: <fad9d48405030609192b96682e@mail.gmail.com>
References: <20050306164509.GA15342@spawar.navy.mil>
Reply-To: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050306164509.GA15342@spawar.navy.mil>
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
To: "seberino@spawar.navy.mil" <seberino@spawar.navy.mil>
Cc: netfilter@lists.netfilter.org

On Sun, 6 Mar 2005 08:45:09 -0800, seberino@spawar.navy.mil
<seberino@spawar.navy.mil> wrote:
> I locked down my laptop with a firewall script to only
> allow port 80.
> 
> I noticed that only the text gets downloaded from ucsd.edu.
> 
> It seems that the graphics from ucsd.edu could not get
> 
> through my firewall.
> 
> Do webs sites now send JPEGs in parallel with the text
> on a different port or something?

Nope, something else is amiss. Maybe their server sends back the
images using unprivileged ports (> 1024). I've never seen this happen.
Tried any other sites?

I had a look at their HTML and everything is fine there...

> 
> chris
> 
> 


-- 

Kenneth Kalmer
kenneth.kalmer@gmail.com
http://opensourcery.blogspot.com

