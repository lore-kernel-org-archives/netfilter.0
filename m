From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problem with nat table in iptables
Date: Thu, 27 May 2004 20:55:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405272055.28159.Antony@Soft-Solutions.co.uk>
References: <40B6322E.6050205@nicaraguarealestate.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40B6322E.6050205@nicaraguarealestate.com>
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

On Thursday 27 May 2004 7:23 pm, Jorge Davila wrote:

> Hi!
>
> When I insert a new rule in the chain INPUT and save/restart iptables my
> firewall lost the nat table.
>
> Someone have an idea about how recover the nat table?

Do you mean you lost the nat table itself, and now you can't put any rules 
into it, or do you mean you've lost the rules in the nat table and want to 
get them back again?

If it's the first, try insmod iptable_nat.

If it's the second, how are you saving / restarting iptables?   There must be 
something strange about soem script if it keeps the filter rules but not the 
nat rules.

If it's neither of the above, please give us more details of exactly what 
you're doing (eg: cut & paste from a console to show us the problem in 
action), and we'll see if we can help.

Regards,

Antony.

-- 
Success is a lousy teacher.  It seduces smart people into thinking they can't 
lose.

 - William H Gates III

                                                     Please reply to the list;
                                                           please don't CC me.


