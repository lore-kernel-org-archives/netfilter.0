From: Joel Newkirk <firewalldude@newkirk.us>
Subject: Re: Time changes
Date: Wed, 22 Oct 2003 20:35:02 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066869302.2946.353.camel@alpha.newkirk.us>
References: <NEBBICCJKLGJHMMNBPIKAENKFLAA.sbisgaard@xtrasource.com>
Reply-To: firewalldude@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NEBBICCJKLGJHMMNBPIKAENKFLAA.sbisgaard@xtrasource.com>
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
To: sbisgaard@xtrasource.com
Cc: netfilter@lists.netfilter.org

On Wed, 2003-10-22 at 15:44, Steffen Bisgaard - Xtrasource wrote:
> Hallo list,
>  
> A quick question: Is it possible to block access to and from a PC (say
> 10.2.0.3) at a specific time, for example 21:00, and re-enable it at
> 08:00 the next day using iptables - and if so how?? Yes this is the
> kids PC...
> It used to be real simple with ipfw - I can't remember the syntax but
> something along the lines of ipfw -add (or -remove) deny (or allow)
> 10.2.0.3 all
>  
> Any ideas? Or do I need two separate iptables scripts?

Not full scripts.  Try creating two cron jobs - one running at 21:00 the
other at 08:00.  One is just:
iptables -I FORWARD 1 -s 10.2.0.3 -j REJECT
the other
iptables -D FORWARD -s 10.2.0.3 -j REJECT

j



