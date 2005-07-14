From: "Morales Carlos" <cmmorales@mail.com>
Subject: Doubt about forwarding. Please, Help me!
Date: Thu, 14 Jul 2005 13:40:51 -0500
Message-ID: <20050714184051.CE18E6F027@ws1-5.us4.outblaze.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello. I have a firewall blocking all the traffic from the Internet to my l=
ocal network, but I need to let an external host (extHOST) to access the po=
rt 8888 (for example) of an internal host (intHOST). Is this correct? The e=
xternal lan adapter is eth1.

 /sbin/iptables -t nat -A PORTFW -p tcp -i eth1 -s extHOST --dport 8888 -j =
DNAT --to-destination intHOST:8888

Thaks, please email me to cmmorales@mail.com=20
Carlos




--=20
___________________________________________________________
Sign-up for Ads Free at Mail.com
http://promo.mail.com/adsfreejump.htm


