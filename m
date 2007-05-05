From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: [OT] iptables and 802.1x authenticator
Date: Sat, 05 May 2007 17:31:24 +0200
Message-ID: <1178379084.6720.11.camel@localhost>
References: <1178329218.8026.0.camel@localhost>
	<1178347689.2956.4.camel@localhost> <1178378601.6574.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1178378601.6574.3.camel@localhost>
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
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: netfilter@lists.netfilter.org

Le samedi 05 mai 2007 =E0 11:23 -0400, John A. Sullivan III a =E9crit :
> Thank you, Cedric.

You're welcome.

> Now I just need to see if we can create iptables rules based upon what
> the authentication server returns through the authenticator. If anyone
> has experience in doing that, please let me know.

That would be great.

You have to configure your RADIUS in order to push specific attributes
linked to user identity, group, whatever to the authenticator, that will
do whatever is needed.

I played a bit with usual VLAN assignment on switches and access points.
Each user is thus assigned a dedicated VLAN based on his identity when
authenticated. Works great, would be nice to have this on hostapd...


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!



