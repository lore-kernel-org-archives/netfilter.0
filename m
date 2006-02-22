From: Chinh Nguyen <cnguyen@certicom.com>
Subject: Re: updated iptables doesn't work with old rules
Date: Wed, 22 Feb 2006 17:18:32 -0500
Message-ID: <43FCE338.4090306@certicom.com>
References: <5f56302b0602220158k76b68705p88dd35b4c2782caa@mail.gmail.com>	<54666.193.173.147.3.1140606085.squirrel@webmail.sterenborg.info>	<5f56302b0602220325p1c66f156y47e8ad569ee7fffb@mail.gmail.com>	<56310.193.173.147.3.1140611713.squirrel@webmail.sterenborg.info>	<5f56302b0602220539t2ec885acwda00f0f2eb521854@mail.gmail.com>	<5f56302b0602221253t7157857ejb15f87d9984da59c@mail.gmail.com>	<43FCCF82.6010402@certicom.com>
	<5f56302b0602221357k27931798n7d521184123bb1c9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5f56302b0602221357k27931798n7d521184123bb1c9@mail.gmail.com>
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
To: Daniel Nogradi <nogradi@gmail.com>
Cc: netfilter@lists.netfilter.org

Daniel Nogradi wrote:
> 
> Hi Chinh, I tried interchanging eth0 and eth1 and still no luck. I
> didn't want to restrict the source yet, because I first would like to
> see that it works at all, and then start tightening security.
> /var/log/messages also says nothing. Is there any other log file which
> would be useful to check?
>

I just did a quick test. With ip_forwarding on and no restrictions, it is
sufficient to use the MASQUERADE rule, no FORWARD rule needed. If MASQUERADE
isn't working, you can also try the SNAT rule.

To see how your packets are going through iptables, you can turn on some logging:

iptables -A PREROUTING -t nat --in-interface eth1 -j LOG --log-prefix "nat: "
iptables -A FORWARD --in-interface eth1 -j LOG --log-prefix "out-fwd: "

and so on.

These logs are kernel messages, so if kernel logs aren't enabled, you can edit
the /etc/syslog.conf file and restart syslogd. For example:

kern.*                /var/log/messages


Just a thought, how is your machine B resolving DNS? I'm assuming that machine A
gets its networking values including DNS from the modem. Is it communicating
this to machine B? Maybe it's a DNS issue. For example, are you testing by
pinging "google.com" or directly via an IP address?

Regards,

Chinh

