From: =?iso-8859-1?Q?Omar_Casta=F1eda_Acosta?= <omar@idea.com.mx>
Subject: Subnetting
Date: Fri, 17 Jan 2003 11:39:57 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3450D7F41847FE489C49F2568F0DE27601F328@neptuno.idea.com.mx>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello List:

I'm trying to change my current setup from what I'm doing now:

INET < --- > ROUTER < --- > FIREWALL < --- > LAN
                A              NAT
                |           FILTERING
                V             PROXY
            VoIP BOX


To:

INET < --- > ROUTER < --- > HUB < --- > FIREWALL < --- > SWITCHES < --- =
> LAN
               NAT           |          FILTERING =20
                             |           PROXY
                             |
                             \- > VoIP BOX

This is because the NAT on my new router support H323 perfectly. Plus =
ISP won't
provide extra IP addresses (Just one for the whole setup).


*******************
I know how to configure iptables to perform what I want to do. I just =
want some
advice in what would be the best way to subnet my network.
*******************



Right now (to make it work, I didn't have to modify my firewall scripts) =
the
sub-netting is as follows:

(Router) has the ISP provided valid Internet IP address on the WAN =
interface.
(Router) has a 172.16.0/24 address on the Ethernet interface.
(Firewall) has a 172.16.0/24 address on the EXTERNAL interface.
(Firewall) has a 192.168.0/24 address on the INTERNAL interface. =
(Everyone's gateway)
(VoIP box) has a 172.16.0/24 address on the EXTERNAL interface.

Right now the firewall runs proxies for SMTP, WEB and FTP. A VPN (PPTP =
and IPSEC)
service. And a permanent VPN tunnel with another location (configured as =
this one).
DNS services and SSH for administration. It filters outgoing and =
incoming traffic
according to usage and abuse policies (filter everything but legitimate =
incoming
traffic and valid hosts to use http, ftp, etc).

I'd appreciate any suggestions.

Thanks,
Omar Casta=F1eda Acosta
Systems Administrator
iDEA S.A. de C.V.
Voice: +52 (614) 414-2808 x 109
Mobile: +52 (614) 406-5241
VoIP: voip.idea.com.mx x 109
omar@idea.com.mx




