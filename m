From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: forwarding
Date: Tue, 18 May 2004 15:22:00 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084908120.7272.69.camel@localhost>
References: <33934.200.44.170.105.1084890127.squirrel@200.44.170.105>
	 <1084891180.6410.18.camel@localhost>
	 <34012.200.44.170.105.1084892235.squirrel@200.44.170.105>
	 <1084892325.6417.40.camel@localhost>
	 <34103.200.44.170.105.1084893176.squirrel@200.44.170.105>
	 <1084895498.7289.7.camel@localhost>
	 <34404.200.44.170.105.1084898303.squirrel@200.44.170.105>
	 <1084899777.7261.17.camel@localhost>
	 <4290.192.168.74.21.1084904497.squirrel@192.168.74.21>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4290.192.168.74.21.1084904497.squirrel@192.168.74.21>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: alucard@kanux.com
Cc: netfilter@lists.netfilter.org

On Tue, 2004-05-18 at 14:21, alucard@kanux.com wrote:
> > OK - it's good to simplify :-)
> > You should not need to INPUT rule for 8080.
> I=C2=B4t=C2=B4s commented, it=C2=B4s an old rule for something I used to =
have in that server
>=20
> > The delay in finding the default route is route's attempt at reverse
> > name resolution.  Use route -n instead.
>=20
> Indeed, this is what I get in server2
>=20
> --------
> [root@linserv root]# route -n
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use I=
face
> 192.168.0.0     0.0.0.0         255.255.255.0   U     0      0        0 e=
th0
> 127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 l=
o
> 0.0.0.0         192.168.0.1     0.0.0.0         UG    0      0        0 e=
th0
> --------
>=20
> > Our next step is to trace.  From what address are you attempting to
> > telnet and where does that address live?
>=20
> I=C2=B4m using a completly different address to try to access the server =
from
> the outside, to be more specific, I'm doing this at work and I'm using th=
e
> computers in my house to do this test and nothing happens. If I telnet
> port 80 server2 directly from server1 I get this -to make sure it's
> working-:
>=20
> --------
> root@mail:~# telnet 192.168.0.2 80
> Trying 192.168.0.2...
> Connected to 192.168.0.2.
> Escape character is '^]'.
> ^]
> telnet>
> --------
<snip>
Ok - so this is where the tracing comes in.  I assume you are sending a
packet from your home network to some public IP.  Your ISP is then
NATting this to 10.73.219.156.  Using tcpdump or ethereal, can you see
the packet arrive at 10.73.219.156? If so, can you see the packet leave
192.168.0.1?, If so, what are the source and destination sockets of the
egressing packet? Do you see a reply packet? How is it addressed?
If you do not see a packet exiting the gateway on the 192.168.0.1
interface, place log rules in the various points of your table to find
out where the packet is dying.  Good luck - John
--=20
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


