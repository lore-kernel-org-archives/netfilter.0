From: =?ISO-8859-1?Q?G=FCnter_Zimmermann?=
 <guenter@guenter-zimmermann.com>
Subject: Re: Redundant netfilter gateway
Date: Thu, 17 Jun 2004 23:22:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40D20B82.2040203@guenter-zimmermann.com>
References: <810BC538117E9F4E9BB152E0C100DF1F0F46C5@farmer.vikus.net> <1087506177.30435.27.camel@wslinux-fractal.penson.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1087506177.30435.27.camel@wslinux-fractal.penson.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "B. McAninch" <bmcaninch@penson.com>
Cc: Patrick Ahler <patrick@vikus.com>, netfilter@lists.netfilter.org

Check out OpenBSD with  CARP (the Common Address Redundancy Protocol) =20
and pfsync

copied from OpenBSD Site (http://www.openbsd.org/35.html#new):
New tools for filtering gateway failover:

    * CARP (the Common Address Redundancy Protocol) carp(4)
      <http://www.openbsd.org/cgi-bin/man.cgi?query=3Dcarp> allows
      multiple machines to share responsibility for a given IP address
      or addresses. If the owner of the address fails, another member of
      the group will take over for it. A discussion of the history of
      CARP can be found here <http://www.openbsd.org/lyrics.html>.
    * Additions to the pfsync(4)
      <http://www.openbsd.org/cgi-bin/man.cgi?query=3Dpfsync> interface
      allow it to synchronise state table entries between two or more
      firewalls which are operating in parallel, allowing stateful
      connections to cross any of the firewalls regardless of where the
      state was initially created.

I think this is the only realy full redundant opensource firewall available.

lg
G=FCnter

B. McAninch schrieb:

>Check out KeepAliveD (keepalived.sourceforge.net)- it uses VRRP for
>failover. It does not, however, provide /stateful/ firewall failover.=20
>IIRC, work is (was) being done for Netfilter's own state syncing.
>
>On Thu, 2004-06-17 at 15:52, Patrick Ahler wrote:
> =20
>
>>I am looking for info on creating a redundant gateway/firewall. I
>>currently have my network setup with 1 working iptables gateway/firewall
>>and 1 backup gateway. If the first gateway goes down, I change the IP's
>>and spoof the MAC addresses (I change the external MAC address because
>>my internal network is masqueraded through the gateway and just
>>switching the external IP messes with the arp tables on the router...
>>That's a whole other issue though) on the backup gateway and it takes
>>over. This is not redundancy and is dirty. Does anyone have any
>>suggestions on how to do this better?
>>
>>Patrick Ahler
>>Systems Administrator
>>Vikus Corporation=20
>>   =20
>>
>
> =20
>

