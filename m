From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: changing rules at a defined time
Date: Wed, 24 Dec 2003 10:11:14 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312241011.14770.Antony@Soft-Solutions.co.uk>
References: <20031224092936.GB27890@staticky.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031224092936.GB27890@staticky.com>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

On Wednesday 24 December 2003 9:29 am, Payal Rathod wrote:

> Hi,
> I have a very basic LAN setup question like,
>
> - till 16:00 p.m. all ips can just use ftp but ips 192.168.0.1
>   and 192.168.0.100 can do anything
>
> - after 4:00 afternoon all can do anything till 5:00 after which again
>   the above [1st rules] are to be applied.
>
> I am thinking of doing,
>
> [For step 1]: - Policy ACCEPT for FORWARD
>
> iptables -A FORWARD -s 192.168.0.1 -p tcp -j ACCEPT
> iptables -A FORWARD -s 192.168.0.100 -p tcp -j ACCEPT
> iptables -A FORWARD -s 192.168.0.0/32 -p tcp --dport 21 -j ACCEPT
> iptables -A FORWARD -s 0/0 -p tcp -j DROP
>
> [For step 2]: - Policy ACCEPT for FORWARD
>
> iptables -A FORWARD -p tcp -j ACCEPT
>
> Maybe same for udp.
>
>
> Now my question is,
>
> 1> Do the above steps look ok? I will refine them further. Right now are
> they workable.

I really disapprove of a default ACCEPT policy on FORWARD.

You should use a default DROP policy, and let the rules specify what you 
ACCEPT.

> 2> If I want to change the rules at 16:00 what is the best way to change
> them? I was thing of flushing with iptables -F and iptables -F -t nat
> and then running the second step.
> Similary at 17:00 do the same kind of flushes and run 1st step from a
> file? Is this approach ok or is there anything better?

For simplicity (?) I would use a cron job at 16:00 to Insert a rule, and 
another at 17:00 to Delete it.   For example:

iptables -P FORWARD DROP
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $INTIF -p tcp --dport 21 -j ACCEPT
iptables -A FORWARD -i $INTIF -s 192.168.0.1 -j ACCEPT
iptables -A FORWARD -i $INTIF -s 192.168.0.100 -j ACCEPT
iptables -A FORWARD -i $INTIF -p tcp --dport 53 -j ACCEPT
iptables -A FORWARD -i $INTIF -p udp --dport 53 -j ACCEPT

Then at 16:00, use a cron rule to run:

iptables -A FORWARD -i $INTIF -s 192.168.0.0/24 -j ACCEPT

At 17:00 use a cron rule to run:

iptables -D FORWARD -i $INTIF -s 192.168.0.0/24 -j ACCEPT

The only thing I can think of which this solution which you have to decide 
whether you're happy about is that connections currently in progress at 17:00 
will not be cut off - users simply won't be able to make new ones until 16:00 
the following day.

Hope this helps,

Antony.

-- 
Normal people think "If it ain't broke, don't fix it".
Engineers think "If it ain't broke, it doesn't have enough features yet".

                                                     Please reply to the list;
                                                           please don't CC me.


