From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPTABLES syntax problem.
Date: Tue, 23 Dec 2003 15:38:35 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312231538.35294.Antony@Soft-Solutions.co.uk>
References: <20031223153018.33886.qmail@web60406.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031223153018.33886.qmail@web60406.mail.yahoo.com>
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

On Tuesday 23 December 2003 3:30 pm, ads nat wrote:

> Ya,
> Following worked from command line :
> #######
> iptables -A INPUT -p tcp ! --tcp-flags SYN SYN -m
> state --state NEW -j LOG --log-prefix " New not syn: "
>
> #######
>
>
> Does this means that I should enter all rules from
> command line.

If you are using iptables-save and iptables-restore, then yes, you should 
enter all your rules at the command line, then use iptables-save to keep them 
for restoring later.

The alternative way to preserve your rules is to write them into a script 
which gets executed on bootup (or whenever).

Either is good - different people use each.

Antony.

-- 
It is also possible that putting the birds in a laboratory setting 
inadvertently renders them relatively incompetent.

 - Daniel C Dennet

                                                     Please reply to the list;
                                                           please don't CC me.


