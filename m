From: <bmcdowell@coxhealthplans.com>
Subject: RE: could someone translate these rules inot plain english
Date: Thu, 22 Jan 2004 10:18:35 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A3B4AA360FDEF448F3390421FC8D731014BE84E@coxhpexg.coxhp.com>
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
To: technical@sojourn.dyndns.org, netfilter@lists.netfilter.org


I often do it just to be thorough...  I'm only human after all.


Bob

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Technical
Sent: Thursday, January 22, 2004 4:48 AM
To: netfilter@lists.netfilter.org
Subject: Re: could someone translate these rules inot plain english


> Technical wrote:
>> -A RH-Firewall-1-INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> For this chain (presumably packets inbound to the network), accept any
> packets that are part of established TCP connections (ie: a SYN packet
> for the connection has gone out from the network), or related to UDP
> packets that have gone out through the firewall.
>
>> -A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited
>
> Otherwise, reject the packet by sending back an ICMP message telling =
the
> remote host that communication with its intended target is
> administratively prohibited.
>
>
> HTH
> Alex Satrapa
>
>


If the default is that iptables to reject all packets that cannot not be
deall with any of the previous rules, why would somemone use the last
rule??  am I missing something??

