From: "Marius Mertens" <marius.mertens@gmx.de>
Subject: Re: NEW "SSH Brute Force " ruleset (20050628.0)
Date: Fri, 1 Jul 2005 21:07:21 +0200
Message-ID: <004801c57e70$1fad3890$4206a8c0@loki>
References: <42C0F7E4.4060805@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: netfilter@lists.netfilter.org

Hi everybody,

On Tuesday, June 28, 2005 9:10 AM,
Taylor, Grant wrote:

> [...]
> One point of interest would be the use of the "--rttl" option on the
> recent matches.  I have not tested such tests but plan to do so in
> the future.  Please reply to the mail list with your experiences.
> As always any comments and / or suggestions are most welcome and
> appreciated.

Definitely a very nice piece of work! Though I personally do not use the 
longer banning times, since just banning them for a minute has proven long 
enough to make them move to the next host, I do like the "stacked chains". 
My use for a second level is to log only the first DROP, so the DROPS won't 
flood my logs.

Speaking of flooding: Does anybody know how long IPs are stored in the 
recent list, until they are removed again?

The requested "any comments / suggestions" section:
Maybe also put a timelimit on the whitelist, since IPs added there will be 
most likely dynamic ones, otherwise they would probably have been added to 
another permanent whitelist.
Possibly strange ideas: If a certain IP makes it to a certain level of 
blacklisting, drop everything --state NEW from them, not just ssh (dropping 
also established things might allow a too powerful and easy DOS)
Add a host to a special whiltelist after doing something special, like 
connecting to a certain port, which would lower the risk of a DOS (they can 
still try, but you can override it)
I haven't used the -rttl option either, but I did monitor the TTLs of 
dropped bruteforce attempts. Most different hosts also had different TTLs, 
but packets from a single attacker never had different ones, so adding that 
option should (at least at the moment) not result in significantly more 
successful connection attempts than without.

Marius 


