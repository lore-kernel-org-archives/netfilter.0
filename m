From: "it clown" <suse@mailbox.co.za>
Subject: Re: limiting bandwidth with iptables or squid?
Date: Fri, 29 Oct 2004 07:54:46 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <web-493669244@mail01.infosat.net>
References: <417CE54B.5060107@dsl.pipex.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <417CE54B.5060107@dsl.pipex.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi All,

I am abit confused with tc.

I need a string to limit band whidth for ips or mac
addresses.

iptables -A PREROUTING -i eth0 -s x.x.x.x -t mangle -j MARK
--set-mark 1

will mark the packets for that ip.i think.

what string for tc do i need to limit x.x.x.x to say 5kb/s
download speed? eth0 is my internal network card of my
linux box.

Regards

On Mon, 25 Oct 2004 12:36:43 +0100
 Andy Furniss <andy.furniss@dsl.pipex.com> wrote:
> Jason Opperisano wrote:
> > On Sun, 2004-10-24 at 10:20, it clown wrote:
> > 
> >>Hi All,
> >>
> >>I would like to know how to limit bandwidth with
> iptables.I
> >>would like to limit bandwidth to ip's and mac
> address.Do i
> >>need another program to work with iptables or can
> iptables
> >>do it on its own?Does any one know where i can find
> >>something to read up on this?
> >>
> >>If iptables can not do it can i do it with squid?
> > 
> > 
> > first off--you can't do "inbound" traffic shaping--only
> outbound.
> 
> I know your link qualifies this a bit - but I'd say you
> can do inbound (narrow end of bottleneck)  traffic
> shaping. Albeit as an inperfect kludge and at the expense
> of some bandwidth. The imperfect bit being if you really
> care about latency - not bandwidth shaping, I would argue
> that I can do that almost perfectly as my ISP has a 600ms
> buffer and my shaping at 80% of 512kbit/s never looses
> control enough that packets get dropped from that.
>    you
> > cannot control how fast incoming packets hit your
> machine 
> 
> I assume TCP - which is clocked by acks - so the rate you
> dequeue does affect the rate at which packets hit ISP
> buffer. Packets never hit my machine faster than my link
> speed of course - which makes the queue get filled in a
> burstless way.
> 
> > or how big they are--
> 
> mss clamping :-)
> 
> Andy.
> 
> you can only control how fast you allow them to leave.
> > 
> > that being said--read chapter 9 of:
> > 
> >         http://lartc.org/howto/
> >         
> > -j
> > 
> 
> 
> 

_____________________________________________________________________
For super low premiums ,click here http://www.dialdirect.co.za/quote

