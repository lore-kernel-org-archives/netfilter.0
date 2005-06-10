From: CompuGenic <pablo@compugenic.com>
Subject: Re: Why do I have 'MARK' all over my logs?
Date: Fri, 10 Jun 2005 04:09:24 -0700
Message-ID: <BAY0-SMTP05E513CA738D581F45FF52BCFF0@phx.gbl>
References: <BAY0-SMTP07EE697B166AFFF0DFD5FFBCFF0@phx.gbl>
	<9151ac2a05061004025b3453e8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Message-ID: <42A974E4.5040704@compugenic.com>
In-Reply-To: <9151ac2a05061004025b3453e8@mail.gmail.com>
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
To: Filip Sneppe <filip.sneppe@gmail.com>
Cc: netfilter@lists.netfilter.org

Filip Sneppe wrote:

>Hi,
>
>On 6/10/05, CompuGenic <pablo@compugenic.com> wrote:
>  
>
>>Hello all.
>>    
>>
>...
>  
>
>>However, my logs are constantly filled with entries as follows:
>>Jun 9 8:51:12 host -- MARK --
>>Jun 9 9:11:12 host -- MARK --
>>Jun 9 9:31:12 host -- MARK --
>>Jun 9 9:51:12 host -- MARK --
>>Jun 9 10:11:12 host -- MARK --
>>Jun 9 10:31:12 host -- MARK --
>>
>>Notice the time patterns? I have no idea where these are coming from? Is
>>    
>>
>
>These are from syslog - notice how they are logged every 20 minutes,
>when syslog has gone 20 minutes without receiving a message for
>this log file.
>
>Let's say your machine crashes overnight. At the very least you may be
>able to pinpoint when the machine crashed (within a 20-minute interval)
>thanks to these messages :-)
>
>Regards,
>Filip
>
>
>  
>
Wow, that's a neat feature. I've been using linux for a while, but I 
guess there is still some basics I need to cover.
Thanks a lot for the quick responses.

Pablo

