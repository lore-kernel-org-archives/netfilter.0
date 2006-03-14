From: "Randy Grimshaw" <rgrimsha@syr.edu>
Subject: Re: Case concerning iptables filtering traffic from the
	internet in a NATed scenario
Date: Tue, 14 Mar 2006 10:54:38 -0500
Message-ID: <s416a0fa.012@gwia201.syr.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org, mattes.opel@web.de




<><Randall Grimshaw
Room 203 Machinery Hall
Syracuse University
Syracuse, NY   13244
315-443-5779
rgrimsha@syr.edu

>>> Mattes Opel <mattes.opel@web.de> 3/14/2006 10:48:05 AM >>>

>I can't access internet-hosts from machine a), because packets for =
this=20
>purpose are destinated to registered IP-Numbers. They are rejected by=20
>the output chain, because they doesn't contain the routers internal IP=20
>as destination. Access to the three hosts on local subnet works fine.

You don't have any FORWARD rules, where the acl logic would likely reside.

<><Randy


