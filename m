From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ip_conntrack_max
Date: Thu, 8 Jul 2004 14:29:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407081429.24492.Antony@Soft-Solutions.co.uk>
References: <40ED161F.5070804@cisbic.com> <200407081152.42618.Antony@Soft-Solutions.co.uk> <40ED4865.7020208@cisbic.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40ED4865.7020208@cisbic.com>
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

On Thursday 08 July 2004 2:13 pm, Fallucchi Antonio wrote:

> Antony Stone wrote:
>
> oh!, excuse me for the html!

Thanks for turning it off.

> I have 20 computer in the lan and 5 server.

In that case a 128Mbyte machine should have no trouble.

> Another questions: how I can limit the number of connection for every
> computer?

This is difficult.   I think we should start by asking "what do you mean by a 
connection?"   Remember that many web browsers, for example, will open 5-10 
simultaneous connections in order to load all the elements of a web page.   
DNS needs its own connections in order to do name lookups.   Some connections 
are long-term (eg: telnet, ssh - even when you're not typing, the connection 
is still there), some are very transient (eg: http - once you have the page 
displayed, there's no connection between your browser and the server until 
you click on another hyperlink).

Why do you want to limit connections per machine?   What are you trying to 
achieve?

> >What is the value in /proc/sys/net/ipv4/ip_conntrack_max ?
>
> ip_conntrack_max now is 10240.

That sounds fine.   Tell us if you get "connection tracking table full" errors 
again.

Regards,

Antony.

-- 
Success is a lousy teacher.  It seduces smart people into thinking they can't 
lose.

 - William H Gates III

                                                     Please reply to the list;
                                                           please don't CC me.


