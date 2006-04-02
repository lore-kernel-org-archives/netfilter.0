From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: It seems I've found why conntrack blocks some packets
Date: Sat, 01 Apr 2006 23:08:51 -0500
Message-ID: <442F4E53.9060501@SCampbell.net>
References: <57F9959B46E0FA4D8BA88AEDFBE582901674BC@pxtbenexd01.pxt.primeexalia.com>	<cc4fcc140603300601j169864eexddc8fe3dd06c1a24@mail.gmail.com>	<442D2C8F.1020505@SCampbell.net>
	<442D320E.7070301@SCampbell.net>
	<cc4fcc140604011259m3ee3a19coa5aac5a34ba3f66e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <cc4fcc140604011259m3ee3a19coa5aac5a34ba3f66e@mail.gmail.com>
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

Carlos Pastorino wrote:
> Now, commenting on this message: I actually didn't know that the
> conntrack table had a limit. Learning something every day. I will
> check its value on Monday, during peak time.

A related thought to this, I wonder how many connections are not being closed nicely and then have to hang around in the conntrack table. If you find that you are approaching the limits then you might want to look into the various connection tracking timings.


> Another thought: if the ACKs that are being blocked are for some
> reason malformed, wouldn't they be blocked as well by the last rule?

The last rule is a log-only rule:

	$IPTABLES -A FORWARD -j LOG --log-prefix "FORWARD blocked: "

It's the one generating the log messages we see, therefore we are actually falling off the table and taking the default policy which is 'DROP'  ($IPTABLES -P FORWARD DROP)

Also, there really isn't that much to the syn-ack packets, kinda hard to malform them too much. 


> 
>> One other thought to this, if I were to presume the ${variables} and ...ip's then I would presume that the RELATED rules should allow these ack's to go through.  The only reason I know of for them not do (again, assuming all the addressing is really ok) would be that the conntrack table has filled up.
>>
>> To see the maximum connnections that can be tracked:
>>
>> # cat /proc/sys/net/ipv4/ip_conntrack_max
>> 32760
>>
>> To see how many you are using at a given moment
>>
>> # wc  -l /proc/net/ip_conntrack
>> 16 /proc/net/ip_conntrack
>>
>>
>> This from my house and there really isn't all that much going on, I would expect far larger counts, you may need to up ip_conntrack_max.  This really out in the SWAG arena because I can't see the details of your installation.
>>
>>
> 


