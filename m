From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: Forcing an RST
Date: Mon, 20 Feb 2006 14:18:22 -0500
Message-ID: <43FA15FE.1080605@SCampbell.net>
References: <00dd01c63645$6bb69910$020a0aac@SOUTHWEST>
	<43FA04F5.3010403@SCampbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43FA04F5.3010403@SCampbell.net>
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
To: Steven M Campbell <Netfilter@SCampbell.net>
Cc: netfilter@lists.netfilter.org, James Strickland <jstic04@cp.centennialcollege.ca>

Steven M Campbell wrote:
> James Strickland wrote:
>> Hi. Is there a way so that when a packet reaches the filter table input
>> chain with the Syn flag set, that i send out a response with RST?
>>
>> ie: connections to my wan interface with Syn set (trying to 
>> establish) on
>> port 80 get a RST response to the sender?
>>
>>
>>   
> Use  -p tcp --syn -j REJECT --with tcp-reset
>
>
>
heh, both of us got it wrong, sven missed the syn bit, I missed the port 80

-p tcp --syn --dport 80 -j REJECT --with tcp-reset


