From: Marek Zachara <marek.zachara@conexe.pl>
Subject: Re: NAT/POSTROUTING rules doesn't match packets
Date: Tue, 4 Oct 2005 21:24:34 +0200
Message-ID: <200510042124.34573.marek.zachara@conexe.pl>
References: <20051004112502.8B5133C65565@mailgate.informatik.haw-hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051004112502.8B5133C65565@mailgate.informatik.haw-hamburg.de>
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

On Tuesday 04 of October 2005 13:25, bernin_a@informatik.haw-hamburg.de wrote:
> > Just to make sure, i have compiled kernel 2.4.31 and also switched back
> > to
> >
> > 1.2.11 iptables. But nothing changed. Still the packets don't get SNAT-ed
> > and
> > there has been no hit on SNAT rule for about an hour (packets are sent
> > ever y ten seconds or so). This only applies to UDP packets.
> >
> > Now i have noticed the same problem on another of my machines. Since its
> > not only me having problems, maybe its some well-hidden bug in the
> > netfilter?
>
> If so, it has been there for quite a while. I am using kernel 2.4.27 (with
> grsecurity patches)... It seems there is only a problem with UDP here,
> too... Are your machines under heavy load ? We have a constant rate of at
> least 5 mbit running over this machines...they are not very busy, though.
>
no, there is no heavy load - 2Mb max - its my local router at home connected 
to small community network.

Since there is no obvious solution, I have reported this as bug to netfilter 
bugzilla. We'll see what they say.

Marek

