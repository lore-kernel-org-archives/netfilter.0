From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Order in ruleset edition
Date: Wed, 26 Nov 2003 11:36:48 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF52E3802@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>, "Hildebrand, Brian" <BrianHildebrand@universalcomputersys.com>, "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

Gold Star!

That's exactly what I do, and since I policy drop FORWARD and INPUT by =
default, no unauthorized traffic is getting anywhere!

-----Original Message-----
From: Leonardo Rodrigues Magalh=E3es [mailto:leolistas@solutti.com.br]=20
Sent: Wednesday, November 26, 2003 12:27 PM
To: Hildebrand, Brian; Netfilter (E-mail)
Subject: Re: Order in ruleset edition


    To prevent problems during a firewall reload/restart, I usually do:

    1) do 'echo 0 > /proc/sys/net/ipv4/ip_forward' on the very beggining =
of
the script
    2) define the default actions to drop on the very first rules ( -P
DROP )
    3) insert ALL the rules (can take some seconds)
    4) do 'echo 1 > /proc/sys/net/ipv4/ip_forward'
    5) firewall is READY

    What do you think on this ?

    Sincerily,
    Leonardo Rodrigues



