From: "Willem Oldeman" <willem@king-pin.nl>
Subject: Re: Problem Regarding Forwarding
Date: Fri, 7 Mar 2003 00:35:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004c01c2e439$050270b0$0301a8c0@hotpop3>
References: <20030302210529.74972.qmail@web8206.mail.in.yahoo.com>
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
To: honey grp <honeypict@yahoo.co.in>, netfilter@lists.samba.org

It seems you're making things very hard for yourself this way.
Why would you want CompB and CompC to have the same IP address?
Things will be so much easier when you give them different IP's, then you
could use the simplest of forwarding rules.

Life is supposed to be easy: It should be like a stroll in the park on a
sunny day :-)

Regards,
Willem

----- Original Message -----
From: "honey grp" <honeypict@yahoo.co.in>
To: <netfilter@lists.samba.org>
Sent: Sunday, March 02, 2003 10:05 PM
Subject: Problem Regarding Forwarding


>
> Hi,
>
> I have my network setup as
>
>                                eth1-----------COMP B
>
> Comp A ------eth0----Gateway---|
>
>                                eth2------------COMP C
>
> I want to  forward the traffic from CompA to both CompB as well as CompC.
The problem is I want to keep same IP address for Both Comp B and Comp C. (I
know there will be conflict but I am keeping CompB OFF when CompC is ON and
vice versa).
>
> Now, how should I write iptable rules so that traffic will be forwarded to
both eth1 as well as eth2 so that the host that is ON will respond
>
> Thanking you,
>
> Regards,
>
> Honeypict group


