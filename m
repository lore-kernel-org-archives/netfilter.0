From: "Elmshauser, Erik" <erike@pbgnw.com>
Subject: RE: Tuneable UDP Timeout in iptables?
Date: Tue, 25 Mar 2003 10:05:25 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0FD2E5E35F0C0D41AEA66C9C6F39F30D086B0C@HERMES.pbgnw.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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

> -----Original Message-----
> From: Stephen Lawrence Jr. [mailto:slawrence@ucdavis.edu]
> Sent: Tuesday, March 25, 2003 9:01 AM
> To: netfilter@lists.netfilter.org
> Subject: Tuneable UDP Timeout in iptables?
>=20
> Is there a way to modify the IPTABLES source code to have a tuneable
UDP
> timeout? Or, even be able to hardcode a larger timeout? I am having
> problems with AFS, and would like to not have to modify the kernel.
>=20

Stephen,
	I think you can use sysctl to tune this.

http://ipsysctl-tutorial.frozentux.net/ipsysctl-tutorial.html#AEN712

3.7.16. ip_ct_udp_timeout
The ip_ct_udp_timeout variable specifies the timeout for initial UDP
packets in a connection. When a UDP connection is initialized, the UDP
packet enters an NEW and then ESTABLISHED state once it has seen return
traffic to the original UDP packet. However, it maintains the same
timeout until it has seen several packets go back and forth and becomes
assured, at which point it is instead considered a stream.=20

While this initial state is maintained, the default timeout is 30
seconds. If you are using UDP protocols that send very little data
during longer timeframes, you should consider raising this value so that
the state machine is able to keep track of your connections properly. It
is generally a bad idea to lower this, unless you know that your hosts
sends UDP packets very often and don't expect a lot of late replies,
which would mean a lot of unnecessary open conntrack entries.=20

------------------------------------------------------------------------
--------

3.7.17. ip_ct_udp_timeout_stream
The ip_ct_udp_timeout_stream variable specifies the timeout values of
the UDP streams once they have sent enough packets to reach the assured
state. This state is normally reached for connections that send a lot of
data and relatively often, such as streaming services or ICQ. Examples
of streaming services may be certain realplayer servers, or speak
freely. This value should always be larger than the initial timeout
value for UDP streams since it is used on connections that we know for
sure expects a lot of traffic back and forth, even though it may not be
very often.=20

The ip_ct_udp_timeout_stream variable is per default set to 180 seconds,
or 3 minutes in recent kernels. If you are having problems with
connections timing out, you may try raising this value a bit. It is
generally a bad idea to lower this value, since the connection will be
destroyed once it times out from this state. Unfortunately, UDP is a
stateless protocol, so it is very hard to derive any specific states of
the connections. Because of this, there is no specific conntrack
timeouts for UDP streams that are about to close, or that has closed.=20


	--Erik

Rev. Dr. Erik C Elmshauser D.D.
Head of I.T.
Pacific Benefits Group NW LLC
erike@pbgnw.com
Phone  - 800.259.0455
Fax    - 800.662.0082
 There are 10 kinds of people in the world,
Those that can do binary arithmetic, and those that can't.

