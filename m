From: David Busby <busby@edoceo.com>
Subject: Re: Nice ZoneAlarm that might be useful for Iptables
Date: Sun, 19 Jun 2005 23:47:37 -0700
Message-ID: <42B66689.1000702@edoceo.com>
References: <429BDF9F.7070707@mindspring.com>	<20050531043310.GF3681@der-frank.org>	<20050619214142.GN3217@metastasis.org.uk>
	<20050620052833.GP28123@der-frank.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050620052833.GP28123@der-frank.org>
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

Frank Gruellich wrote:
> 
> The penetration is not the ICMP but the DNS resolve.  hackers.com is a
> bad guy's domain running some "special" kind of DNS server.  I've seen
> shells running this way.
> 
> 
>>You can't completely block malware from accessing the Internet, but you
>>can make it really, really difficult...
> 
> 
> No, it's IMHO not that difficult.
> 
> Kind
>  regards, Frank.

Didn't MS Windows just change (xp/sp2) so that infected machines can't open more that like 10 half open sockets?  That 
was viewed as solving the wrong problem.  i.e we wouldn't have to block outbound traffic in drastic/major ways if 
infection didn't happen in the first place.  Not that that is possible either but weigh fix with the problem carefully.

Out of curiosity Frank, are you blocking malicious IM type softwares/plugins/add-ons or users?  If so how?

/djb

