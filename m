From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: curious about /etc/init.d/iptables script in RH 8.0
Date: Thu, 24 Oct 2002 22:35:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021024213528.YCRT17202.mta01-svc.ntlworld.com@there>
References: <Pine.LNX.4.44.0210241501210.2123-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210241501210.2123-100000@localhost.localdomain>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Thursday 24 October 2002 8:15 pm, Robert P. J. Day wrote:

>   first, the script grabs the list of currently-used tables from
> the file /proc/net/ip_tables_names, which is why i asked about this
> file earlier -- the implication is that, given the possible tables
> filter, nat and mangle, only those that are listed in that file
> can possibly be in use at the moment.  fair enough.  but it
> would make more sense to assign this list to a variable like
> "tables", not "chains", wouldn't you think? :-)  just being
> pedantic.

Yes.

>     iptables -F
>
> by default, this will flush the filter table, but isn't that
> already empty from the previous statement?  not a mistake, just
> redundant, no?

Correct.

>   the same redundancy seems to exist in the next loop that deletes
> the user-defined chains:  the loop really gets rid of all user-defined
> chains in each table one at a time, and follows that up with
>
>     iptables -X
>
> apparently just to give the "filter" table one last good kick
> while it's down or something.  is there something more to this
> than meets the eye?

No.

No-one said it was a perfect script :-)

The reason for using /proc/net/ip_tables_names is just to make sure the 
script doesn't generate errors no matter what sort of netfilter system it 
gets used on.

The other things you've pointed out may be redundant, or less than 
pedantically perfect, but they won't generate errors, so newbies won't get 
worried.

Antony.

-- 

I vote "no" to this proposal to form a committee to investigate whether we 
should or should not hold a ballot on whether to vote yet.

