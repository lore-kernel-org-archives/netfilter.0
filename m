From: deff <deff@sadomain.co.za>
Subject: Log message
Date: 11 Feb 2003 09:37:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1044949075.23281.20.camel@filth.sadomain.co.za>
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
Content-Type: text/plain; charset="macroman"
To: netfilter@lists.netfilter.org



Hi=20

Does anyone feel inclined to shed some light on the following log
segment. It would be greatly appreciated .=20

DST=3D196.7.204.239 LEN=3D480 TOS=3D0x00 PREC=3D0x00 TTL=3D62 ID=3D36429 PR=
OTO=3DTCP
INCOMPLETE [8 bytes] ]

I'm not exactly sure what this is, but it looks like it might be a
fragment that iptables isn't letting through. Or, perhaps it could also=20
be a message from the bridge ...  =20

I'm not explicitly logging fragments, but the packet header still apears
in the messages file. Tried explicitly allowing fragments through=20

iptables --append FORWARD --jump ACCEPT=20
iptables --append FORWARD -f --jump ACCEPT=20

but it still shows up.=20

Someone mentioned to me that it might be becuase of windows xp machines
trying to connect to our service. Apparently there is some sort of bug=20
in windows xp that determines a incorrect mtu size.=20

Thanks, in advance=20
Cilli=C3=A9



