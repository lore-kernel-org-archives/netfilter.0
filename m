From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Blackholing probing addresses
Date: Mon, 01 Aug 2005 00:01:05 -0500
Message-ID: <42EDAC91.4040801@riverviewtech.net>
References: <00c701c59481$34966250$1500a8c0@domain.internationalauto.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00c701c59481$34966250$1500a8c0@domain.internationalauto.com>
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
To: netfilter@lists.netfilter.org

J.T. Moore wrote:

>Does anyone have recommendations on how to automatically blackhole addresses. I've gotten tired of looking through our iptables logs and seeing tons of probes against every ip on our network. I'd rather not reduce the log sensitivity because I like to see details about what's going on, but I'd love to be able to detect certain patterns and blackhole all traffic from the source ip for a given period of time. 
>
>For example, if a source tried to access tcp port 25 on two unused addresses within a minute, I'd like to be able to add the source ip to a target chain that silently drops all traffic from the address, but then remove the address from the chain after 30 minutes. 
>
>It looks like I should be able to do something at least pretty close to this with the QUEUE target. I also just ran across the ipset utility which also looks like it will be helpful. I'm interested to know if anyone else is doing something like this and if so, I'd be very interested to know what your experiences have been with it. 
>
>Thanks in advance,
>
>J.T. Moore
>International Auto Parts
>
I would look at the IPTables recent match extension.  I'm going to 
presume that you have a block of IP addresses, size does not really 
matter, and only a few of which will have legitimate SMTP servers 
running and thus it would be easier to have a list of OK SMTP servers to 
contact and the rest are not ok.  With this in mind I would build an 
IPTables rule set with one or more matches that check the destination 
and skip the (SMTP) trap if the packet is destined to a known good SMTP 
server, a white list of SMTP destinations if you will.  If the packet is 
not destined to a known good SMTP server you would probably want to add 
the source IP of the packet to a recent match list.  You could then test 
to see if the source IP of a packet is in the recent list (name of your 
choice) to see if it has been seen with in the last 30 minutes (1800 
seconds) and has a hit count of more than 2 (or what ever you want to 
test for) and then take action based on the fact that this source IP is 
probably probing your network.  Some people want to do a blanket DROP / 
REJECT / TARPIT on traffic that is coming from an annoying IP and others 
tend to just want to block all new traffic.  This really is a political 
decision depending on the security policies at your institution.

If you are interested in pursuing this line of thought further reply 
with details of your network and I'll try to propose an IPTables rule 
set that would accomplish this.



Grant. . . .

