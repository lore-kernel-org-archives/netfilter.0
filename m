From: Jason Opperisano <opie@817west.com>
Subject: Re: protocol 50 unreachable
Date: Fri, 03 Dec 2004 21:35:36 -0500
Message-ID: <1102127736.3691.8.camel@hubcap.ljm.dom>
References: <Pine.LNX.4.44.0412030908140.29374-100000@gollum.grajagan.net>
	<200412032120.44988.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200412032120.44988.Alistair@nerdnet.ca>
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
To: netfilter@lists.netfilter.org

On Fri, 2004-12-03 at 21:20, Alistair Tonner wrote:
> On December 3, 2004 12:11 pm, Helge Weissig wrote:
> > ahhh... finally I see something... but what does it mean???
> >
> > added the following two log rules:
> > $IPTABLES -A PREROUTING -t mangle -j LOG --log-level info --log-prefix 'all
> > mangle preroute: ' $IPTABLES -A PREROUTING -t mangle -m conntrack --ctstate
> > INVALID -j LOG --log-level info --log-prefix 'contrack mangle preroute: '
> >
> > the second generates the following error:
> > iptables v1.2.6a: Couldn't load match
> > `conntrack':/lib/iptables/libipt_conntrack.so: cannot open shared object
> > file: No such file or directory
>  
>  The above error indicates you did not build the conntrack match module and 
> related iptables code. 
> 
> >
> > the ESP's however now show up in the log (these are nmap generated):
> 
> > Dec  3 09:07:23 gollum kernel: all mangle preroute: IN=eth0 OUT=
> > MAC=00:90:27:ca:39:56:00:10:67:00:b4:3e:08:00 SRC=vpn.server.ip
> > DST=ext.if.ip LEN=20 TOS=0x00 PREC=0x00 TTL=32 ID=56785 PROTO=ESP
> > INCOMPLETE [0 bytes] 
> 
> > Dec  3 09:07:23 gollum kernel: all mangle preroute: 
> > IN=eth0 OUT= MAC=00:90:27:ca:39:56:00:10:67:00:b4:3e:08:00
> > SRC=vpn.server.ip DST=ext.if.ip LEN=20 TOS=0x00 PREC=0x00 TTL=32 ID=7732
> > PROTO=ESP INCOMPLETE [0 bytes]

LEN=20 means the IP packet is only 20 bytes--which would lead one to
believe that the packet contains only an IP header and no data.  which
is probably all nmap is generating.  not sure what more you would expect
from such a test.

-j

--
"I have thought this through. First, I will send Bart the money to
 fly home. Then I will murder him."
	--The Simpsons


