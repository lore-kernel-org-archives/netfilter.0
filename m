From: Jim Gifford <maillist@jg555.com>
Subject: Re: Use of Kernel Headers
Date: Tue, 17 Aug 2004 14:09:27 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41227407.1030406@jg555.com>
References: <41226D56.3080800@jg555.com> <200408172200.07018.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408172200.07018.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter <netfilter@lists.netfilter.org>

Antony Stone wrote:

>On Tuesday 17 August 2004 9:40 pm, Jim Gifford wrote:
>
>  
>
>>I have been asked this question a lot of times, and I think it should be
>>asked here for an official answer.
>>
>>It has been stated numerous times that userspace programs should not be
>>compiled against raw kernel headers, but iptables does compile against
>>userspace headers and breaks this rule. With the advent of the
>>linux-libc-headers package, should iptables be compiled against the
>>linux-libc-headers or the raw kernel headers since iptables is a user
>>space program?
>>
>>Should patch-o-matic update the headers in the proper location,
>>/usr/include/linux/netfilter_ipv4 etc?
>>    
>>
>
>Patch-o-matic is not the right way of doing this - this would be dealt with in 
>a new version release of iptables.
>
>P-o-M is for adding new features and functions (which are optional and not 
>used by most iptables users) to netfilter; it couldn't sensibly be used to 
>change the structure of how it compiles.
>
>As for the answer to your question, I think that is one for the developers' 
>list.   Some of them do read this list, but cannot be guaranteed to see all 
>posts or respond to them due to the volume.
>
>Regards,
>
>Antony.
>
>  
>
Thanx Anthony, will do.

-- 
----
Jim Gifford
maillist@jg555.com


