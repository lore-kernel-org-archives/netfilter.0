From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problem behind my DMZ
Date: Thu, 8 Jan 2004 17:53:06 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401081753.06528.Antony@Soft-Solutions.co.uk>
References: <Law9-F95jyNQD9Y7j8J00010259@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Law9-F95jyNQD9Y7j8J00010259@hotmail.com>
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

On Thursday 08 January 2004 5:46 pm, Martin Leduc wrote:

> >So where are the local client machines?
>
> No one, it's my dedicate server network.  My server are on a metal box with
> one RJ-45 cable from my ISP.  That's it!

> Example:
>
> My Server 1 (192.168.0.2) tried to send Email to abcd.com.  abcd.com are
> resolved by my internal DNS server.  The MX of the domain abcd.com is
> 20.0.0.4, but this address is, from the server 1 point of view my Firewall.
> So I lost the email.

Okay, so what I was calling your "client machines" are actually just the other 
servers on your network.

In this case if you want to continue using NAT then I cannot see an 
alternative solution to split DNS, so that machines within your network 
receive DNS replies containing the private addresses, and machines outside 
your network receive the public addresses.

If on the other hand you use the suggestion of putting genuine public IPs onto 
your servers (and Ramin Dousti's detailed answer is definitely the best 
solution given your network topology - mine assumed you might want other 
public IPs for some other purpose, but with only one internal network this is 
obviously not the case) then everyone (internal and external) will use public 
IPs and the problem goes away.

Regards,

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


