From: Jan den Ouden <jan.ml@denouden.info>
Subject: Re: bad tcp checksum
Date: Wed, 05 Apr 2006 18:18:23 +0100
Message-ID: <4433FBDF.2070701@denouden.info>
References: <4433E766.9080409@denouden.info>
	<200604050920.31151.teastep@shorewall.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200604050920.31151.teastep@shorewall.net>
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
To: Tom Eastep <teastep@shorewall.net>
Cc: netfilter@lists.netfilter.org

Yes, you're right, the solution is the use ethtool in the domU domain to 
disable checksum offloading. I didn't expect it was related to Xen, so 
that's why I asked here.

Thanks for the pointer.

Jan

Tom Eastep wrote:
> On Wednesday 05 April 2006 08:51, Jan den Ouden (ml) wrote:
>   
>> Hi,
>>
>> I'm seeing a strange problem with kernel 2.6.12 Xen domain0 with all
>> netfilter options compiled in. I'm trying to do port forwarding to an
>> internal machine from an internet gateway box.
>>
>> What works ok is forwarding from gateway:143 to internalmachine:143.
>>
>> But when I forward from gateway:1000 to internalmachine:143 I get bad
>> TCP checksums on the return packets. These packets are ignored on the
>> client machine on the external internet.
>>
>>     
>
> I suggest that you search the Xen-users list archives -- this issue has been 
> discussed ad nauseum.
>
> -Tom
>   


