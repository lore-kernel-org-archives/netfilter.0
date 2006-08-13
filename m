From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: Preventing DoS attacks using iptables?
Date: Sun, 13 Aug 2006 11:40:25 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C49C87@knowledge.wizdom.nu>
References: <20060812170739.39960.qmail@web56203.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060812170739.39960.qmail@web56203.mail.re3.yahoo.com>
Content-class: urn:content-classes:message
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
To: Elvir Kuric <omasnjak@yahoo.com>, netfilter@lists.netfilter.org

The answer is very simple:

You can not.......

DdoS attacks fill your pipe. Nothing iptables can do about that.
And preventing? How would you prevent a script kiddie sending the ddos
command to 1.000.000 of his bots?

The only way to block DdoS attacks is to do it upstream, where the pipe
is bigger than the attack.....

Syn cookies etc can help to keep your system stable during an attack,
but it will not be functional, as it cannot send or receive regular
traffic.

-Sietse

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Elvir Kuric
Sent: Saturday, August 12, 2006 7:08 PM
To: netfilter@lists.netfilter.org
Subject: Preventing DoS attacks using iptables?=20

Hi all,=20

I have just one question related to preventing DoS
attack using iptables. I know there is possible limit
of receiving packets causef by DoS attacks using --m
limit --limit 1/s and on that way pushing firewall to
accept just on packet per second. But in some cases
the kernel will accept that packets and we can reject
theu putting 1 in /proc/sys/net/ipv4# cat
tcp_syncookies....According to
=20
http://cr.yp.to/syncookies.html

where they say that this method is stil experimenting
I am asking you what is your experineces related to
oreventing DoS attacks this way.

Thanks=20

Regards=20

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around=20
http://mail.yahoo.com=20


