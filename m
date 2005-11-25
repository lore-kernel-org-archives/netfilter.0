From: Georgi Alexandrov <georgi.alexandrov@gmail.com>
Subject: Re: grovel netfilter_conntrack_xxx from applications how?
Date: Fri, 25 Nov 2005 12:52:53 +0200
Message-ID: <4386ED05.5070002@gmail.com>
References: <7B270B91-F48A-4B64-B0C0-49AAB6E7BB11@softelsystems.com.au>
	<4386B2F2.3030108@gmail.com>
	<9157D95B-8939-4BA4-B254-76E073BC23E9@softelsystems.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9157D95B-8939-4BA4-B254-76E073BC23E9@softelsystems.com.au>
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

Tyler Retzlaff wrote:

>
> On 25/11/2005, at 5:45 PM, Georgi Alexandrov wrote:
>
>> Tyler Retzlaff wrote:
>>
>>> How does one query netfilter for information about conntrack  
>>> connections
>>> when they are established, disestablished etc..?
>>>
>>> Basically for connections established via conntrack_xxx modules I  want
>>> to extract the details and use them in an application on the  
>>> router.   Is there
>>> documentation to a C API for doing this?
>>>
>>> Thanks
>>>
>>>
>> check /proc/net/ip_conntrack
>> but remember that accessing it directly ... with cat for example is
>> known that may crash your machine.
>
>
> eww that doesn't sound very appealing.
>
> I was kind of hoping for something more like callback registration  
> where if a
> new session was established my userspace application was notified  
> allowing
> me to query the details.
>
> I've been reading as much as possible since the original post and  
> have only
> found references to netfilter hooks which appears to be for  
> implementing things
> like ip_conntrack.  I suppose I could fork ip_conntrack and add a  
> callback
> registration interface to it but I was hoping something already existed.
>
> Thanks
>
Perhaps you may try the ULOG (userspace logging) target.
more @ iptables-tutorial.frozentux.net

