From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: open ports 25/tcp and 110/tcp
Date: Wed, 3 Dec 2003 23:17:28 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312032317.28162.Antony@Soft-Solutions.co.uk>
References: <20031203230801.40CDE9A9@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031203230801.40CDE9A9@sterenborg.info>
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
To: netfilter@lists.netfilter.org

On Wednesday 03 December 2003 11:08 pm, Rob Sterenborg wrote:

> > Although my script seems to be correct namp is finding ports 25/tcp
> > and 110/tcp open.  To start troubleshooting this problem I've
> > commented everything out and stripped down the ruleset to just the
> > default DROP policy.  Yet nmap -sT -F -P0 -0 xx.xx.xx.xx still
> > returns 25/tcp and 110/tcp as open!
>
> Did you check the PC from another host ? If you do that, the ports
> will show open even if they are closed.

Why?

> Check from another host and it should show closed or filtered.

I just tried the above command on my laptop, testing itself (which doesn't run 
a POP3 or SMTP service) and neither of them showed up as open.

Antony.

-- 
In Heaven, the police are British, the chefs are Italian, the beer is Belgian, 
the mechanics are German, the lovers are French, the entertainment is 
American, and everything is organised by the Swiss.

In Hell, the police are German, the chefs are British, the beer is American, 
the mechanics are French, the lovers are Swiss, the entertainment is Belgian, 
and everything is organised by the Italians.

                                                     Please reply to the list;
                                                           please don't CC me.


