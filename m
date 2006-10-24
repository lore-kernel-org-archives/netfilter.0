From: Benny Amorsen <benny+usenet@amorsen.dk>
Subject: Re: mac match and FORWARD chain
Date: 24 Oct 2006 12:30:27 +0200
Message-ID: <m3vemam2f0.fsf@ursa.amorsen.dk>
References: <361567501.01771@mail.nankai.edu.cn>
	<453C1F0B.4010707@mail.nankai.edu.cn>
	<20061023105043.GA1104@animx.eu.org>
	<453DE93F.3000704@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

>>>>> "PH" =3D=3D Pascal Hambourg <pascal.mail@plouf.fr.eu.org> writes:

PH> Hello, Wakko Warner a =C3=A9crit :
>> Box A -> (eth1)firewall/router(eth0) -> Box B firewall/router does
>> not trust eth1 and uses MAC addresses to allow access, so it does
>> this: -I FORWARD -j ACCEPT -i eth1 -m mac --mac BOXAMAC -I FORWARD
>> -j DROP -i eth1

PH> If the firewall does not trust what is beyond eth1, MAC filtering
PH> is pointless : a MAC address can be easily sniffed and spoofed.

Unless the switches use MAC-address-based security... Of course these
days you can let the switches sniff DHCP and enforce IP's as well.


/Benny



