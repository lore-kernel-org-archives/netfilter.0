From: <bmcdowell@coxhealthplans.com>
Subject: RE: Range of IP's with Exclusions
Date: Wed, 12 Nov 2003 17:05:40 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A3B4AA360FDEF448F3390421FC8D731011316BC@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org


Is there no reason to be wary of the 'ACCEPT' statement?  I did read =
this in the tutorial (I think), but isn't ACCEPT a terminating action?

Sorry to be a pest.

Bob

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
Sent: Wednesday, November 12, 2003 4:47 PM
To: netfilter@lists.netfilter.org
Subject: Re: Range of IP's with Exclusions


On Wednesday 12 November 2003 10:31 pm, bmcdowell@coxhealthplans.com =
wrote:

> iptables -t NAT -A PREROUTING -d 10.22.1.3 -j DNAT --to 10.22.2.2
> iptables -t NAT -A PREROUTING -d 10.22.1.4 -j DNAT --to 10.22.2.2
> iptables -t NAT -A PREROUTING -d 10.22.1.5 -j DNAT --to 10.22.2.2
> iptables -t NAT -A PREROUTING -d 10.22.1.6 -j DNAT --to 10.22.2.2
> (etc.)
>
> ...but that is a bit of a pain.
>
> I keep trying to type in something like:
>
> iptables -t NAT -A PREROUTING -d 10.22.1.0/24,! 10.22.1.1 -j DNAT
> --to 10.22.2.2
>
> ...but iptables complains.

Try these two rules, in this order:

iptables -t NAT -A PREROUTING -d 10.22.1.1 -j ACCEPT
iptables -t NAT -A PREROUTING -d 10.22.1.0/24 -j DNAT --to 10.22.2.2

The first will match the address you don't want to DNAT, and only other=20
addresses will match the second rule.

Antony.

--=20

If builders built buildings the way programmers write programs,
then the first woodpecker that came along would destroy civilisation.
                                                     Please reply to the =
list;
                                                           please don't =
CC me.

