From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: syn DDoS attack solution
Date: Tue, 19 Jun 2007 17:19:26 -0500
Message-ID: <f59kpi$1vs$1@sea.gmane.org>
References: <465EF582.4070904@bgs.hu>
	<015e01c7a3bf$64fbe7e0$2ef3b7a0$@COM>	<465FEA82.709@bgs.hu>
	<007101c7a45d$bc50e380$34f2aa80$@COM>	<466090CA.2050806@rtij.nl>
	<Pine.LNX.4.64.0706191422070.29334@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64.0706191422070.29334@darkstar.sysinfo.com>
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

R. DuFresne wrote:
>
> On Fri, 1 Jun 2007, Martijn Lievaart wrote:
>>
>> An connection is in the ESTABLISHED state once a packet has been seen. 
>> So once the SYN is seen, the state is ESTABLISHED.
>>
> 
> 
> No, it is in state "new" with a mere syn sent.

You have to specify whether you are talking about the TCP connection
status or the conntrack status.  A mere SYN is sufficient to make an
ESTABLISHED status in conntrack.  If that were not true, then when
I send a TCP SYN packet the SYN/ACK would never make it back through
my firewall.

-- 
Bob Nichols     "NOSPAM" is really part of my email address.
                 Do NOT delete it.


