From: "Chun Fung, John Yuen" <zeroz000@hotmail.com>
Subject: Question: ipq_read() returning "Received message truncated"
Date: Tue, 05 Aug 2003 23:47:56 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY2-F35MXehYSoOZzH0000ad86@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all,

I am a newbie in using libipq. Currently, I am experiencing a problem 
regarding truncated message. Occassionally, ipq_read() will return an error 
(rc = -1) and the error message says "Received truncated message". My code 
currently ignores that error and have the system continue processing. 
However, some packets seem to be staying in the ip queue (by checking 
'/proc/net/ip_queue'), which will cause the queue to fill up eventually. I 
checked the number of such error, and it matches exactly the number of 
packets staying in the queue. I am just wondering if anyone knows the cause 
of such error, and what's the proper way of handling it?

In addition, I am wondering whether the ipq_read() and set_verdict() calls 
are thread safe. Should I put mutex locks around these two function calls? 
Putting mutex locks seem to set the errno to EINTR. I am just wondering if 
this is necessary at all.

Thank you in advance for any help.

Best Regards,
John

_________________________________________________________________
Help STOP SPAM with the new MSN 8 and get 2 months FREE*   
http://join.msn.com/?page=features/junkmail


