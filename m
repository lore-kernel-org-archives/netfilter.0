From: "Juliano Murlick" <jmurlick@sicredi.com.br>
Subject: RE: Please ... how can i log all packets dropped ?
Date: Mon, 21 Jul 2003 09:44:49 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAArnhC4pMfykCnPZlPMhHrI8KAAAAQAAAAw3Gt95C4mUyYMRlu4U9EgwEAAAAA@sicredi.com.br>
References: <20030719220531.GA3868@cannon.eng.us.uu.net>
Reply-To: <jmurlick@sicredi.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030719220531.GA3868@cannon.eng.us.uu.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: 'Ramin Dousti' <ramin@cannon.eng.us.uu.net>, netfilter@lists.netfilter.org

=20
Maybe I did my question wrong ... Sorry.
I wanna LOG all packet dropped, but I don=92t wanna do one rule for each =
port
or kind of packet, my rule's script is like this:

##########################################################
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

iptables -P FORWARD -p tcp -s $REDELOCAL -d 200.228.185.225 --dport 25 -
ACCEPT
iptables -P FORWARD -p tcp -s $REDELOCAL -d 200.228.185.225 --dport 110 =
-
ACCEPT
##########################################################

Now, i wanna LOG all dropped packets, everyone that try to access other =
ip
address or port must be log, how can i get it ?


ATs,
Juliano Murlick
SICREDI Servi=E7os - Tecnologia
jmurlick@sicredi.com.br
(51) 3358-4977 / (51) 9951-3888



-----Original Message-----
From: Ramin Dousti [mailto:ramin@cannon.eng.us.uu.net]=20
Sent: s=E1bado, 19 de julho de 2003 19:06
To: Juliano Murlick
Cc: netfilter@lists.netfilter.org

On Sat, Jul 19, 2003 at 02:38:01PM -0300, Juliano Murlick wrote:

> Hello ALL,
> I need log all packet dropped on my firewall, how can i get it ? I=20
> know how log all that i accept, like this:

If I understand your question correctly:
If you want to log the dropped packets only then you must allow the ones =
you
want in the beginning of your rule set and the very last rule (right =
before
the default DROP policy) must be LOG.

Ramin

> =20
> iptables -A FORWARD -p tcp -s $REDELOCAL --sport 1024:65535 -d $SSHSRV =

> --sport 22 -j LOG iptables -A FORWARD -p tcp -s $REDELOCAL --sport=20
> 1024:65535 -d $SSHSRV --sport 22 -j ACCEPT
> =20
> i will LOG all packet from ssh connection, but i don't  to log all=20
> packet dropped, my default policy is DROP:
> =20
> iptables -P FORWARD DROP
> =20
> please, if anyone knows it ? tell me ....
> =20
> =20
> Thanks in advance!
>=20
> Att,
> Juliano Murlick
>=20
>=20
> =20
>=20
> ---
> Outgoing mail is certified Virus Free.
> Checked by AVG anti-virus system (http://www.grisoft.com).
> Version: 6.0.500 / Virus Database: 298 - Release Date: 10/7/2003
> =20
---
Incoming mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.500 / Virus Database: 298 - Release Date: 10/7/2003
=20

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.500 / Virus Database: 298 - Release Date: 10/7/2003
=20


