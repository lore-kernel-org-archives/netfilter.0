From: Mike Wright <xktnniuymlla@mailinator.com>
Subject: Re: missing module for tcp-flags match?
Date: Fri, 22 Sep 2006 12:22:28 -0700
Message-ID: <451437F4.3070007@mailinator.com>
References: <5bb00b3f0609201654w100cdc33vf8fa674477ed1274@mail.gmail.com>	<5bb00b3f0609220655n7a888c4bt4d1ed714f5193545@mail.gmail.com>	<45141121.1050707@mailinator.com>
	<Pine.LNX.4.61.0609222106510.7758@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0609222106510.7758@yvahk01.tjqt.qr>
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

Jan Engelhardt wrote:
>>>When tyring to set up the rule:
>>
>>iptables -A INPUT -p tcp -m tcp \
>>--tcp-flags FIN,SYN,RST,PSH,ACK,URG SYN,ACK -j DROP
> 
> And if you drop "-m tcp" now, since that should be implied by "-p tcp"?
> 

Yes, according to the man page.

