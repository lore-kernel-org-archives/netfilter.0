From: "Miguel Laborde" <Miguel.Laborde@qlogitek.com>
Subject: RE: New connection to windows boxes very slow, very fastafterinitial delay
Date: Tue, 16 Mar 2004 11:06:13 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <C8DE82BEF24D0146862937D2A9DD0E920C7316@qlmail2.qlogitek.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hi Chris,

	thanks for the info, appears I probably am climbing up the wrong tree =
here. Is it possible that as the internal machine tries to establish a =
new session with the dmz machine, the dmz machine is trying to establish =
some sort of new connection back to the internal machine to query =
certain information about it? The internal machine is part of a windows =
domain while the dmz machine is standalone, so the dmz machine shouldn't =
be trying to contact a DC (since it doesn't know a windows domain =
exists) but then I'm not fully clued up on window's specific behaviour =
:P

	Thanks


Thanks Ray, my apologizies since you probably already explained this to =
me but I just didn't understand.




-----Original Message-----
From: Chris Brenton [mailto:cbrenton@chrisbrenton.org]
Sent: Tuesday, March 16, 2004 10:54 AM
To: Miguel Laborde
Cc: Netfilter Mailing List
Subject: RE: New connection to windows boxes very slow, very
fastafterinitial delay


On Tue, 2004-03-16 at 10:33, Miguel Laborde wrote:
> Hi Ray,=20
> 	thanks for the reply however I don't think this is a netbios issue. I =
realize I said \\dmzmachine but really in this case I'm using an IP =
address and I'm connecting to the c$ drive so there shouldn't be any =
Netbios name lookups

I think you are confused. _NetBEUI_ is its own stand-alone protocol.
When older systems use IP, its actually NetBIOS/IP. Do a:
netstat -an

and you should see ports between 137-139 open. These are the NetBIOS
ports.

As for your question about Windows creating a new session based on an
ACK packet, this is false. Windows properly returns a RST to these
packets. SYN and SYN/PSH are the only two valid flag combinations I've
found on Windows for connection establishment.=20

Now, it *could* be that you are banging your head against the state
table time out. This is 5 days by default, or less if one end signals a
Window size of zero (time-wait). If the session is sitting quieter for
longer than that, Netfilter could be killing the session. You could fix
this by writing a rule that passes ACK packets from the outside host,
but this would be a potential security hole. Best fix would be some kind
of a keep alive (file copy running on a scheduled process or something
similar).

HTH,
Chris



