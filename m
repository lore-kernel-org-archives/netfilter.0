From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: opening a port..
Date: Thu, 9 Jan 2003 11:40:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019AA5@hslex01.hslbz.local>
References: <FD8F124A387AD6119F7900A0D218B321561E53@hslex01.hslbz.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B321561E53@hslex01.hslbz.local>
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
To: =?iso-8859-1?Q?'J=F6rg_Esser'?= <jackfritt@boh.de>, 'netfilter' <netfilter@lists.netfilter.org>

> I heard that when you use nmap as your way it picks just well known=20
> ports (/etc/service file ?) and then you won=B4t get this=20
> special port if=20
> its not in there.(Maybe I=B4m wrong)

I have a /usr/share/nmap/nmap-services file. I think nmap is picking
that file to scan for services. It's more detailed than /etc/services,
but indeed it doesn't include eDonkey ports.


Rob


