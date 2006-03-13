From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: MAC Address filter on wireless interface
Date: Mon, 13 Mar 2006 16:02:57 +0100
Message-ID: <1142262177.4809.67.camel@anduril.intranet.cartel-securite.net>
References: <44158057.20203@4dllc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44158057.20203@4dllc.com>
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
To: Steve Comfort <steve@4dllc.com>
Cc: netfilter@lists.netfilter.org

Le lundi 13 mars 2006 =E0 16:23 +0200, Steve Comfort a =E9crit :
> I have been trying to get MAC address filtering to work on our wireless=20
> card - so far without success :

You should describe the problem. What's not working ? Everything goes
through ? Nothing goes through ?

>      for M in $(cat /etc/mac.allow) ; do
>          $IPT -A INPUT -i $WIFI_IF -m mac --mac-source ! $M -j DROP
>      done

Probable typo here. Do you mean /etc/mac.deny ?
Another hint that comes to mind. Do you really want to filter traffic
destined to this particular box, which is what you do using INPUT
chain ? If you want to filter traffic going through the box, you have to
use FORWARD chain.

> Is it in fact possible to filter on MAC addresses over a WiFi interface,=20
> or am I doing something stupid?

Yes it is possible, but you have to consider the fact that MAC filtering
is a very limited feature on y WiFi network. MAC spoofing is very easy
(ifconfig $WIFI_IF hw ether $NEW_MAC) on most drivers and does not cause
any problem or conflict as long as you don't use the IP the guy you're
spoofing does. Thus, you MAC filter can be bypassed very easily...


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

