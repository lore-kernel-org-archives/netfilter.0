From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Using DNAT and SNAT to do a local redirection does not work
 (want to do what rinetd does with iptables)
Date: Sat, 09 Jun 2007 18:43:43 -0500
Message-ID: <466B3B2F.7090402@riverviewtech.net>
References: <46686B01.6080605@mayr-stefan.de>	<4668A01A.9060304@riverviewtech.net>
	<466AFEBF.6000609@mayr-stefan.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <466AFEBF.6000609@mayr-stefan.de>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 6/9/2007 2:25 PM, Stefan Mayr wrote:
> An answer I often read but nobody says what's wrong with loopback. I 
> thought it depended on the rules of the scenarios (obviously too much 
> thinking involved here).

*nod*  There is nothing specifically wrong (per say) with loopback other 
than the kernel imposed security, which has been discussed elsewhere.  I 
guess this kernel imposed security is not in and of its self a bad thing 
so long as you are aware of it and have things like dummy to work around 
it.  ;)

> I really have to thank you for this enlightenment.

No problem.  I'm just glad that I was able to help.  I've all too often 
been working on a problem and not known the fact that was stopping me 
from making things work.  It is a way to either get gray hair or loose 
what little hair you may have left or worse yet both.

> I used dummy0 and now my iptables ruleset works.

Good.

> That is why I used the loopback-device and my /etc/sysctl.conf
> contains the following lines:
> 
> net.ipv4.conf.all.arp_ignore = 1
> net.ipv4.conf.all.arp_announce = 2

*nod*

> So arp-requests/announces are always answered/sent from the right 
> interface.

*nod*

> Now the lesson is learned, setup is up and running.

Good.

> Thanks,

You are welcome.  :)



Grant. . . .


