From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: A simple question
Date: Thu, 19 Aug 2004 18:31:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040819173151.GD4818@metastasis.org.uk>
References: <7C9884991ADAE0479C14F10C858BCDF567948D@alderaan.smgtec.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF567948D@alderaan.smgtec.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Aug 19, 2004 at 10:14:48AM -0700, Daniel Chemko wrote:
> Hudson Delbert J Contr 61 CS/SCBN wrote:
> > this should be a basic rule of netsec 101 ...
> > 
> > one should have to 'turn' on any allowed traffic out of the box.
> > 
> > i.e......the firewall should not allow ANY traffic by default until
> > specifically
> > 		TOLD TO DO SO BY THE ADMIN.
> > 
> > this is a good thing.

> Just my two cents on this:

My two pennies :)

> If your firewall is designed correctly, there shouldn't be any network
> available services running baring SSH.

If you're using IPTables as a seperate firewall then wouldn't you just
want SSHD listening on the internal interface?

> Because of this, if a hacker gets into your firewall I assume that
> 99.9999% of the time, they'll have root access. Any hacker that could
> hack into your Linux box will be able to disable any iptables rules in
> a second. Hence, blocking the OUTPUT chain on a firewall does NOT
> secure you against hackers.

You're presuming that IPTables isn't protecting a single host.  If
you're using it on a desktop or a server filtering on the OUTPUT chain
gives you a huge gain in security.

-- 
"I think a church with a lightning rod shows a decided lack of confidence"

