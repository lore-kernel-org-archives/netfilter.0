From: Jason Opperisano <opie@817west.com>
Subject: Re: INPUT or FORWARD;;
Date: Mon, 20 Dec 2004 07:58:45 -0500
Message-ID: <1103547524.2932.6.camel@hubcap.ljm.dom>
References: <Pine.LNX.4.05.10412200158240.18976-100000@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.05.10412200158240.18976-100000@darkstar.sysinfo.com>
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

On Mon, 2004-12-20 at 02:10, R. DuFresne wrote:
> I see in the FAQ on the netfilter website this under  section 7.3
> FILTERING SPECIFICATIONS;
> 
> <quote>
> 
> Specifying an Interface
> 
> ...
> 
>  Packets traversing the INPUT chain don't have an output interface,
>           so any rule using `-o' in this chain will never match.
> 	  Similarly, packets traversing the OUTPUT chain don't have an
> 	  input interface, so any rule using `-i' in this chain will never
> 	  match.
>  Only packets traversing the FORWARD chain have both an input and
>           output interface.
> 
> 
> </quote>
> 
> 
> My question is this, and it may well have been answered many times
> already, I'll take the slap to the back of the head if it's one of the
> common list questions that folks tend to get irritated in repeatedly
> answering;
> 
> A multi-homed firewall having at least two interfaces, is known, at least
> to itself by those IP/hostnames combos assinged to its interfaces.  <i.e.
> ppp0 and eth0>  So say rules coming from the ppp0 interface into the
> firewall <INPUT rules> are directed to it's other name/interface
> 
> -i /dev/ppp0 -d /dev/eth0

well--those values make no sense whatsoever, but if you're asking if the
following is valid:

  iptables -A INPUT -i ppp0 -d $IP_OF_ETH0 -j ACCEPT

then yes.  the INPUT chain is traversed by packets destined for a local
process (IP addresses).  the input interface is just a tag attached to
the packet.

-j

--
"If I wanted smoke blown up my ass, I'd be at home with a pack of
 cigarettes and a short length of hose."
	--The Simpsons


