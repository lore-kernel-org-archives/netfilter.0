From: David Williamson <nospam1@nullcutter.com>
Subject: Re: newbie question - what is the iptables equivalent of a Linksys
	"DMZ" ?
Date: Sun, 14 Nov 2004 16:05:51 -0500
Message-ID: <1100466351.5549.21.camel@localhost.localdomain>
References: <1100392955.4894.25.camel@localhost.localdomain>
	<41978B60.80802@817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41978B60.80802@817west.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

On Sun, 2004-11-14 at 11:44 -0500, Jason Opperisano wrote:

> NOTE:  what you are about to read is a terrible, awful, ridiculous, 
> horrendous idea and i condone absolutely no part of it.
> 
> what your linksys "DMZ" function performs is something along the lines of:
> 
>    iptables -t nat -A PREROUTING -i $EXTERNAL_IF -d $EXTERNAL_IP \
>      -j DNAT --to-destination $DMZ_PC_PRIV_IP
> 
>    iptables -A FORWARD -i $EXTERNAL_IF -d $DMZ_PC_PRIV_IP -j ACCEPT

Thanks very much, that's what I was looking for.  I barely understand
NAT/DNAT/SNAT yet but from reading, I assumed it had to be doing
something with DNAT so that it was just wide-open.  Obviously this isn't
"safe" ;)  

The main advantage to this rule, for me, is giving me something to fall
back on for testing purposes.  If something isn't working from that
client box, and I can put it naked on the net with this rule and things
suddenly DO work, then I know I have a routing/firewall problem, not
some other problem.

> using the "DMZ" function of the linksys or doing the above with 
> netfilter is the ultimate act of laziness that does nothing but 
> contribute to the never-ending security problems on the Internet.  if 
> you desire to "step up" to a real firewall system, i would plead with 
> you to do a little bit of homework and try to figure out what ports 
> actually need to opened for the application in question to work.

I agree with you, I didn't make myself very clear.  If I were going to
try to replace the Linksys box feature-for-feature, just for s&g's, I
need to understand what it's doing, and the DMZ is a feature I used
while gaming.  Since my original post, though, I've found that DNAT is
the answer, and as soon as my gaming buddy across town gets back home
I'll test it and see if it works.

> searching the web for "unreal tournament firewall ports" turns up tons 
> of information on how to do this.  you'd get much better responses on 
> this list to a question like, "i found this list of ports i need to open 
> for unreal tournament, but i'm not really sure how to write the rules" 
> than "how do i setup a firewall to do absolutely no firewalling?"

That's not my intent, really... I just wanted to know what the so-called
DMZ was and how to replicate it in iptables.  

What I did was this (after much googling):

iptables -t nat -I PREROUTING -p udp -d <my external IP> --dport 7777
-j DNAT --to-destination 192.168.0.101:7777
iptables -t nat -I PREROUTING -p udp -d <my external IP> --dport 7778
-j DNAT --to-destination 192.168.0.101:7778
iptables -t nat -I PREROUTING -p udp -d <my external IP> --dport 7787
-j DNAT --to-destination 192.168.0.101:7787
iptables -t nat -I PREROUTING -p udp -d <my external IP> --dport 7788
-j DNAT --to-destination 192.168.0.101:7788
iptables -t nat -I PREROUTING -p udp -d <my external IP> --dport 28900
-j DNAT --to-destination 192.168.0.101:28900
iptables -t nat -I PREROUTING -p udp -d <my external IP> --dport 28902
-j DNAT --to-destination 192.168.0.101:28902

> the answer to the question i wish you had asked (ports list taken from: 
>   http://www.portforward.com/cports.htm):

<snip>

First, thanks for the VERY handy link.  Second, looks like I got about
half of it right - I had the PREROUTING steps but none of the FORWARD
steps.

I understand your frustration, thinking I was gonna have a wide-open box
<g> and I'm embarrassed that I was taken as that sort of silly newbie;
it's my fault for not posing the question better.

Thanks for taking the time to answer, I appreciate it.  I'm only up to
chapter four of Tony Mancill's Linux Routers book - maybe by the time
I'm done I'll have a bigger clue.

david williamson


