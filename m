From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: port translation
Date: Sun, 11 Jan 2004 13:55:44 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401111355.44937.Antony@Soft-Solutions.co.uk>
References: <4001239D.7010904@yahoo.fr> <1073827964.769.16.camel@elendil.intranet.cartel-securite.net> <40015381.1090803@yahoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40015381.1090803@yahoo.fr>
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

On Sunday 11 January 2004 1:45 pm, Romain Moyne wrote:

> Cedric Blancher a =E9crit :
>
> >	iptables -t nat -A POSTROUTING -s $LAN -d $WB -j SNAT --to $ETH0
>
> What must I write instead of $LAN and $ETH0 ?

$LAN is the network range of the machines you might have packets coming f=
rom=20
(note it is the source address in the above rule) and $ETH0 is the IP add=
ress=20
of the interface on your netfilter machine.

Perhaps $LAN=3D192.168.0.0/24 and $ETH0=3D192.168.0.1 for your network?

Antony.

--=20
Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


