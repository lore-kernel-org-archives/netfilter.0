From: Marcelo Medici <gaucho@ericps.crc.uiuc.edu>
Subject: RE: NetFilter rules break when freeswan is enabled
Date: Mon, 25 Aug 2003 10:03:21 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.SOL.4.30.0308250959260.13067-100000@ericps.crc.uiuc.edu>
References: <DKEDJAAMDCDBHFKPBEMPIEKBCHAA.markee@bandwidthco.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <DKEDJAAMDCDBHFKPBEMPIEKBCHAA.markee@bandwidthco.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Mark E. Donaldson" <markee@bandwidthco.com>
Cc: netfilter@lists.netfilter.org

I am using SNAT, however its not the communication with the remote side of
the vpn that concerns me right now. Once the ipsec interface is brought
up, ALL masquerade functions stop, meaning that even when one of my
internal machines tries to attach itself to an ip address that is not at
the remote end of the vpn, the attempt fails.
I have the necessary ports open for esp/ah, as the freeswan docs are
fairly clear on it. Right now, my goal is just to get ipsec0 up but still
allow my internal clients to use masq and reach non-vpn remote sights.
Currently, once ipsec0 is admin up, my clients can't exist the network.

Thank you for your time in responding to this!


On Sun, 24 Aug 2003, Mark E. Donaldson wrote:

> Are you are using SNAT?  If so, this may be your problem.  Depending on
> whether or not you are using ESP vs. AH, you may be encrypting the IP header
> and this will break your system.
>
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Marcelo Medici
> Sent: Saturday, August 23, 2003 8:08 AM
> To: netfilter@lists.netfilter.org
> Subject: NetFilter rules break when freeswan is enabled
>
>
> Hello,
> I am currently seeing a problem on a machine running iptables 1.2.6.
> The machine acts as a masquerade gateway for a group of rfc1918 addresses.
> When I enable ipsec0 via the freeswan project, all forwarding using nat
> ceases. The gateway server itself still has reachability outward, as well
> as inward to the private network. It is only the masquerading that stops.
>
> Has anyone seen this type of behavior before? My iptables config is quite
> large, but I can post it if a response requires it.
>
> Thank you.
>
>
>
>
>


