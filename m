From: "Mathias Sundman" <Mathias.Sundman@sungard.se>
Subject: Match DF ( =?iso-8859-1?Q?Don=B4t_Fragment=29_bit?=
Date: Wed, 23 Apr 2003 17:24:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF0AE04567.652B900B-ONC1256D11.0042E920@guardianit.se>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

I=B4m using vtun to create an encrypted ethernet bridge.

My setup is like this:
LocalNet1 - BRIDGE1 - Internet - BRIDGE2 - LocalNet2

where BRIDGE1 and BRIDGE2 is linux mashines that bridge
between one physical interface and a tap device created
by vtun.

This works great, however there is a problem with the MTU.

If a mashine on LocalNet1 sends full size packets (1500b)
to a mashine on LocalNet2, it will exceed 1500 bytes
when it=B4s encrypted and sent over the internet. These packets
will then be fragmented. This is fine as long as the fragments
gets through...

However, this is not always the case. Therefor I=B4ve tried to
find a way to make the mashines understand that they can=B4t
use that big packets when talking to mashines on the other side
of the bridge.

So I made a quick hack in netfilter/iptables which enabled me
to return ICMP "dest-unreachable, fragementation needed but
DF flag set" packets when a to large packet arrives.

That seemed to do the trick, but I=B4d like to do this only if the
original packet had the DF flag set, so my question is, is it
possible to check whether the DF flag is set or not?

(Please CC me on replies)

Regards
Mathias Sundman
=



