From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Redirection to local lan, isn't DNAT method unsafe.
Date: Thu, 1 Apr 2004 10:05:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404011005.30735.Antony@Soft-Solutions.co.uk>
References: <40696C1A.5080400@personalsoft.com.br> <200404010937.47442.Antony@Soft-Solutions.co.uk> <004301c417c7$232981b0$de0aa8c0@comp>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004301c417c7$232981b0$de0aa8c0@comp>
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

On Thursday 01 April 2004 9:55 am, Bo Jacobsen wrote:

> > It is normally recommended *not* to do filtering in the nat or mangle
> > tables, however in this case if you really want to do what you say then
> > that is the solution.
> >
> > iptables -I PREROUTING -t nat -s 192.168.1.0/24 -d 192.168.10.10 -p tcp
> > --dport 80 -j DROP
> >
> > Note the -I which inserts the rule before the prerouting rule you listed
> > above.
>
> Thanks.
>
> > however in this case if you really want to do what you say then that is
> > the solution.
>
> Is there another and better way to redirect traffic to the inside ?

Well, DNAT is normally used to map externally-accessible public IPs to real 
internal systems on non-routable 10.x.y.z, 172.16.a.b or 192.168.c.d 
addresses, therefore the problem never arises (since people across the 
Internet can't send packets to the real private addresses even if they knew 
what they were).

There's isn't a "better" way to redirect traffic to other IP addresses, 
however why do you think it's a problem for people to use the "real" address 
instead of the one you're telling them to use.   They have access to the 
machine, so why does it really matter which address they use to connect to 
it?

Regards,

Antony.

-- 
RTFM may be the appropriate reply, but please specify exactly which FM to R.

                                                     Please reply to the list;
                                                           please don't CC me.


