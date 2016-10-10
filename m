From: Adel Belhouane <bugs.a.b@free.fr>
Subject: Re: nf_conntrack_sip regression?
Date: Mon, 10 Oct 2016 02:25:27 +0200
Message-ID: <5751ffd3-1e38-5926-43a2-11ec680ec7bb@free.fr>
References: <20161009001947.4eszsjifuc5wfacq@Redstar.dorchain.net>
 <5fc84a99-1a7c-7aad-9baf-7e3047ca912d@free.fr>
 <20161009092713.ursiwck3hg6d6jie@Redstar.dorchain.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20161009092713.ursiwck3hg6d6jie@Redstar.dorchain.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Joerg Dorchain <joerg@dorchain.net>
Cc: netfilter@vger.kernel.org

Le 09/10/2016 =E0 11:27, Joerg Dorchain a =E9crit :
> On Sun, Oct 09, 2016 at 05:55:18AM +0200, Adel Belhouane wrote:
>> Le 09/10/2016 =E0 02:19, Joerg Dorchain a =E9crit :

> I am sorry to quote myself, but as I wrote, I have in the RAW
> table
>=20
>> Chain PREROUTING (policy ACCEPT 19781 packets, 3776K bytes)
>>  pkts bytes target     prot opt in     out     source               dest=
ination
>>    86 48515 CT         udp  --  any    any     anywhere             anyw=
here             udp dpt:sip CT helper sip
>=20

Well sorry for the previous answer made without thinking (or reading), but =
indeed
I can read iptables-save better than iptables -L.

If it's really a change in the sip helper code, sorry I can't help and I
hope somebody else will help you.

Else, if your ppp0's MTU is a bit low, SIP might switch from UDP to
TCP (RFC3261 18.1.1), then adding a second CT rule with tcp port 5060
would handle it.

>=20
> Thanks for bearing with me,
>=20
> Joerg
>=20

Adel
