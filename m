From: Tony Earnshaw <tonye@billy.demon.nl>
Subject: Re: limiting number of concurrent tcp sessions
Date: Mon, 22 Mar 2004 16:44:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079970285.19134.53.camel@localhost>
References: <20040322125944.GA9496@oasis.frogfoot.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040322125944.GA9496@oasis.frogfoot.net>
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
To: Netfilter Discussions <netfilter@lists.netfilter.org>

man, 22.03.2004 kl. 13.59 skrev Abraham van der Merwe:

> Is there a way to limit the number of concurrent tcp sessions per host/ip
> flowing through a machine in Linux?
> 
> There used to be a match for iptables which seems like it may be able to do
> the job, but it doesn't seem to exist anymore:
> 
> ------------< snip <------< snip <------< snip <------------
> iplimit v1.2.8 options:
> [!] --iplimit-above n           match if the number of existing tcp
> connections is (not) above n
>  --iplimit-mask n               group hosts using mask
> ------------< snip <------< snip <------< snip <------------

This is half an answer ;) I've kernel-org 2.6.4 ACPI on this machine,
Netfilter 1.2.9 and the required POM. This is thus a new Netfilter
installation. The HOWTO describes iplimit, but for my installation there
was no such thing. I found out that if one substitutes the word
"connlimit" for "iplimit", then everything written about iplimit applies
to connlimit.

The bad news is, that what I'm trying doesn't work for me :(

I have a rule:

iptables -A INPUT -i $IFACE0 -s 194.159.xx.xx -p tcp --syn --dport smtp
-m connlimit --connlimit-above 1 -j LOG --log-prefix "fp=2nd Mailkick:1
a=REJECT "
iptables -A INPUT -i $IFACE0 -s 194.159.73.24 -p tcp --syn --dport smtp
-m connlimit --connlimit-above 1 -j REJECT

(xx.xx for a bit of anonymity, the funny fp and a LOG prefixes are for
my Fireparse reporter).

However, the rule doesn't work, or connlimit doesn't work, for some
reason.

lsmod:

ipt_connlimit           3200  2
ipt_LOG                 5440  12
ipt_state               1856  72
ipt_REJECT              6656  14
ipt_limit               2240  1
iptable_filter          2752  1
ip_tables              17808  6
ipt_connlimit,ipt_LOG,ipt_state,ipt_REJECT,ipt_limit,iptable_filter

-rwxr-xr-x    1 root     root         4173 mar 17 21:56
/usr/local/lib/iptables/libipt_connlimit.so

So I guess my question would be: Why?

Best,

--Tonny

-- 

mail: billy - at - billy.demon.nl
http://www.billy.demon.nl


