From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [conntrackd] Question about expect table sync
Date: Wed, 14 Jul 2010 19:23:41 +0200
Message-ID: <4C3DF29D.5000400@netfilter.org>
References: <4C2C9E4C.40901@orange-ftgroup.com> <4C2CB9AF.2000906@netfilter.org> <4C2D95EE.5020709@orange-ftgroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C2D95EE.5020709@orange-ftgroup.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: todor.gamishev@orange-ftgroup.com
Cc: netfilter@vger.kernel.org

Hi Todor,

On 02/07/10 09:31, todor.gamishev@orange-ftgroup.com wrote:
> Hi Pablo,
>=20
> Pablo Neira Ayuso a =E9crit :
>> We are not synchronizing the expectation table but we do synchronize
>> confirmed expectations that are attached to their master conntrack (=
I'm
>> refering to the RELATED state in iptables).
>>
>> Expectations usually have a short lifetime and they occur in early
>> stages of the flow establishment. I consider that synchronizing
>> expectations do not help too much to improve availability under reco=
very
>> situations but it requires extra computational resources for this.
>=20
> Thank you very much for replying to my mail so quickly.
>=20
> Yes I agree with you in some ways. However, I am working on SIP-capab=
le
> firewalls and the SIP Applicative Layer Gateway in netfilter
> (nf_conntrack_sip) retrieves ports needed for the RTP traffic in the =
SIP
> message body and adds them in the expectation table. So, when the Mas=
ter
> goes down the Backup doesn't know them and all RTP packets are droppe=
d.

Indeed, as for now (conntrack-tools 0.9.14) we don't support SIP yet,
but it would require extra implementation work.
