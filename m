From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: active connections
Date: Sat, 1 May 2004 08:15:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405010815.40366.Antony@Soft-Solutions.co.uk>
References: <BAY15-F34bqJGNzscE8000002f5@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F34bqJGNzscE8000002f5@hotmail.com>
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

On Saturday 01 May 2004 1:43 am, azeem ahmad wrote:

> hi all
> i m having a problem that i m using MASQUERADING on a redhat 8.0 box with
> iptables. the problem is that when i want the users to be disconnected i
> flush iptables; the new connections dont get established but the current
> active connections dont break.

Indeed.   Current connections ("ESTABLISHED" in connection tracking terms) are 
handled in the background, and not by your ruleset (your rules only deal with 
the first packet of a connection).

> like if a user is downloading msn messenger
> for example and i flush iptables, this user's connection dont break. so
> what i can do to break the active connection

You would have to unload the connection tracking module (if you use modules), 
or insert a DROP rule into a mangle table in order to specifically cut off 
the connection/s.

Regards,

Antony.

-- 
Bill Gates has personally assured the Spanish Academy that he will never allow 
the upside-down question mark to disappear from Microsoft word-processing 
programs, which must be reassuring for millions of Spanish-speaking people, 
though just a piddling afterthought as far as he's concerned.

 - Lynne Truss, "Eats, Shoots and Leaves"

                                                     Please reply to the list;
                                                           please don't CC me.


