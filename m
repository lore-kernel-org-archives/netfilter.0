From: Fallucchi Antonio <fallucch@csr.unibo.it>
Subject: Re: ip_conntrack_max
Date: Thu, 08 Jul 2004 19:02:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40ED7E40.60800@csr.unibo.it>
References: <40ED161F.5070804@cisbic.com> <200407081152.42618.Antony@Soft-Solutions.co.uk> <40ED4865.7020208@cisbic.com> <200407081429.24492.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407081429.24492.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org


> <>
> This is difficult. I think we should start by asking "what do you mean 
> by a
> connection?" Remember that many web browsers, for example, will open 5-10
> simultaneous connections in order to load all the elements of a web page.
> DNS needs its own connections in order to do name lookups. Some 
> connections
> are long-term (eg: telnet, ssh - even when you're not typing, the 
> connection
> is still there), some are very transient (eg: http - once you have the 
> page
> displayed, there's no connection between your browser and the server 
> until
> you click on another hyperlink).
>
Thancks for the instruction..

> <>Why do you want to limit connections per machine? What are you 
> trying to
> achieve?
>
The problem are the P2P software that create any connection on the 
conntrack..
Because filter all p2p port is very difficult, I thought that to limit 
the number of simultaneous connection
is a gooa idea..

>That sounds fine.   Tell us if you get "connection tracking table full" errors 
>again.
>
>Regards,
>
>Antony.
>
>  
>
Bye

ps: it's ok the signature now?

-- 
 ---------------------------------------------------------------
| |||||||    ||    |  Fallucchi Antonio Giuseppe  mat. 2282     |
| ||        ||||    |      --> Live free() of die() <--         |
| ||||     ||  ||    |        OpenSource philosophy             |
| ||      ||||||||    |  Universita' di Bologna sede di Cesena  |
| ||     ||      ||    |    Cdl di Scienze dell'Informazione    |
 ---------------------------------------------------------------



