From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: netfilter bypassed by nessus using UDP packets with
	source	port 53
Date: Fri, 01 Apr 2005 15:24:58 +0200
Message-ID: <1112361898.5640.14.camel@anduril.intranet.cartel-securite.net>
References: <424ABB78.6060105@aquitaine.cci.fr>
	<1112275621.5624.35.camel@anduril.intranet.cartel-securite.net>
	<424CF137.6050905@aquitaine.cci.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <424CF137.6050905@aquitaine.cci.fr>
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
Content-Type: text/plain; charset="iso-8859-1"
To: grumpy <mathieu.delaplace@aquitaine.cci.fr>
Cc: netfilter@lists.netfilter.org

Le vendredi 01 avril 2005 =E0 08:59 +0200, grumpy a =E9crit :
> > Have you checked if this alert is true, and not some false positive ?
> You are right, I do not know how to check this

You could just hping your box on a port you would listen with netcat and
see if data you send it received.

> In that case nessus would think the packets it sent to port 1-65635
> (except 22 and 3000) went through as well. Wouldn't it ?

Not for TCP. Because TCP normal behaviour for a closed port is to send a
RST/ACK. As you send an ICMP port unreachable, Nessus detects port is in
fact filtered.

> nessus told me something like that :
> "the remote host does not discard TCP SYN packet which have FIN flag
> set. This can allow an attacker to defeat your firewall rules set"

Notice the "can". There has been packet filters that got fooled by
SYN/FIN packets, because they didn't see them as SYN packets, although
destination host did. That's not the case with Linux.

> According to you, this is a false positive

I think so.

> Since, it is impossible to prevent somebody to get the timestamp (if I
> am not mistaken), I think I will try this :)

You can try this (I think it's a better way to filter you stuff) and
still block timestamp in TCP packets :)

	# echo 0 > /proc/sys/net/ipv4/tcp_timestamps


PS : just beware a typo in my previous post (forgot the ACCEPT target
     for pings)
	-A INPUT -i eth0 -p icmp -m icmp --icmp-type 8 -j ACCEPT

--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

