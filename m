From: "Dimitri Yioulos" <dyioulos@firstbhph.com>
Subject: Re: NAT question
Date: Fri, 11 Mar 2005 08:56:31 -0500
Message-ID: <200503111356.j2BDuTHV004706@mail1.firstbhph.com>
References: <1110545432.4767.16.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1110545432.4767.16.camel@hubcap.ljm.dom>
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

>> Hello, all.
>>  
>> I've recently set up iptables-1.2.8-12.3 on a CentOS 3.4 (RHEL AS 3) box.
>> Among other things, I've created a DMZ where my Web and mail servers
>>live.
>> My problem is that my Web and mail servers identify themselves with the
>> NAT
>> ip address that I've assigned   Here's my NAT rule: 
>> 
>>  IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source 
>> $INET_IP 
>> 
>> How can I get these two servers to identify themselves by their own ip
>> addresses and still provide NAT for my users?

>specify the source address so that only packets from the inside network
>match the SNAT rule:

>  iptables -t nat -A POSTROUTING -o $INET_IFACE -s $INSIDE_NET \
>    -j SNAT --to-source $INET_IP


Thanks to all for your replies!

I was hopeful about applying the above rule.  Internet connectivity is fine;
inbound mail is fine; outbound mail seems not to make it (if the list
receives this, it's because I rolled back to the original rule).  Does that
make any sense?

Dimitri


