From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: duplicating packets target
Date: Sun, 4 Apr 2004 10:43:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404041043.53161.Antony@Soft-Solutions.co.uk>
References: <406FD603.6090802@idealteknoloji.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <406FD603.6090802@idealteknoloji.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Sunday 04 April 2004 10:31 am, Oguz Yilmaz wrote:

> Hi,
>
> Are there any way of duplicating packets(in netfilter base, patchomatic
> or any third party patch?) targeted to one host to several hosts using
> targets?

This will obviously only work for UDP (not TCP, because of the sequence & 
acknowledgement numbers), so you might find it easiest to set up a DNAT rule 
to a multicast address, and then use a multicasting router to send the 
packets to their required destinations?

I certainly can't think of a way netfilter can make two packets out of one - 
its basic job, after all, is to turn one packet into none at all in some 
circumstances (the DROP target)....

Regards,

Antony.

-- 
Microsoft may sell more software than any other company, but McDonald's sell 
more burgers than any other company, and I think the other similarities are 
obvious...

                                                     Please reply to the list;
                                                           please don't CC me.


