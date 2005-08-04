From: Patrick Nelson <pnelson@neatech.com>
Subject: Re: IP forwarding
Date: Thu, 04 Aug 2005 09:22:38 -0700
Message-ID: <42F240CE.804@neatech.com>
References: <286cf082050803183749d1f514@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <286cf082050803183749d1f514@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Ricardo J. M=E9ndez wrote:

>Hi,
>
>I've got a network setup where the internal router is a Linux box
>running iptables.  External interface is eth0, internal eth1.  I'm
>attempting to forward an external IP address (say, 1.2.3.4) to an
>internal machine.
>
>The rule I added is:
>
>iptables -t nat -A PREROUTING -d 1.2.3.4 -p tcp --dport 80 -j DNAT
>--to 192.168.1.202
>
>However, attempting to=20
>
>telnet 1.2.3.4 80
>
>does not work.  It's clear that the rule is being applied, because the
>web server running on the external machine is not responding unless I
>telnet from the router itself, but unfortunately I'm not getting into
>192.168.1.202 either.  Attempting to
>
>telnet 192.168.1.202 80
>
>does work as expected.
>
>What am I missing?  Any pointers are welcome.  Thanks,
>
>
>
>Ricardo J. M=E9ndez
>http://ricardo.strangevistas.net/
>
> =20
>
Whats the Gateway set to on 192.168.1.202 80?

