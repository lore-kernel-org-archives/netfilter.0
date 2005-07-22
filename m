From: Ruprecht Helms <rhelms@my-mail.ch>
Subject: Re: one interface, basic setup
Date: Fri, 22 Jul 2005 20:51:42 +0200
Message-ID: <42E1403E.9010009@my-mail.ch>
References: <42DF0A8E.9020102@sbcglobal.net> <42DF8BDE.5080805@gmx.co.uk>
	<42E067DB.3060809@sbcglobal.net>
Reply-To: rhelms@my-mail.ch
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42E067DB.3060809@sbcglobal.net>
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
To: Bill McCormick <wpmccormick@sbcglobal.net>, netfilter@lists.netfilter.org

Bill McCormick wrote:
> /dev/rob0 wrote:
> 
>> Bill McCormick wrote:
>>
>>> (basic and packet filtering) I still feel unsure. I want to build a 
>>> FW for outgoing packets only. My setup looks like this:
>>>
>>> internet <---->Netgear FVS318 <----> LAN

The case he wants

internet <------ Netgear FVS 318 <---- FC3  ----> LAN

internet -------> something else or nothing ----> (FC3) ? ---> LAN


> ...Basically, I just want 
> ALL out-bound traffic to pass through FC3 iptables then get routed to 
> the FVS318.

> So, the best (easiest) way to accomplish this is to make the FC3 the 
> gateway router by adding another interface? 

I'm right that routing to outside should be via dmz in this case?

Figured like this:



internet ------> FC3 <------> LAN
                  |
                  | DMZ
                  |
internet <---- Netgear FVS 318


>Do the NAT rules get crazy 
> for that? 

In this case NAT must translate the incoming traffic for the lan
and the outgoing for routing in the dmz. To transfer the traffic
out in the internet is be done by the netgearrouter.


Are the routing tables complicated?

Regards,
Ruprecht

------------------------------------------------------------------------------------------
Ruprecht Helms IT-Service & Softwareentwicklung

Tel./Fax  +49[0]7621 16 99 16
Web:       htp://www.rheyn.de


