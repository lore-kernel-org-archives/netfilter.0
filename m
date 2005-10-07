From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: Re: How would this help my LAN / network
Date: Fri, 07 Oct 2005 18:08:59 +0200
Message-ID: <43469D9B.6020103@eccotours.dyndns.org>
References: <4346866D.8080900@eccotours.dyndns.org>
	<4346913E.6070501@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4346913E.6070501@gmail.com>
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
To: Sorin Panca <sorin.panca@gmail.com>
Cc: netfilter@lists.netfilter.org

Sorin Panca wrote:
> 
> Brent Clark wrote:
> 
>>HI all
>>
>>I just came across one of the threads on the LARTC.
>>In the thread it had this.
>>
>>So my question is, for the following rules, would these increase my
>>browsing / traffic, and if so, how.
>>
> 
> Small packets and control pachets should have priority because they
> carry intrractive traffic.

...

> Where are https, irc, messengers... ?

No Sure, this is how I saw / got it.

Hi Sorin

I have added / change the rules to this (was --sport, I made mine --dport).

$IPT -t mangle -A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST,ACK ACK -m length --length 0:128 -j TOS --set-tos Minimize-Delay
$IPT -t mangle -A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST,ACK ACK -m length --length 128: -j TOS --set-tos Maximize-Throughput
$IPT -t mangle -A PREROUTING -p tcp -m tcp --dport 20 -j TOS --set-tos Maximize-Throughput
$IPT -t mangle -A PREROUTING -p tcp -m tcp --dport 21 -j TOS --set-tos Minimize-Delay
$IPT -t mangle -A PREROUTING -p tcp -m tcp --dport 22 -j TOS --set-tos Minimize-Delay
$IPT -t mangle -A PREROUTING -p udp -m udp --dport 53 -j TOS --set-tos Maximize-Throughput
$IPT -t mangle -A PREROUTING -p tcp -m tcp --dport 80 -j TOS --set-tos Maximize-Throughput
$IPT -t mangle -A PREROUTING -p tcp -m tcp --dport 443 -j TOS --set-tos Maximize-Throughput
$IPT -t mangle -A PREROUTING -p udp -m udp --dport 123 -j TOS --set-tos Minimize-Delay

Out of interest, Can I use this on the FORWARD.
If so, would it be best in the PREROUTING, or the FORWARD.
Baring in mind that this is for a natting FW.

I have a private LAN, behind the FW, I basically would likes to try and speed things up for my users.

Thanks again for replying, I really appreciate this.

Kind Regards
Brent Clark

