From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Masquarede stalls?
Date: Tue, 10 Aug 2004 14:33:23 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051263@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Meszaros Gergely <monk@geotronic.hu>, netfilter@lists.netfilter.org

> Hi!
>
> Are there any issues about netfilter in kernel 2.4.25 ?
>
> I tried to make a masquerading setup, but all connections from the =
internal network what is larger than a minimal size are stalls, and just =
waits waits waits...
>
> What can it be?
>
> My ultra-simplified ipfilter (for debugging purpose) is:
>
>       iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
>       iptables -A FORWARD -j ACCEPT
>
>
> . I have a simple two-network-card-gateway server and 192.168.* =
internal net setup.
> . from the server everything is perfect.
> . from the internal net, one can ping everything correctly (masquerade =
is working, just buggy)
> . from the internal net every connection initialised correctly, =
however
>       large enough (larger than 1 packet?) data is buggy and stalls.
>
> So, i can reach very short homepages, and can ping from the int net =
but
> everything else will stall.

those symptoms point to an MTU issue.  the way to check this would be to =
tcpdump on the outside interface of your firewall for ICMP unreachable =
messages (tcpdump -n -nn -p -i ppp0 icmp)...look for something along the =
lines of "need to frag, but DF bit is set"  if you see that, you need to =
lower the MTU/MSS of your clients, either directly on the clients or =
with some mangling on the firewall.

-j

