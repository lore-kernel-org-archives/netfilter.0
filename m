From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPTables routing
Date: Fri, 28 Nov 2003 18:52:19 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311281852.19132.Antony@Soft-Solutions.co.uk>
References: <35733.141.150.249.168.1070044358.squirrel@mail.plobe.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <35733.141.150.249.168.1070044358.squirrel@mail.plobe.com>
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

On Friday 28 November 2003 6:32 pm, mailinglist@plobe.com wrote:

> I have a question, I would like to know the best way to do something with
> IPTables.
>
> I have a network which has a gateway wwith iptables on it.  I want
> iptables to send all data bound for a external server (Ex. server.com or
> 20.20.20.20) to a third server (server_mirror.com).  So iptables needs to
> rewrite the header on every packet bound for the intended server
> (server.com) so that the packets get routed to the third server
> (server_mirror.com).  Also, the third server and person making the request
> are making a socket connection that sends data two ways.
>
> --Can I do this with iptables? And if so, how?

iptables -A PREROUTING -t nat -d 20.20.20.20 -j DNAT --to 30.30.30.30

(Plus whatever FORWARD rule/s you need to allow the right sort of packets to 
get to 30.30.30.30)

(assuming the packets were originally going to 20.20.20.20 and instead you 
want them to go to 30.30.30.30).

> --Also, will I have problems with the server responding? And if so, how do
> I fix that?

So long as client and server are on opposite sides of the netfilter machine 
(ie packets going in both directions will go through the netfilter box), then 
the reverse translation is handled automagically for you.

If the client and the server are not on opposite sides of the netfilter box 
then things get very messy.

Antony.

-- 
There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.

                                                     Please reply to the list;
                                                           please don't CC me.


