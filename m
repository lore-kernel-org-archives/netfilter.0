From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables crashes server?
Date: Mon, 04 Apr 2005 09:59:15 -0500
Message-ID: <42515643.3040202@riverviewtech.net>
References: <4250F7E0.3070203@uplink-verein.ch>
Reply-To: gtaylor@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4250F7E0.3070203@uplink-verein.ch>
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
To: Moritz Gartenmeister <moritz@uplink-verein.ch>
Cc: netfilter@lists.netfilter.org

I've had a similar situation on a system that was extremely complex (ECMP across 8 UML routers & CableModems, etc) running a lot of things both kernel space and user land.  We put 2 GB in the box for all the contracks that were going on for support of roughly 64000 possible contracks (8000 per UML with 8 UMLs) (there is a formula that I can find if needed).  The box would end up in a very similar situation after about 36 hours of operations.  We decided to set up a cron job to reboot the box daily.  Yes I know that this is a unix box that we are talking about, but given the nature of what the system was doing and the amount of time that we had to work on things this was the simple solution at the time.  Needless to say it's (sort of) working so my boss will not let me go back and work on it any more.  :(  Yes it pains me every time that I think about it.



Grant. . . .

Moritz Gartenmeister wrote:

> hi all
> 
> i'm running linux 2.6.11.3 and iptables 1.3.1 with pom 20050321. i 
> patched the kernel with ipp2p, and layer-7 patch.
> 
> the server is running as a bridge and is working absolutly fine. after a 
> while (there is no specific time limit) the server crashes. the server 
> is no more able to allocate new memory and even swapping doesn't help. 
> in this state i am unable to log in, i have to push the power button.
> 
> i don't see heavy traffic before a crash and i don't see any flooding. 
> is there a known memory leak problem?
> 
> i checked /proc/sys/net/ipv4/netfilter/ip_conntrack_count this number is 
> in the range of 2'000 - 5'000.
> i checked /proc/slabinfo <active_objs> is more or less similiar to 
> ip_conntrack_count, <num_objs> is the maximum of ip_contrack_count.
> i also was checking /proc/meminfo and there was no steady increase.
> 
> /var/log/messages shows no warning.
> /var/log/syslog shows nothing
> icmp is working.
> imap is probably working (someone told me).
> http is not working.
> pop over ssl is working (sometimes).
> 
> does anyone had/have the same experience? or does anyone have some hints 
> for further steps?
> 
> hardware: dell poweredge 2560 with 2gybte ram, 2 xenon dual cpus.
> 
> i was running the same setup wiht an older kernel 2.6.7/10 without much 
> troubles.
> 
> regards
> moritz
> 
> 
> 


