From: Tomas Edwardsson <tommi@tommi.org>
Subject: Re: Netfilter and Vonage.
Date: Fri, 21 May 2004 11:53:33 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40ADEDBD.40209@tommi.org>
References: <20040519233740.A27043@redfish.gatech.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigDE63AB96B785E6A9086DA669"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040519233740.A27043@redfish.gatech.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Jason Price <jprice@cyberbuzz.gatech.edu>
Cc: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigDE63AB96B785E6A9086DA669
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Jason Price wrote:

>Running Gentoo, kernel version 2.4.24 on a Sparc Ultra 10
>
>I have recently purchased Vonage Voice over IP.  In their 'how to make this
>work with a linksys device', they say (basically):
>
>Forward udp ports 53, 69, 5060, 5061, and 10000-20000 to the device.
>
>I interpret this to mean:
>
>iptables -t nat -A PREROUTING -i eth0 -p udp -d $EXTERNAL_IP \
>		--dport 53 -j DNAT --to 192.168.0.5:53
>
>etc for each port.
>
>Unfortunatly, I don't seem to be able to specify a range of ports in the
>iptables syntax.  So, when I get to that large, 10,000 wide range of ports,
>it dies.  After much tinkering, I find that I can do:
>
>for port in {10000..10597}; do
>   iptables -t nat -A PREROUTING -i eth0 -p udp -d $EXTERNAL_IP \
>		--dport $port -j DNAT --to 192.168.0.5:${port}
>done
>
>and it will work.  If I do just 1 port more, iptables fails, and all the
>tables get magically flushed (which isn't a good idea by the by, but we'll
>get there later).
>
>Idealy, I'd like to:
>
>iptables -t nat -A PREROUTING -i eth0 -p udp -d $EXTERNAL_IP \
>		--dport 10000-20000 -j DNAT --to 192.168.0.5:10000-20000
>  
>

I suggest applying the mport patch to netfilter.
http://www.netfilter.org/patch-o-matic/pom-base.html#pom-base-mport

iptables -t nat -A PREROUTING -i eth0 -p udp -D $EXTERNAL_IP \
    --dports 53,69,5060,10000:20000 -j DNAT --to 192.168.0.5

>Thanks;
>--Jason
>  
>
====
Tomas Edwardsson
HP-UX Certified System Administrator
Red Hat Certified Engineer.


--------------enigDE63AB96B785E6A9086DA669
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFAre3ChF2Ydg6Ynz0RAvkDAJ0dp6cYuubtg2cHDC3kE4MFKPwpAgCdET3u
9wpxh/LQXTPhka+YtohkXPc=
=ozRt
-----END PGP SIGNATURE-----

--------------enigDE63AB96B785E6A9086DA669--

