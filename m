From: Esteban Ribicic <eribicic@UolSinectis.com>
Subject: kazaaa is making me crazy!
Date: 10 Jun 2003 21:35:39 -0300
Sender: lartc-admin@mailman.ds9a.nl
Message-ID: <1055291739.829.16.camel@dejawu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <lartc-admin@mailman.ds9a.nl>
Errors-To: lartc-admin@mailman.ds9a.nl
List-Help: <mailto:lartc-request@mailman.ds9a.nl?subject=help>
List-Post: <mailto:lartc@mailman.ds9a.nl>
List-Subscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=unsubscribe>
List-Archive: <http://mailman.ds9a.nl/pipermail/lartc/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org, LARTC <lartc@mailman.ds9a.nl>
Cc: winfield@freegates.be

im trying to debug how cpu consuming could be the string match.
is it a lineal function? i mean..

1 Mbit -> 1024/8 Kbytes

supossaing mtu payload is 1500 bytes, i have in 1 megabit
[(1024/8)*1000]*1500 = 1920000000 packets

anorther thing..this rule just filter the initial download request..that
would be okay if oyu want filter completely, but if you want to slwo
down (i mean using tc/htb/fwmarks) you wouldnt be matching the hole
download, only the request...

iptables -t mangle -A PREROUTING -p tcp -m --string "Kazaa" -j DROP


any comment, any idea?

_______________________________________________
LARTC mailing list / LARTC@mailman.ds9a.nl
http://mailman.ds9a.nl/mailman/listinfo/lartc HOWTO: http://lartc.org/
