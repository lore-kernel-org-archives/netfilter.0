From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: How to make a mutli-homed host use one IP for a NAT'ed host
Date: Thu, 21 Apr 2005 13:13:20 -0500
Message-ID: <4267ED40.6040803@riverviewtech.net>
References: <c0e9781f0504202352240208e4@mail.gmail.com>	<426753A3.7030800@riverviewtech.net>	<c0e9781f05042102544437b319@mail.gmail.com>	<c0e9781f0504210718566c4025@mail.gmail.com>	<4267BE69.6080203@riverviewtech.net>
	<c0e9781f05042108122c7b02c3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <c0e9781f05042108122c7b02c3@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Greg Cope <gregcope@gmail.com>
Cc: netfilter@lists.netfilter.org

> No need to appologies - and your up already!

Heh, ya the glorious life of a computer consultant. :)

> So I swapped to eth1 - and it would appear that packets are getting
> marked...

*nod*

> So the last few hurdles...
> 
> I need to use the same router - an ADSL thing as everything else, I
> just want the packets to be sent from a different $MAIL_INET_ALIAS IP
> (as opposed to the usual INET_IP

This makes perfect sense to me and is what I understood you to be wanting.  Now to just get the syntax correct so that it does work.

> However I think these are the sticking points:
> 
> ip route add table $IPROUTE2_SMTP_TABLE dev $INET_IFACE src $MAIL_INET_ALIAS
> ip route add table $IPROUTE2_SMTP_TABLE default via $INET_IP
> 
> I get 
> 
> $ ip route add table smtp.out dev eth0 src 217.154.55.250
> $ ip route add table smtp.out default via 217.154.55.241
> RTNETLINK answers: File exists

You may need to change your device entire in the above rule to be eth0:1 not eth0.  Some testing should tell you this for sure.

> .241 is my internet gateway router, not the default external IP of my
> firewall which is eth0=217.154.55.249. eth0:1=217.154.55.250 which is
> the $MAIL_INET_ALIAS
> 
> Combinations of either of the above mean the mail server cannot
> connect to an exteriror mail server.

Hmm, would it be possible for me to see the full output of your ip route tables and rules prior to what we have done here?  I'd also like to see the output of your iptables rules for the filter, nat, and mangle tables.  This way I can look at the entire picture and hopefully give you the correct info with out having to work with pieces of the information.



Grant. . . .

