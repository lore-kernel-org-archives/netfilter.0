From: "Daniel Nogradi" <nogradi@gmail.com>
Subject: Re: updated iptables doesn't work with old rules
Date: Wed, 22 Feb 2006 15:13:55 -0800
Message-ID: <5f56302b0602221513i22ff868et991067e3314998da@mail.gmail.com>
References: <5f56302b0602220158k76b68705p88dd35b4c2782caa@mail.gmail.com>
	<54666.193.173.147.3.1140606085.squirrel@webmail.sterenborg.info>
	<5f56302b0602220325p1c66f156y47e8ad569ee7fffb@mail.gmail.com>
	<56310.193.173.147.3.1140611713.squirrel@webmail.sterenborg.info>
	<5f56302b0602220539t2ec885acwda00f0f2eb521854@mail.gmail.com>
	<5f56302b0602221253t7157857ejb15f87d9984da59c@mail.gmail.com>
	<43FCCF82.6010402@certicom.com>
	<5f56302b0602221357k27931798n7d521184123bb1c9@mail.gmail.com>
	<43FCE338.4090306@certicom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43FCE338.4090306@certicom.com>
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

> sufficient to use the MASQUERADE rule, no FORWARD rule needed. If MASQUER=
ADE
> isn't working, you can also try the SNAT rule.
>
> To see how your packets are going through iptables, you can turn on some
> logging:
>
> iptables -A PREROUTING -t nat --in-interface eth1 -j LOG --log-prefix "na=
t:
> "
> iptables -A FORWARD --in-interface eth1 -j LOG --log-prefix "out-fwd: "
>
> and so on.
>
> These logs are kernel messages, so if kernel logs aren't enabled, you can
> edit
> the /etc/syslog.conf file and restart syslogd. For example:
>
> kern.*                /var/log/messages
>
>
> Just a thought, how is your machine B resolving DNS? I'm assuming that
> machine A
> gets its networking values including DNS from the modem. Is it communicat=
ing
> this to machine B? Maybe it's a DNS issue. For example, are you testing b=
y
> pinging "google.com" or directly via an IP address?
>


Hi Chinh, on machine B DNS resolution doesn't work at all because the
name servers are on the internet which it can not access. So I'm not
pinging google.com but the IP addresses.

I've turned on logging and when I try to ssh, ping, etc, from B to A
then I get these messages on both B and in the logs of A:

kernel: nat: IN=3Deth1 OUT=3D MAC=3D(mac address of eth1) SRC=3D(IP of mach=
ine
B) DEST=3D213.191.74.18 LEN=3D54 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ..........=
..
kernel: out: IN=3Deth1 OUT=3Dppp0 SRC=3D(IP of machine B) DEST=3D213.191.74=
.18
 ...........

What does this supposed to mean? :)

