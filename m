From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: forwarding traffic to different hosts
Date: Thu, 26 Aug 2004 20:21:00 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512F0@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> Hi,
>
> Sorry, another question, things aren't working well for me tonight.  =
If
> I want traffic to port 777 on a host to be redirected to another host =
on
> the same LAN, will this do the job?
>
> I'm on host 198.81.129.100, and I want all traffic from IP address
> 207.155.252.12 to port 777 to be redirected to a different host, .101 =
on
> the same network, if I try this rule it fails:
>
> iptables -t nat -I PREROUTING --source 207.155.252.12 -p tcp --dport =
777
> -j DNAT --to-destination 198.81.129.101
>
> But I don't see anything in the logs.  I tried permitting all traffic =
to
> port 777 in for FORWARD and OUTPUT tables, but that didn't make a
> difference.
>
> Any ideas?

  iptables -t nat -I POSTROUTING -p tcp --dport 777 -s 207.155.252.12 \
    -d 198.81.129.101 -j SNAT --to-source 198.81.129.100

-j

