From: "Roksana Boreli" <Roksana.Boreli@nicta.com.au>
Subject: Multiple IPSEC VPNs through a firewall based on 2.4.2X kernel
Date: Tue, 24 Aug 2004 15:11:43 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09D3F703EF3B0A4CBE28449EA9F3D32069F456@nicta-atp-mail.in.nicta.com.au>
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
To: netfilter@lists.netfilter.org

Hi,

I am trying to set up multiple ipsec VPN clients working behind a Linux
router with NAT/PAT, based on a 2.4.20 (can be 2.4.22) kernel. I would
like to be able to connect a number of Windows (2k or XP) machines to an
existing Cisco VPN server.=20

client 1 (ipsec) --->  | router	|
client 2 (ipsec) --->  |  NAT/	|
.		        PAT	| -> ipsec VPN server (Cisco)
.		     |		|
client 10 (ipsec) --->|		|

A patch seems to be needed to make this work, and I have seen a lot of
emails with a similar question in regards to pptp VPN clients, but
nothing encouraging for ipsec.  I have also seen the IP masquerade HOWTO
and the VPN HOWTO, which both refer to a patch for 2.2 kernels, but
claim nothing is available for 2.4 kernels. I am a netfilter newbie (if
this is not blindingly obvious), so any help would be much appreciated.


Kind regards, Roksana

