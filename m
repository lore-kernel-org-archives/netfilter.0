From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?=
	<leolistas@solutti.com.br>
Subject: OFFTOPIC: Re: VPN over netfilter NAT
Date: Thu, 16 Sep 2004 09:00:56 -0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <006e01c49be4$d4a701a0$8b00000a@casa>
References: <200409161436.26695.apapadop@alumni.carnegiemellon.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org, apapadop@alumni.carnegiemellon.edu


    Well ...... this is not completly true, as well it's not a complete lie.

    Reading the doc you sent us the link, i could notice the author explains
how to setup a IPSec VPN, using FreeSWAN.

    It's true that IPSec is NOT a NAT-Friendly protocol, just like HTTP or
SMTP. IPSec requires special cares when doing NAT. These 'special cares' are
implemented in NAT Helpers, just like ip_nat_ftp. And, IPSec NAT Helper was
never developed or, at least, never was made public available.

    BUT, there's a patch called NAT-T which allows IPSec to work fine on NAT
situations.

    You should also notice that FreeSWAN is not being developed anymore. Two
projects continued developing the FreeSWAN source, which are:

http://www.openswan.org/
http://www.strongswan.org/

    Seems that both projects applied the NAT-T patch into their distribution
codes. So, you WILL be able to run IPSec VPN over NAT **IF** both peers are
NAT-T capable and correctly configured for that.

    And you can always try another VPN daemons. In several situations I
prefeer using OpenVPN (http://openvpn.sourceforge.net), which is extremely
simpler to configure and it NAT friendly with no extra configurations. If
you're trying to establish VPN between 2 Linuxs, OpenVPN may be a great
option. But if you're trying Linux-Cisco or Linux-something else, maybe
IPSec will be your only option.

    Hope it helps .....

    Sincerily,
    Leonardo Rodrigues


----- Original Message ----- 
From: "Alexandros Papadopoulos" <apapadop@alumni.carnegiemellon.edu>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, September 16, 2004 8:36 AM
Subject: VPN over netfilter NAT


> I stumbled across
> http://www.linuxhomenetworking.com/linux-adv/vpn-linux.htm today, which
> states that "NAT breaks VPNs".
>
> Is this just an over-simplifying statement that really means "if you're
> reading this, then don't even try setting up a NAT-traversing VPN"?
>
> This is exactly what I'm planning to do; I've got my mind set on having
> the two VPN endpoints inside two NATed networks, both managed by
> respective dedicated linux boxes running only netfilter.
>
> If that is indeed possible (and doable for a first timer), could anyone
> provide some relevant pointers to documentation?



