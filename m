From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: Something wrong with my script!
Date: Mon, 10 Feb 2003 11:25:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019B74@hslex01.hslbz.local>
References: <FD8F124A387AD6119F7900A0D218B3215622D9@hslex01.hslbz.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B3215622D9@hslex01.hslbz.local>
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

> I got a problem with my iptables script. It seemed to run=20
> fined, and I=20
> started using --state flag...
>=20
> But recently I did a nmap on my computer and got suprising=20
> results, s=E5 I=20
> tried several other port scanner and got results alike nmap..=20

Did you start nmap from the firewall itself ? If so, you shouldn't do
that.
Nmap your machine from another (internet) host.


Rob


