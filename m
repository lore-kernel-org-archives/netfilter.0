From: "Travis Crook" <travis@visionsbeyond.com>
Subject: Re: Email troubles behind iptables firewall
Date: Tue, 17 Sep 2002 11:10:35 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006c01c25e6d$230d0fe0$6902a8c0@visionsbeyond.mindtrip>
References: <002c01c25a68$fde16160$6902a8c0@visionsbeyond.mindtrip> <200209121558.g8CFwXv10419@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

> Is this correct?  Is there any way to pass their real ip
> > address through the firewall to the mail server?
>
> Change the SNAT / MASQUERADE rule in your POSTROUTING chain so that it
only
> applies to the external interface.
>
> eg change:
>
> iptables -A POSTROUTING -t nat -j SNAT --to a.b.c.d
>
> to
>
> iptables -A POSTROUTING -t nat -o eth0 -j SNAT --to a.b.c.d
>
> where eth0 is your external interface.
>
> Antony.


Oh great ones of the iptables mastery!  You have solved my problem!
I thank you ever so much.

Travis Crook
Visions Beyond


