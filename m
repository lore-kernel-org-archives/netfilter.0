From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Home web server using front firewall
Date: Wed, 10 Dec 2003 23:40:14 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312102340.14210.Antony@Soft-Solutions.co.uk>
References: <HFEBJMKNPOCPPMGFHDMCOECACDAA.esanz@minorplanetusa.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <HFEBJMKNPOCPPMGFHDMCOECACDAA.esanz@minorplanetusa.com>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Wednesday 10 December 2003 11:24 pm, Erick Sanz wrote:

> All,
>
> I am trying to install a small web server at home in order
> to display some family pictures and some other personal
> topics (hobbies, interests ...)
>
> For this I need port forwarding and probably NAT to change
> the outgoing IP address.

If you do DNAT for incoming packets, you will get automatic SNAT on the 
outgoing reply packets - you do not need to set up your own rule to handle 
these.

> I want the real server to be completely blocked for
> any other port than http and https on the web server
> (I am planning to accept requests only from the internal
> network).

Um, do you really mean what that last bit says?   You only want to accept 
requests from the internal network - ie not from the Internet???

> Am I forgetting anything else?

The only thing I can see missing from the rules you posted is:

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

That rule will allow the reply packet to traverse your firewall, and return to 
the outside world (assuming that's what you really want to happen....).

If you have any problems with the ruleset you posted (with the above addition) 
feel free to post here again, but please be as specific as you can about what 
the problem is, and how you have tested for it.

Hope you have a good time with netfilter.

Antony.

-- 
Success is a lousy teacher.  It seduces smart people into thinking they can't 
lose.

 - William H Gates III

                                                     Please reply to the list;
                                                           please don't CC me.


