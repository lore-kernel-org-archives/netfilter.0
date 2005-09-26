From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Confirm: letting certain packages pass through un-natted
Date: Mon, 26 Sep 2005 09:51:25 +0200 (CEST)
Message-ID: <51347.193.173.147.3.1127721085.squirrel@193.173.147.3>
References: <4337A526.3@canada.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4337A526.3@canada.com>
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

> Could somebody please confirm whether or not I'm doing this right?
>
> I am using, in my nat table:
>
> -A PREROUTING -s 192.168.0.0/16 -d 192.168.1.1 -j ACCEPT
>
> Shouldn't all packets, including ICMP packets, get passed through to
> 192.168.1.1 if originating from the local network?

IMO only if there's no rule on top of this one that does NAT.
Is there ? In that case this rule will never be reached.

What do the byte counters for this rule say when you execute :
iptables -nvL PREROUTING

> BTW, I'm not sure why I can communicate with the 192.168.2 subnet, but
> not my 192.168.1 subnet... Only the machine directly connected to
> 192.168.1.1 is able to communicate with it...
>
> My routing table looks like this:
>
> bla bla bla
> 192.168.1.0   *    255.255.255.0    U   0   0   0   eth0
> bla bla bla
>
> which seems correct.

Did you tcpdump anything to see what's going on ?
Not having your complete routing table and ruleset it's hard to tell if
everything is setup correctly.


Gr,
Rob



