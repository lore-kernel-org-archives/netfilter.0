From: Jason Opperisano <opie@817west.com>
Subject: Re: How to control the bandwidth
Date: Wed, 08 Dec 2004 08:05:23 -0500
Message-ID: <1102511123.3556.7.camel@hubcap.ljm.dom>
References: <MDAEMON-F200412082053.AA5333898md50000000155@palettemm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <MDAEMON-F200412082053.AA5333898md50000000155@palettemm.com>
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

On Wed, 2004-12-08 at 07:51, Bassam A. Al-Khaffaf wrote:
>  
> Hi All,
>    I have Internet sharing Linux box (Redhat 9, Kernel 2.4.27, iptables
> 1.2.11). All the traffic from the LAN side is MASQUERDED to the WAN side so
> that everyone can get access the Internet.
> 
> My backbone bandwidth is 2 mbps, when some people on the LAN side try to use
> streaming downloads or use VoIP they will reserve the bandwidth and will
> deprive the others from accessing the Internet.
> 
> How can I use the iptables firewall rules to control the bandwidth??
> 
> Regards 
> Bassam
> 
> ---
> Outgoing mail is certified Virus Free.
> Checked by AVG anti-virus system (http://www.grisoft.com).
> Version: 6.0.806 / Virus Database: 548 - Release Date: 12/5/2004
>  

while you can use iptables to mark traffic you want to queue--actual
queuing is handled by iproute2.  the main howto is at:

        http://lartc.org/howto/
        
queuing is specifically covered in chapter 9:

        http://lartc.org/howto/lartc.qdisc.html
        
they also have their own dedicated mailing list:

        http://lartc.org/#mailinglist

-j

--
"Lisa, if the Bible has taught us nothing else, and it hasn't, it's
 that girls should stick to girls sports, such as hot oil wrestling
 and foxy boxing and such and such."
	--The Simpsons


