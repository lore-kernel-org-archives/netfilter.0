From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DMZ to DMT through ROUTER problem !
Date: Thu, 20 May 2004 16:07:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405201607.10019.Antony@Soft-Solutions.co.uk>
References: <200405201318.34706.liste@zerozone.it> <200405201545.32872.Antony@Soft-Solutions.co.uk> <200405201658.59945.liste@zerozone.it>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405201658.59945.liste@zerozone.it>
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

On Thursday 20 May 2004 3:58 pm, O-Zone wrote:

> On Thursday 20 May 2004 16:45, Antony Stone wrote:
> > Yes, but that destination address has already been changed by your
> > PREROUTING rule, and is now 192.168.0.0/24 - that's the whole point.   If
> > the destination address had not been changed (ie: if the client had
> > contacted the server's real IP address instead of a pretend one), you
> > wouldn't need to change the source address as well.
>
> As you say, the problem was when a server with 192.168.0.x, passing through
> 192.168.0.1 (that is the ROUTER), and try to connect to 151.8.47.x (the
> real server's PUBLIC IP). This is the desidered flow:
>
> 192.168.0.2-->151.8.47.A-->192.168.0.3
>
> So i think that i need additiona rules to MASQ/DNAT connection to
> 151.8.47.x !

Well, yes, but this PREROUTING DNAT rule is needed for connections from the 
outside, which you say are working fine already?

I quote from your original posting:

 - Hi all,
 - i've a big problem. Here's a little diagram:
 - 
 - [INTRANET 10.0.0.0/24]-------------+
 -                                                       +--[ROUTER]--(NET)
 - [DMZ SERVER A - 192.168.0.2]----+
 - [DMZ SERVER B - 192.168.0.3]----+
 - 
 - Each DMZ server is mapped to it's PUBLIC IP. For example:
 - 
 - 151.8.47.A ----> 192.168.0.2
 - 151.8.47.B ----> 192.168.0.3
 - 
 - and all work perfectly !!!"

If you do not in fact already have the PREROUTING DNAT rules, then what do you 
mean by "Each DMZ server is mapped to its PUBLIC IP"?   Maybe I misunderstood 
what you have already done, and already have working, and what problem is 
still left to solve?

Regards,

Antony.

-- 
"Reports that say that something hasn't happened are always interesting to me, 
because as we know, there are known knowns; there are things we know we know. 
We also know there are known unknowns; that is to say we know there are some 
things we do not know. But there are also unknown unknowns - the ones we 
don't know we don't know."

 - Donald Rumsfeld, US Secretary of Defence

                                                     Please reply to the list;
                                                           please don't CC me.


