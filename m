From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: FORWARD not working
Date: Sat, 15 Feb 2003 21:32:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302152132.06432.netfilter@newkirk.us>
References: <000801c2d555$61c7dda0$0a0110ac@nebuchadnezza>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000801c2d555$61c7dda0$0a0110ac@nebuchadnezza>
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
To: Tim <twr@bellsouth.net>, iptables-list <netfilter@lists.samba.org>

On Saturday 15 February 2003 07:50 pm, Tim wrote:
> ppl,
>
> I rebuilt my box and can't seem to FORWARD anything. The same rules
> that were working with the old box into the new box and its not
> working. Did I miss anything.
>
> Cannot traverse the chains...I ran the command lsmod to check to make
> sure the modules where loading correctly and did notice something that
> was not there in my old box. ppp_syntty, ppp_async, ppp_generic and
> slhc which states it is a generic ppp along with jbd which I never
> noticed before.
>
> I anyone can point me to any reason or documentation why this is so, I
> would gratefully appreciate it.
>
> Thanks
> Tim

1- Try "cat /proc/sys/net/ipv4/ip_forward" and see what it says.  If it's=
=20
a '0' (zero), then you need to "echo 1 >/proc/sys/net/ipv4/ip_forward"=20
to enable forwarding.

2- Ensure that the interfaces are the same as on the old box, IE if eth0=20
was internal network on the old box, then double-check that it's the=20
same on the new box.  If not, you can either change your rules to=20
reflect the difference, or change what cable is plugged into which NIC.

3- Check "/sbin/iptables -v -n -L" and "/sbin/iptables -v -n -L nat" and=20
see if ANY rules, or chain policies (especially nat-PREROUTING, earliest=20
hit of those listed) reports any packets.

4- If the first two aren't the problem, then:  If the third shows NO=20
traffic at all, your problem isn't iptables.  If the third shows=20
traffic, try to see what rules and what chains the traffic is appearing=20
in, and make sense of it.  Try inserting "-j LOG" rules as first in each=20
chain for a minute or two and check the logs to track packet traversals.

5- Also confirm whether the firewall box itself is able to communicate in=
=20
each direction.  At the minimum, you should ping a machine out each=20
interface.   Set INPUT and OUTPUT chains to ACCEPT policy and no rules=20
if necessary, but try to narrow down where the problem really exists.

6- Check "ip route" and "ifconfig" and ensure your interfaces are all up,=
=20
and you have appropriate routes.  Routes should look something like=20
this: (eth0 is the interface ppp0 subsumes, eth1 is LAN)

10.10.21.1 dev ppp0  proto kernel  scope link  src 141.150.238.220=20
192.168.0.0/16 dev eth1  scope link=20
127.0.0.0/8 dev lo  scope link=20
default via 10.10.21.1 dev ppp0=20

6- If all this turns up no answer, then post with a bit more detail, such=
=20
as what distribution you were/are running, what version, what kernel,=20
and what version of iptables you were/are running. =20

j


