From: Payal <rpayal@indiainfo.com>
Subject: Re: migration to iptables
Date: Tue, 11 Jun 2002 07:56:55 +0530
Sender: netfilter-admin@lists.samba.org
Message-ID: <ae3np4$ccb$2@main.gmane.org>
References: <200206101942.43007@.> <200206101431.g5AEVpU08614@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206101431.g5AEVpU08614@vulcan.rissington.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi,
Thanks for the mails.

iptables -A POSTROUTING -o $EXT_IF -j MASQUERADE
Warning: wierd character in interface `-j' (No aliases, :, ! or *).
Bad argument `MASQUERADE'
Try `iptables -h' or 'iptables --help' for more information.

and this gave,
iptables -A forward -j MASQUERADE
iptables: No chain/target/match by that name

My aim is very simple, I just wanted the equivalent command for=20
ipchains -A forward -j MASQ=20
in iptables.
Thanks a lot in advance and eagerly waiting for the help.
-Payal
On Monday 10 June 2002 08:01 pm, you wrote:
> On Monday 10 June 2002 3:18 pm, Payal wrote:
> > Hi all,
> > I used to use ipchains like
> > ipchains -A forward -j MASQ
> > to share internet connection. Now on Linux kernel 2.4.18 on Mdk 8.2 I
> > want to try iptables for a while.
> > I just substitued ipchains in the above command with iptables
> > iptables -A forward -j MASQ
> > iptables v1.2.5: Couldn't load target
> > `MASQ':/lib/iptables/libipt_MASQ.so: cannot open shared object file: =
No
> > such file or directory
>
> You need the appropriate FORWARD rules to allow the traffic through the=
 box
> in the first place, but this is how you masquerade the source address
> behind your Internet link address:
>
> iptables -A POSTROUTING -o $EXT_IF -j MASQUERADE
>
> You might want to read:
>
> http://www.netfilter.org/documentation/HOWTO/packet-filtering-HOWTO.htm=
l
>
> http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO.html
>
>
>
> Antony.

