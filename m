From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Please ... how can i log all packets dropped ?
Date: Mon, 21 Jul 2003 10:29:33 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030721142933.GB17849@cannon.eng.us.uu.net>
References: <20030719220531.GA3868@cannon.eng.us.uu.net> <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAArnhC4pMfykCnPZlPMhHrI8KAAAAQAAAAw3Gt95C4mUyYMRlu4U9EgwEAAAAA@sicredi.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAArnhC4pMfykCnPZlPMhHrI8KAAAAQAAAAw3Gt95C4mUyYMRlu4U9EgwEAAAAA@sicredi.com.br>
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
To: Juliano Murlick <jmurlick@sicredi.com.br>
Cc: 'Ramin Dousti' <ramin@cannon.eng.us.uu.net>, netfilter@lists.netfilter.org

On Mon, Jul 21, 2003 at 09:44:49AM -0300, Juliano Murlick wrote:

> =20
> Maybe I did my question wrong ... Sorry.
> I wanna LOG all packet dropped, but I don=92t wanna do one rule for eac=
h port
> or kind of packet, my rule's script is like this:
>=20
> ##########################################################
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
>=20
> iptables -P FORWARD -p tcp -s $REDELOCAL -d 200.228.185.225 --dport 25 =
-
> ACCEPT
> iptables -P FORWARD -p tcp -s $REDELOCAL -d 200.228.185.225 --dport 110=
 -
> ACCEPT

Add this here:

iptables -A FORWARD -j LOG --log-level alert

Also the two lines above must be "-A" and not "-P".

So it becomes:

------------------------------
iptables -P FORWARD DROP
iptables -A FORWARD -p tcp -s $REDELOCAL -d 200.228.185.225 --dport 25 -j=
 ACCEPT
iptables -A FORWARD -p tcp -s $REDELOCAL -d 200.228.185.225 --dport 110 -=
j ACCEPT
iptables -A FORWARD -j LOG --log-level alert
------------------------------


This will only log the unwanted traffic in the FORWARD chain. If you want
other chains to log add something like this to the end of the chains.


Ramin


> ##########################################################
>=20
> Now, i wanna LOG all dropped packets, everyone that try to access other=
 ip
> address or port must be log, how can i get it ?
>=20
>=20
> ATs,
> Juliano Murlick
> SICREDI Servi=E7os - Tecnologia
> jmurlick@sicredi.com.br
> (51) 3358-4977 / (51) 9951-3888
>=20
>=20
>=20
> -----Original Message-----
> From: Ramin Dousti [mailto:ramin@cannon.eng.us.uu.net]=20
> Sent: s=E1bado, 19 de julho de 2003 19:06
> To: Juliano Murlick
> Cc: netfilter@lists.netfilter.org
>=20
> On Sat, Jul 19, 2003 at 02:38:01PM -0300, Juliano Murlick wrote:
>=20
> > Hello ALL,
> > I need log all packet dropped on my firewall, how can i get it ? I=20
> > know how log all that i accept, like this:
>=20
> If I understand your question correctly:
> If you want to log the dropped packets only then you must allow the one=
s you
> want in the beginning of your rule set and the very last rule (right be=
fore
> the default DROP policy) must be LOG.
>=20
> Ramin
>=20
> > =20
> > iptables -A FORWARD -p tcp -s $REDELOCAL --sport 1024:65535 -d $SSHSR=
V=20
> > --sport 22 -j LOG iptables -A FORWARD -p tcp -s $REDELOCAL --sport=20
> > 1024:65535 -d $SSHSRV --sport 22 -j ACCEPT
> > =20
> > i will LOG all packet from ssh connection, but i don't  to log all=20
> > packet dropped, my default policy is DROP:
> > =20
> > iptables -P FORWARD DROP
> > =20
> > please, if anyone knows it ? tell me ....
> > =20
> > =20
> > Thanks in advance!
> >=20
> > Att,
> > Juliano Murlick
> >=20
> >=20
> > =20
> >=20
> > ---
> > Outgoing mail is certified Virus Free.
> > Checked by AVG anti-virus system (http://www.grisoft.com).
> > Version: 6.0.500 / Virus Database: 298 - Release Date: 10/7/2003
> > =20
> ---
> Incoming mail is certified Virus Free.
> Checked by AVG anti-virus system (http://www.grisoft.com).
> Version: 6.0.500 / Virus Database: 298 - Release Date: 10/7/2003
> =20
>=20
> ---
> Outgoing mail is certified Virus Free.
> Checked by AVG anti-virus system (http://www.grisoft.com).
> Version: 6.0.500 / Virus Database: 298 - Release Date: 10/7/2003
> =20
>=20

