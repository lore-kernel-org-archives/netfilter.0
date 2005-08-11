From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: Transparent proxy where source IP address remains unchanged --
 possible?
Date: Thu, 11 Aug 2005 16:47:19 -0400
Message-ID: <42FBB957.30003@rosi-kessel.org>
References: <20050809012914.GA23108@bostoncoop.net>
	<Pine.LNX.4.61.0508110741110.28320@yvahk01.tjqt.qr>
	<20050811130700.GA15463@bostoncoop.net>
	<Pine.LNX.4.61.0508112117380.23117@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigD3FB1BA346DA1624A64D425B"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0508112117380.23117@yvahk01.tjqt.qr>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigD3FB1BA346DA1624A64D425B
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Jan Engelhardt wrote:
>>Why do I need to patch sshd on faketarget? What I'm trying to do is just
>>send all the packets to realtarget, essentially untouched (other than the
>>destination IP).  I don't understand why sshd on faketarget would even be
>>involved...?
> Then just use DNAT.

Right, that's where I started. What I'm trying to figure out is why when
I only use DNAT packets don't seem to get forwarded to the new
destination. They only show up if I also change the source IP to be the
address of the proxy.

Is this because the final destination is rejecting the packets, or the
proxy server is not actually passing them on?

I think I may not properly understand some architectural detail here.  I
am changing the destination IP in DNAT/PREROUTING.  Is there anything
else I need to do to make sure the packet is properly passed on to the
destination, where the proxy basically "disappears" as a middleman?

Adam

--------------enigD3FB1BA346DA1624A64D425B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (MingW32)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFC+7lZdTf3ZklQ6qYRAlnVAJ9LReH+T2t8BR/UlzmrRpQMRSK3oQCgx636
aWsOR/Mc5NP0UwdSFeQ76Qk=
=l4yE
-----END PGP SIGNATURE-----

--------------enigD3FB1BA346DA1624A64D425B--

