From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: How to make a computer invisible
Date: Sun, 30 Nov 2003 13:53:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070218413.2884.12.camel@grendel>
References: <20031130181240.GD6930@zeus.tpfm.de>
	 <006301c3b778$b22259a0$8b00000a@casa>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006301c3b778$b22259a0$8b00000a@casa>
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
To: Leonardo Rodrigues =?ISO-8859-1?Q?Magalh=E3es?= <leolistas@solutti.com.br>
Cc: netfilter-user Mailinglist <netfilter@lists.netfilter.org>

On Sun, 2003-11-30 at 14:32, Leonardo Rodrigues Magalh=E3es wrote:
>     AFAIK, iptables can use some 'layer 2' information such as MAC Addr=
ess
> for doing some filtering in some tables, but it CANT be used for filter=
ing
> those 'layer 2' packets. That means iptables CANNOT modify ARP/RARP
> behavior.

You can choose to ignore them, by initializing the interface with a
'ifconfig -arp', but this will disable all ARP functionality forcing you
to use manual entries. That's sort of like filtering. ;-)

C



