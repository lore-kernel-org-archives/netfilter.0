From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problem with nat table in iptables
Date: Thu, 27 May 2004 21:48:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405272148.26466.Antony@Soft-Solutions.co.uk>
References: <40B6322E.6050205@nicaraguarealestate.com> <200405272055.28159.Antony@Soft-Solutions.co.uk> <40B652F0.1070107@nicaraguarealestate.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40B652F0.1070107@nicaraguarealestate.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thursday 27 May 2004 9:43 pm, Jorge Davila wrote:

> I lost the nat table and I can put rules ....

I'm sorry, I don't understand the problem.

Please show us your original rules (iptables -L -nvx; iptables -L -t nat 
-nvx), then add your rule to the INPUT chain, save and restore the ruleset, 
and show us the problem.   Copy & paste all the above so we can see what you 
mean (I know that might be a long email but people who don't care can ignore 
it; those of us who can help will benefit from the information).

Regards,

Antony.

-- 
The idea that Bill Gates appeared like a knight in shining armour to lead all 
customers out of a mire of technological chaos neatly ignores the fact that 
it was he who, by peddling second-rate technology, led them into it in the 
first place.

 - Douglas Adams in The Guardian, 25th August 1995

                                                     Please reply to the list;
                                                           please don't CC me.


