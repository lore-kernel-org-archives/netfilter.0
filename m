From: Rayed <rayed@saudi.net.sa>
Subject: Re: Forking inside netfilter queue
Date: Tue, 01 May 2007 09:30:22 +0300
Message-ID: <4636DE7E.80600@saudi.net.sa>
References: <4635EC8E.4090905@saudi.net.sa>
	<Pine.LNX.4.61.0704301547010.29151@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0704301547010.29151@yvahk01.tjqt.qr>
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org

Thanks Jan for the reply.

I know how preforking works (almost), what I want to know if multi 
processes can access the same queue API without breaking anything.


Jan Engelhardt wrote:
> On Apr 30 2007 16:18, Rayed wrote:
>   
>> I am building netfilter queue application, that implement simple
>> HTTP filter.
>>
>> It basically will capture the packet, extract the URL, and issue
>> MySQL lookup to see if the address is permitted or blocked.
>>
>> My only fear that address lookup will block the traffic until I get
>> the lookup reply, so I am thinking of using preforking model to
>> fork 10-20 processes to handle the same queue.
>>
>> Has any one done multi prcoess handling of the queue, is it even doable?
>>     
>
> See Apache, it uses preforking. But perhaps threading is much simpler
> and equally fast.
>
>
> Jan
>   


