From: Bill Chappell <chappewr@critical.com>
Subject: Re: Packets Counting
Date: Wed, 16 Mar 2005 14:15:47 -0500
Message-ID: <423885E3.4000802@critical.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>


I do not have time this instant to share the code but the outline of
a packet counter I use is to create chain MANGLE_ACTIVITY in -t mangle,
add a rule that simply RETURNs to MANGLE_ACTIVITY, Insert a jump to the
MANGLE_ACTIVITY chain in -t mangle PREROUTING (so it is the first chain
hit by all incoming packets), use whatever matches, like --sport or
--dport (remember to specify protocol with port matches) and/or an
interface match.  Then, in a script (mine happens to be Perl), run
"iptables -t mangle -nvL MANGLE_ACTIVITY" and pipe (|) it through grep
to get the RETURN line with the packet count and pipe it through
awk to pick off the packet count followed by
"iptables -t mangle -Z MANGLE_ACTIVITY" to zero the counter,
both in a loop with a sleep to get the interval (approximately).

Hope this helps.

Bill

(Without deadlines, we'd live forever.)



M. A. Imam wrote:
> Can i record the the number of packets each 2 seconds with tcpdump. i can=
 see=20
> packets with tcpdump but how to count it every 2 seconds
>=20
>=20
>>=3D=3D=3D=3D=3D Original Message From edvin.seferovic@kolp.at =3D=3D=3D=
=3D=3D
>>Maybe you should use tcpdump for testing purposes instead of using iptabl=
es.
>>
>>Just my opinion.
>>
>>Regards,
>>
>>Edvin
>>
>>-----Original Message-----
>>From: netfilter-bounces@lists.netfilter.org
>>[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of M. A. Imam
>>Sent: Mittwoch, 16. M=E4rz 2005 16:56
>>To: netfilter@lists.netfilter.org
>>Subject: Packets Counting
>>
>>Hi,
>>
>>How can i count the number of packets on an interface evry 2 or 5 seconds.
>>and
>>i want to count only specific packets like only arriving packets from port
>>5001
>>
>>Any ideas...
>>
>>Muhammad
>=20
>=20
>=20
>=20

--=20
William Chappell, Software Engineer, Critical Technologies Inc.
* Creativity * Diversity * Expertise * Flexibility * Integrity *
Suite 400 Technology Center, 4th Floor 1001 Broad St, Utica NY 13501
315-793-0248 x148 FAX -9710 <bill.chappell@critical.com> www.critical.com



