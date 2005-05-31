From: Feizhou <feizhou@linuxmail.org>
Subject: Re: Nice ZoneAlarm that might be useful for Iptables
Date: Tue, 31 May 2005 14:42:53 +0800
Message-ID: <429C076D.6010703@linuxmail.org>
References: <429BDF9F.7070707@mindspring.com>
	<429BF102.6020906@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <429BF102.6020906@riverviewtech.net>
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
To: Netfilter <netfilter@lists.netfilter.org>


>> The ability to block this by only allowing "approved" programs to 
>> access the Internet would be a nice addition to Iptables.
> 
> 
> The ability to only allow "approved" programs to send traffic out *IS* 
> available now.  You are asking for asking for something that the "owner" 
> match extension will provide via the "--cmd-owner", possibly in 
> combination with the "--uid-owner".

nope. owner match is not going to do the 'approved' program access check.

Zone Alarm triggers on the name of the program.

For something similar, there needs to be a way for iptables to store and 
reference a list of approved process names (not necessarily their access 
patterns such as dest port and so on but i suppose if the name list is 
possible, it won't be that hard to tack on extra optional conditions) 
and so a trojan running wget would trigger if wget was not in the list 
of approved programs.

