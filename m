From: Marek Zachara <marek.zachara@conexe.pl>
Subject: Re: NAT/POSTROUTING rules doesn't match packets (SOLVED?)
Date: Fri, 7 Oct 2005 21:59:16 +0200
Message-ID: <200510072159.16784.marek.zachara@conexe.pl>
References: <20051004070925.7E2783C65565@mailgate.informatik.haw-hamburg.de>
	<200510072133.37280.marek.zachara@conexe.pl>
	<200510072144.57493.marek.zachara@conexe.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510072144.57493.marek.zachara@conexe.pl>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Friday 07 of October 2005 21:44, Marek Zachara wrote:
> > so before step (3) any packets destined to internet shall be returned
> > with 'destination unreachable'. But i don't know if this could create the
> > contrack entry. the IAX udp packets are being sent all the time, even
> > before the router boots up - so its very likely such packet may hit the
> > router before netfilter (and SNAT) is configured.
> > But from what i understand, the UDP NAT shall refresh every 180 seconds
> > (?) so after 3 minutes the packets shall be nat-ed correctly. But maybe
> > if there is a constant flow of packets it can sustain the contrack entry?
> > But
>
> Bingo :)
>
> I'll answer myself: YES
>
> I have shut down the asterisk for a few minutes to let the router contrack
> clean the entry and then started it up again. Now the connection is NAT-ed
> correctly.
> But this basically means the UDP entry is not 'refreshed' every 180 sec.
> right? Is this a bug or a 'feature'? :)
>
> Marek

As a workaround, is there a way to manually clean up conntrack table - i'd put 
it in the boot scripts to assure such problems doesn't happen again. I know i 
can put a iptable rule to block all incoming UDP traffic for 3 minutes after 
boot-up (so the entries get cleaned), but this makes the router useless for 
these 3 minutes ...

Marek

