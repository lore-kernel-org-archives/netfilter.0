From: "Juliano Murlick" <jmurlick@sicredi.com.br>
Subject: RE: Please ... how can i log all packets dropped ?
Date: Sat, 19 Jul 2003 18:01:55 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAArnhC4pMfykCnPZlPMhHrI8KAAAAQAAAAn/CEWYTg2kCH677covd3rwEAAAAA@sicredi.com.br>
References: <007c01c34e2e$e42aacd0$1100000a@busbydev>
Reply-To: <jmurlick@sicredi.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007c01c34e2e$e42aacd0$1100000a@busbydev>
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
To: netfilter@lists.netfilter.org


I don't understant ... i can't do some thing like this:

iptables -P FORWARD -j LOG

I have to do a rule for any kinf of packet that I wanna log ?


ATs,
Juliano Murlick
SICREDI Servi=E7os - Tecnologia
jmurlick@sicredi.com.br
(51) 3358-4977 / (51) 9951-3888



-----Original Message-----
From: David Busby [mailto:busby@pnts.com]=20
Sent: s=E1bado, 19 de julho de 2003 16:50
To: jmurlick@sicredi.com.br; netfilter@lists.netfilter.org

At the end of the rules say -j LOG, any packet that makes it that far =
will
then be droped by the policy.




----- Original Message -----
From: "Juliano Murlick" <jmurlick@sicredi.com.br>
To: <netfilter@lists.netfilter.org>
Sent: Saturday, July 19, 2003 10:38
Subject: Please ... how can i log all packets dropped ?


> Hello ALL,
> I need log all packet dropped on my firewall, how can i get it ? I =
know
> how log all that i accept, like this:
>
> iptables -A FORWARD -p tcp -s $REDELOCAL --sport 1024:65535 -d $SSHSRV
> --sport 22 -j LOG
> iptables -A FORWARD -p tcp -s $REDELOCAL --sport 1024:65535 -d $SSHSRV
> --sport 22 -j ACCEPT
>
> i will LOG all packet from ssh connection, but i don't  to log all
> packet dropped, my default policy is DROP:
>
> iptables -P FORWARD DROP
>
> please, if anyone knows it ? tell me ....
>
>
> Thanks in advance!
>
> Att,
> Juliano Murlick
>
>
>
>
>
> ---
> Outgoing mail is certified Virus Free.
> Checked by AVG anti-virus system (http://www.grisoft.com).
> Version: 6.0.500 / Virus Database: 298 - Release Date: 10/7/2003
>
>
>

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


