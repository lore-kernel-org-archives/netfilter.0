From: Alberto Sierra <albertux@gmail.com>
Subject: Re: about ip_conntrack_buckets
Date: Sun, 28 Nov 2004 15:50:50 -0600
Message-ID: <115f94404112813505fc750e3@mail.gmail.com>
Reply-To: Alberto Sierra <albertux@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

>>On Sat, 2004-11-27 at 14:04, Alberto Sierra wrote:
>> i was reading some netfilter tunning article and found a comment about
>> /proc/sys/net/ipv4/netfilter/ip_conntrack_buckets but when i issued a
>> cat to check the value of the file, the system said it didn't exist,
>> it this bad? what could happen if not specified?
>>
>> thanks
>>
>> Alberto

>kernel version?

>the ip_conntrack_buckets variable appears after applying:

> submitted/76_conntrack_bucket_sysctl.patch

>from POM, circa Thu Nov 27 06:28:59 2003...  sounds like the kernel you
>are running does not have this patch applied to it.

im using version 2.4.22, with the iprange patch only, i found the
ip_conntrack_buckets default value on the dmesg file, but, what is the
submitted/76_conntrack_bucket_sysctl.patch? i can't find information
on this patch on the netfilter page.do i really need it?

thanks.

