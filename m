From: "Giacomo" <delleceste@gmail.com>
Subject: timers in linux kernel
Date: Sat, 29 Oct 2005 14:05:44 +0200
Message-ID: <001c01c5dc81$191cfff0$0300a8c0@giacomino>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: netfilter lists <netfilter@lists.netfilter.org>


----- Original Message ----- 
From: "Giacomo" <delleceste@gmail.com>
To: <netfilter-devel-request@lists.netfilter.org>
Sent: Saturday, October 29, 2005 10:56 AM
Subject: timers in linux kernel


> Good morning, in my kernel code, which handles timeouts for connection 
> tables in a linked list, i do:
> 
> inline void update_timer_of_state_entry(struct state_table *sttable)
> {
> if (sttable->state.state == ESTABLISHED)
>  mod_timer(&sttable->timer_statelist,
>     jiffies + HZ * state_lifetime);
> else
>  mod_timer(&sttable->timer_statelist,
>     jiffies + HZ * setup_shutd_state_lifetime);
> }
> 
> sttable is a structure which contains a struct timer_list.
> 
> In:
> 
> mod_timer(&sttable->timer_statelist,
>     jiffies + HZ * state_lifetime);
> 
> i update the timeout for the structures, so that when timer expires, 
> structure is removed from linked list.
> 
> The problem is that when state lifetime is long, let's say 2592000 for 
> instance, kernel goes in panic!
> 
> If the value is low, say 300, or higher 259200000, ok!
> 
> I suspect a problem of overflow .. is it possible?
> 
> What can be wrong?
> 
> Thanks a lot for any hint!
> 
> Giacomo.
> 
>

