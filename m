From: "Nicolas Ross" <rossnick-lists@cybercat.ca>
Subject: Re: Altering a packet's port
Date: Tue, 22 Mar 2005 09:42:43 -0500
Message-ID: <01a401c52eed$67fd5670$bf07a8c0@civicXp>
References: <00c501c52e56$acbe6070$bf07a8c0@civicXp><opsn0cqeu476nf2y@xonix>
	<002201c52e7e$4fe76950$6500a8c0@DEFIANT>
	<1111490995.4267.18.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

What I'm trying to do isn't working...

In my nat table I have :

-A PREROUTING -s 192.168.7.0/24 -d e.f.g.h -p tcp \
  --dport 22 -j DNAT --to-destination e.f.g.h:8022

So that when a host on the local subnet open a ssh connection to e.f.g.h, 
the destination port is changed to 8022.

The connection starts, on e.f.g.h, I see a tcp connection (with netstat), at 
SYN_SENT state.

On the router, in /proc/net/ip_conntrack, I see :

tcp      6 97 SYN_SENT src=192.168.7.191 dst=e.f.g.h sport=2983 dport=8022 
[UNREPLIED] src=e.f.g.h dst=192.168.7.191 sport=8022 dport=2983 use=1

and the ssh connection never establish.

On my desktop, if I establish a ssh connection on port 8022, it works ok.

What am I missing ?

Nicolas

----- Original Message ----- 
From: "Jason Opperisano" <opie@817west.com>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, March 22, 2005 6:29 AM
Subject: Re: Altering a packet's port


> On Mon, 2005-03-21 at 20:27, Nicolas Ross wrote:
>> I saw that in the man page, but I need to do this for ALL hosts to
>> specific
>> subnets, and many hosts. So I'll have to define one rule for EACH host I
>> need a redirect (something like 50 to 75) ?
>
> for loop?
>
> -j
>
> --
> "How much is your penny candy?
> Surprisingly expensive."
> --The Simpsons
>
>
>


