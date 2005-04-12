From: Moritz Gartenmeister <moritz@uplink-verein.ch>
Subject: Re: Logging suggestions
Date: Tue, 12 Apr 2005 20:06:17 +0200
Message-ID: <425C0E19.3030306@uplink-verein.ch>
References: <0aa401c53f73$5c19a2a0$09603fca@southern>
	<425BEA65.5030203@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <425BEA65.5030203@riverviewtech.net>
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
To: netfilter@lists.netfilter.org
Cc: hareram@sol.net.in

http://www.qosient.com/argus/

is maybe what you need. it runs stable and i always found the data i needed.

cheers
moritz

Taylor, Grant wrote:
> Oh, my, that will be tough.  Keep in mind that you will quite likely be=20
> generating more data doing the log than you will be having pass through=20
> your box, especially if the traffic has a small payload.  I would really =

> be tempted to look at using TCPDump to dump everything to a file and=20
> then parse the file.  I don't think the LOG or ULOG target are designed=20
> for such high traffic volumes.  Even if they were, LOG logs to SYSLOG,=20
> which it in and of it's self is not meant for that high of a volume. =20
> I've never messed with ULOG so I can't say.  Are you needing payload as=20
> well or just header information?  I still think TCPDump or some form of=20
> an IDS would be a better bet.  Try taking a look at Snort and see if=20
> that will come close to what you need.
>=20
>=20
>=20
> Grant. . . .
>=20
> hareram wrote:
>=20
>> Hi all
>>
>> I have large  capacity link like STM with my provider
>> Iam planning to log the every packet, source IP , Dest IP, Src port,=20
>> Dest port , Type of Service
>> what kind of system configuration recommended
>>
>> what kind of  logging system is better ?
>> iam trying to use Ulogd and try to log every packet, but the kernel=20
>> crashes after 5min
>>
>> i have Xeon 1GB ram with 40GB Scsi HDD running FC1
>>
>> How can logging whole history of the packet with the better performance
>> with out any payload to the user access, and transparently
>>
>> any suggestions will be appreciated
>>
>> hare
>>
>>
>>
>=20
>=20

--=20
Uplink student association
Moritz Gartenmeister
B=FClachstrasse 1 F
8057 Z=FCrich
Switzerland

