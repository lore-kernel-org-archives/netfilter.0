From: "Samuel Jean" <sjean@cookinglinux.org>
Subject: RE: Is it possible to
Date: Wed, 9 Jun 2004 14:29:19 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <33325.207.236.167.50.1086805759.squirrel@207.236.167.50>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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


<adsnat@yahoo.com> wrote:
>Hi,
>I have a Linux 9.0 server with iptables firewall.

Where did you get it?! I'm running that 'old' Linux 2.6.6 :-)

>It ditributes Internet bandwidth to 5 clients. I can
>monitor all 5 clients with the Firewall properly.  one
>of the clients becomes server for another network and
>start distributing Internet bandwidth further to that
>network.

Is it NAT'ing or just forwarding other subnet's packets ?

>I want to stop that client to distribute bandwidth
>further. With Iptables OR any other technology is it
>possible to do so?
>Thanks for support.

Well, sure it is possible with iptables.

In the case where the second server is only forwarding packets (like
a router does), you could setup a rule like that:

$rejected_subnet is the subnet you don't want to provide bandwith to.
(ex: rejected_subnet=3D192.168.1.0/24)

iptables -I FORWARD -s $rejected_subnet -j DROP

Then, all traffic coming from that subnet will be dropped.

Case 2) That server is masquerading (NAT) outbound traffic.

Then, in my knowledge, it's impossible to distinguish effectivily
NAT'ed packet from a real source one. (Sorry, if i'm wrong.)

A not reliable work-around consist of analyzing the Time To Live (TTL)
of packets coming from the $rejected_subnet. Once you find a difference
between 'bad ones' and 'good ones', setup a rule with the TTL extension.

For analyzing, you could start with:

iptables -I FORWARD -s $second_server_ip -j LOG --log-prefix "Analyzing
TTL:  "

After a few days, look in syslog.

$ cat /var/log/syslog | grep "Analyzing TTL: "

Look for the lowest TTL...

Then, do as follow.

ex: Good TTL -> 255
    Bad TTL -> 254
    Second server IP -> 192.168.0.10

iptables -I FORWARD -s 192.168.0.10 -m ttl --ttl-eq 254 -j DROP

But as you may expect, yes, there is a way to change the TTL before the
packet goes out. So, that setup isn't good anymore if that server changed
it. Possibly done by -j TTL available in the mangle table.

Good luck,

--=20
Samuel Jean
SysAdmin & NetAdmin
at cookinglinux.org


