From: "Timothy Earl" <mehimx@gmail.com>
Subject: RE: Feature request: ability to test if rule is loaded
Date: Fri, 8 Apr 2005 14:00:16 +0200
Message-ID: <42567252.35d385f7.3153.3e2b@mx.gmail.com>
References: <aec22fc5050407235958a06990@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <aec22fc5050407235958a06990@mail.gmail.com>
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

Hi,

I think to solve your problem you could work around it by using a series =
of
awk grep and sed commands along with iptables -vL to test if your rule =
is
loaded, presently that is how i get my current ip etc..

man awk, man grep, man sed

for example:

EXTIP=3D"`/sbin/ifconfig ppp0 | grep 'inet adr' | awk '{print $2}' | sed =
-e
's/.*$

Regards,

Tim

> -----Message d'origine-----
> De=A0: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] De la part de `VL
> Envoy=E9=A0: vendredi 8 avril 2005 09:00
> =C0=A0: netfilter@lists.netfilter.org
> Objet=A0: Feature request: ability to test if rule is loaded
>=20
> Hello all.
>=20
> I recently started to configure my firewall and decided to write some
> more advanced shell scripts to make loading of rules easier. My task
> was to have a config which looks like:
>=20
> loadrule client/ssh on/off
> loadrule server/sshd on/off
>=20
> and i want the ability to run script, which will go thorough this list
> and will load rules that are not yet loaded, and remove rules, that
> marked off, if they are loaded.
>=20
> client/ssh is a file, that contains something like this:
>=20
> NAME=3D"SSH Client"
> RULES_NUM=3D"2"
> MY_SSH_SERVER1=3D"xxx.xxx.xxx.xxx"
>=20
> RULE[0]=3D"OUTPUT -o eth0 -p tcp...."
> RULE[1]=3D"INPUT -i eth0 ...."
>=20
> When i want to add rule, my function loadrule runs iptables -A
> RULE[0,1...], if i want to disable rule, i call iptables -D
> RULE[0,1...]
>=20
> But! How do i test if rule was loaded? If i delete rules, i get an
> error if rule is not loaded, if i add rules, it just added next in
> chain.
>=20
> So, it would be nice to have new iptables option, i think -T , which
> will act like -D with one exception: it will not delete rule, just
> return true if rule exists in chain, and false otherwise.
>=20
> It seems to me that it is very easy to add, and that it will be
> usefull for system administrators.
>=20
> For example, if we can`t turn of firewall on critical server,
> administrator have to manually review list of rules and delete some,
> he decided to remove by some reasons. With my approach he just changes
> 1 line in readable config to off, and asks script to reload config.
>=20
> What do you think ?


