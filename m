From: Greg Cope <gregcope@gmail.com>
Subject: Re: How to make a mutli-homed host use one IP for a NAT'ed host
Date: Thu, 21 Apr 2005 16:12:06 +0100
Message-ID: <c0e9781f05042108122c7b02c3@mail.gmail.com>
References: <c0e9781f0504202352240208e4@mail.gmail.com>
	<426753A3.7030800@riverviewtech.net>
	<c0e9781f05042102544437b319@mail.gmail.com>
	<c0e9781f0504210718566c4025@mail.gmail.com>
	<4267BE69.6080203@riverviewtech.net>
Reply-To: Greg Cope <gregcope@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4267BE69.6080203@riverviewtech.net>
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
To: Taylor Grant <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

> Sorry, my mistake.  It was late at night after a long day.  :(

Many Thanks Grant.

No need to appologies - and your up already!

So I swapped to eth1 - and it would appear that packets are getting
marked as if I add in the ip route add command I can no longer connect
to an SMTP server from the mailserver (using telnet HOST 25)

So the last few hurdles...

I need to use the same router - an ADSL thing as everything else, I
just want the packets to be sent from a different $MAIL_INET_ALIAS IP
(as opposed to the usual INET_IP

$ ip rule add fwmark $SMTP_MARK table $IPROUTE2_SMTP_TABLE

Works fine and makes sense.

However I think these are the sticking points:

ip route add table $IPROUTE2_SMTP_TABLE dev $INET_IFACE src $MAIL_INET_ALIA=
S
ip route add table $IPROUTE2_SMTP_TABLE default via $INET_IP

I get=20

$ ip route add table smtp.out dev eth0 src 217.154.55.250
$ ip route add table smtp.out default via 217.154.55.241
RTNETLINK answers: File exists


.241 is my internet gateway router, not the default external IP of my
firewall which is eth0=3D217.154.55.249. eth0:1=3D217.154.55.250 which is
the $MAIL_INET_ALIAS

Combinations of either of the above mean the mail server cannot
connect to an exteriror mail server.

Hum....

Greg

