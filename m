From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables-pptp
Date: Fri, 26 Mar 2004 14:34:03 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403261434.03285.Antony@Soft-Solutions.co.uk>
References: <1080296089.2287.20.camel@syrah>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1080296089.2287.20.camel@syrah>
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

On Friday 26 March 2004 10:14 am, Hern=E1n Alvarez wrote:

> Hi!!
> Here's my first mail to the list.

Welcome.

> I can't connect a VPN through my LAN (with a linux Redhat 7.3 or above
> gateway) to a VPN server

1. Tell us what sort of VPN this is: IPsec? PPTP? Kame? other?

> Until my REDHAT was 7.2 there was no problem but when try to do with 7.=
3
> my error is 650
>
> LAN-----------------PROXY RH73-------------VPN SERVER

2. I assume you mean "Packet Filtering Netfilter Firewall" where you have=
=20
"Proxy" there?   What rules are you running?

3. Are you doing any logging (of eg: dropped packets) on the firewall whi=
ch=20
may suggest what's not working?   How are you testing the setup and what=20
diagnostic information do you get?

Regards,

Antony.

--=20
The truth is rarely pure, and never simple.

 - Oscar Wilde

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


