From: Alexey Talikov <alexey_talikov@texlab.com.uz>
Subject: Re: PLs HELP !
Date: Sat, 01 Jun 2002 13:04:37 +0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <KIA5HDB7NJGEHCA0A9XWHEDBSQWVKGUP.3cf88015@ALEXEY>
References: <3CF773A7.7060907@inbox.lv>
Reply-To: alexey_talikov@texlab.com.uz
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3CF773A7.7060907@inbox.lv>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Transfer-Encoding: 7bit
To: Arindam Haldar <arindamhaldar@inbox.lv>
Cc: netfilter@lists.samba.org

See:
/proc/sys/net/ipv4/ip_conntrack_max

31.05.2002 17:59:19, Arindam Haldar <arindamhaldar@inbox.lv> wrote:

>I havent seen it without traffic--i cant replace this running server at 
>the moment ! .. but i can tell u one thing--even at off peak hours the 
>server handles traffic of atleast 512kbps with a max of 2mbps which is 
>comming from the ISP !
>
>Alexey Talikov wrote:
>> This messages appear with traffic or not ??
>> 
>> 31.05.2002 9:14:31, Arindam Haldar <arindamhaldar@inbox.lv> wrote:
>> 
>>>hi to u all again !
>>>i posted the below message yestreday... this log message keeps on commng 
>>>in the messages file EVERY 1min & hence is filing up the disc space 
>>>given for /var/log
>>>pls .. i need some direction in knowing what could be the possible 
>>>problem !..
>>>Thanking u all in advance...
>>>this is the message posted earlier.....
>>>
>>>hi all,
>>>i am getting these messages in my /var/log/messages..
>>>can someone tell me whats hapenning here..
>>>iptables v1.2.7-2--2-423 with  kernel 2.4.18 & patched htb3.3-020512 & 
>>>imq-2.4.18...
>>>May 30 05:09:58 cab1 kernel: ASSERT: ip_nat_core.c:840 
>>>&ip_conntrack_lock not readlocked
>>>May 30 05:10:04 cab1 kernel: ASSERT ip_nat_core.c:739 
>>>&ip_conntrack_lock_R71150de5 readlocked
>>>May 30 05:10:04 cab1 kernel: ASSERT ip_conntrack_core.c:91 
>>>&ip_conntrack_lock_R71150de5 readlocked
>>>May 30 05:10:04 cab1 kernel: ASSERT: ip_nat_core.c:743 
>>>&ip_conntrack_lock not readlocked
>>>May 30 05:10:04 cab1 kernel: ASSERT ip_conntrack_core.c:973 
>>>&ip_conntrack_lock not readlocked
>>>May 30 05:10:04 cab1 kernel: ASSERT: ip_nat_core.c:840 
>>>&ip_conntrack_lock not readlocked
>>>May 30 05:10:04 cab1 kernel: ASSERT ip_nat_core.c:739 
>>>&ip_conntrack_lock_R71150de5 readlocked
>>>May 30 05:10:04 cab1 kernel: ASSERT ip_conntrack_core.c:91 
>>>&ip_conntrack_lock_R71150de5 readlocked
>>>May 30 05:10:04 cab1 kernel: ASSERT: ip_nat_core.c:743 
>>>&ip_conntrack_lock not readlocked
>>>May 30 05:10:04 cab1 kernel: ASSERT: ip_nat_core.c:840 
>>>&ip_conntrack_lock not readlocked
>>>[root@cab1 root]#
>>>
>>>awaiting reply
>>>a.h
>>
>>  
>> -----------------------------------
>> mailto:alexey_talikov@texlab.com.uz
>> BR
>> Alexey Talikov
>> FORTEK
>> -----------------------------------
>>
>

-----------------------------------
mailto:alexey_talikov@texlab.com.uz
BR
Alexey Talikov
FORTEK
-----------------------------------



