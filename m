From: Martijn Lievaart <m@rtij.nl>
Subject: Re: is this possible (multiple sources, replies go to proper source)
Date: Sat, 22 Jul 2006 12:32:15 +0200
Message-ID: <44C1FEAF.4060304@rtij.nl>
References: <Pine.LNX.4.63.0607101300410.12501@qynat.qvtvafvgr.pbz>	<55561.2001:888:19e1::53.1152616368.squirrel@dexter>
	<44BE491C.7010502@darkstar.nom.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44BE491C.7010502@darkstar.nom.za>
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
To: Paulo Andre <pandre@darkstar.nom.za>
Cc: netfilter@lists.netfilter.org

Paulo Andre wrote:

> Martijn Lievaart wrote:
>
>>
>> Use CONNMARK to remember which connection came from which gateway, 
>> use the
>> ROUTE target to correctly route the replies.
>>
>> HTH,
>> M4
>>  
>>
>
> Hi Martjin, do you have an example on how to do this?
>


Scratch the route target. Use iproute2. In prerouting mark the packet 
according to the interface it came in on. On the retrun traffic restore 
the mark. Create routing rules on the fwmark. Google on "connmark route" 
gives lots of info.

HTH,
M4


