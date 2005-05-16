From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: ls delayed !!!
Date: Sun, 15 May 2005 19:56:43 -0500
Message-ID: <4287EFCB.80505@riverviewtech.net>
References: <1115910577.26182.53.camel@maclinux.lotus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1115910577.26182.53.camel@maclinux.lotus>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: NetFilter <netfilter@lists.netfilter.org>

> I am with following problem, I have ftp server functioning behind a
> GATEWAY, the user effects login normally, obtains to create directory
> and to remove directory, only has a problem that when the user tries to
> list the content any directory, delays and it does not list the content,
> appears the following acknowledgment of time-out connection, somebody
> can help to decide this problem ?

The first thing that comes to mind is that you probably do not have the ftp connection tracking helper complied in or the module loaded in to your kernel.  This is a classic issue of your ftp connection not being able to get data back from the ftp server over it's data connection which is a different port than the command / control port.  You might want to take a moment to read the RFC on ftp to bring your self up to date.

The timeout that you are alluding to is not really a timeout directly but rather the ftp server expecting you to connect to it on a different port to receive the output of the ls which you are likely never doing or if you are your firewall is blocking it.  This is what the ftp connection tracking helper is meant to do, rather allow this 2nd connection to pass through the firewall based on the information that it saw on the command port.



Grant. . . .

