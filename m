From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: source-mac filtering
Date: Sat, 10 Jan 2004 23:37:55 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401102337.55570.Antony@Soft-Solutions.co.uk>
References: <Sea1-F7gMiX6AZCFgXe000520e9@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Sea1-F7gMiX6AZCFgXe000520e9@hotmail.com>
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

On Saturday 10 January 2004 11:20 pm, H=E5kan Engblom wrote:

> Hi,
>
> I've run in to a strange problem. I have a dhcp-server on a 2.4.22 kern=
el
> with a 1.2.8 iptables. The dhcp-server is configured only to offer
> IP-addresses to one single mac-address (it is a single host on a privat=
e
> network)
>
> However I'd like to block all other mac-addresses on this interface sin=
ce I
> plan to have a W-LAN here as well. (to prevent attackers from using
> potential exploits in the dhcp-server)
>
> The mac-filter works fine for http, telnet, ssh aso, I can see the
> drop-counter increasing and no traffic is let through (when I change th=
e
> mac-address in the iptables-config to something else than what I have o=
n my
> "dhcp-client-host"). BUT the dhcp-server keeps sending offers and ack's
> evethough the incoming discover/request is blocked by iptables.

DHCP operates at a rather "lower level" than normal TCP/IP services - as =
it=20
must do, if you think about the fact that the clients involved in the=20
communications do not have IP addresses until the protocol is complete.

Therefore you find that the DHCP server binds itself to the networking st=
ack=20
rather lower down than netfilter / iptables (which is IP-based, after all=
,=20
and therefore doesn't see traffic which communicates purely between ether=
net=20
addresses), and you cannot block (or log) DHCP activity using netfilter.

I can think of two choices for doing what you want:

1. Configure the DHCP server to respond only to selected MAC address/es.

2. Use ebtables to manage the ethernet layer in the way you are trying to=
 use=20
iptables at present.

Regards,

Antony.

--=20
Perfection in design is achieved not when there is nothing left to add, b=
ut=20
rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


