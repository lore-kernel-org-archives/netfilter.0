From: Matthew Schumacher <matt.s@aptalaska.net>
Subject: Re: ip_conntrack table is full with razor requests. Something isn't
 timing out.
Date: Wed, 02 Mar 2005 09:58:58 -0900
Message-ID: <42260CF2.4080404@aptalaska.net>
References: <4224A715.8030907@aptalaska.net>
	<Pine.LNX.4.58.0503020853460.16314@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.58.0503020853460.16314@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

Jozsef Kadlecsik wrote:
> Hi,
> 
> On Tue, 1 Mar 2005, Matthew Schumacher wrote:
> 
> 
>>Since upgrading to 2.6.10 I have been having problems with my
>>ip_conntrack table filling up.  It appears it is full of razor
>>(http://razor.sf.net) requests from my internal mail server.
>>
>>I raised the ip_conntrack_max to 8192 and there are only a few hosts
>>behind nat so I am certain something isn't getting flushed out.
>>
>>How do I go about diagnosing this.  What specifically does ip_conntrack
>>need to see in the tcp session to mark the session as expired in the table?
> 
> 
> Run tcpdump and record at least one full session of the razor traffic.
> Best is if you capture the traffic on both side of the firewall in order
> to make sure nothing got lost. Collect anything relevant from the
> kernel log file and attach the /proc/net/ip_conntrack lines referring to
> the session. Post the collected data and then we can start to hunt down
> the reason of the problem.
> 

Jozsef,

Here is the relevant part of the dump:


10:15:34.144668 IP 66.151.150.24.2703 > 64.4.232.33.54120: P 37:47(10) 
ack 78 win 5840
10:15:34.147076 IP 64.4.232.33.54120 > 66.151.150.24.2703: . ack 47 win 
49640
10:15:34.151703 IP 64.4.232.33.54120 > 66.151.150.24.2703: P 78:83(5) 
ack 47 win 49640
10:15:34.153156 IP 64.4.232.33.54120 > 66.151.150.24.2703: F 83:83(0) 
ack 47 win 49640
10:15:34.217685 IP 66.151.150.24.2703 > 64.4.232.33.54120: . ack 83 win 5840
10:15:34.256491 IP 66.151.150.24.2703 > 64.4.232.33.54120: . ack 84 win 5840
10:15:34.311607 IP 66.151.150.24.2703 > 64.4.232.33.54120: R 47:47(0) 
ack 84 win 5840

Since there is a ACK before the RST it is safe to assume that the bug 
documented at 
https://lists.netfilter.org/pipermail/netfilter-devel/2004-December/017908.html 
was the problem.

Since kernel 2.6.11 came out this morning, and the bug fix appears in 
the changelog, I went ahead and upgraded and the problems are resolved.

If you would like more information then let me know, but at this point, 
I think it's safe to say that this bug is squashed.

schu

