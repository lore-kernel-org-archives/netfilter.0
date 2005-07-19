From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: ssh connection is not allowed in NAT, SUSE 9.2
Date: Tue, 19 Jul 2005 10:59:37 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0507191059110.30160@darkstar.sysinfo.com>
References: <20050718132109.88338.qmail@web50210.mail.yahoo.com>
	<42DCC29E.5000603@mnemon.de>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="1028002384-936904562-1121785177=:30160"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42DCC29E.5000603@mnemon.de>
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
To: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Cc: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1028002384-936904562-1121785177=:30160
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by darkstar.sysinfo.com id
	j6JExfJa030175

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



and tpcd is not getting in the way, correct?

Thanks,

Ron DuFresne


On Tue, 19 Jul 2005, J=F6rg Harmuth wrote:

> Fatih TURKMEN schrieb:
>> Hi everybody,
>> I am trying to create small NAT network on SUSE 9.2
>> computers.I don't know what is missing in my iptables
>> policy but I have added three rules for SNAT:
>>
>> 1) iptables -t nat -A POSTROUTING -o eth0 -j
>> MASQUERADE
>> 2) iptables -A FORWARD -i eth0 -o eth1 -m state
>> --state RELATEd,ESTABLISHED -j ACCEPT
>> 3) iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
>>
>> I stopped firewalls on local computers, and installed
>> ssh server/client on all computers.I can ssh to local
>> machines from locals.But I can't ssh to nat
>> server.Also I can only ping one computer from NAT
>> Server.
>> When I try to ssh to local clients from NAT server I
>> got either  "No route to host" or "Connection refused"
>> although I stopped firewalls on locals and set the NAT
>> server as the default gateway for local clients.
>
> Would you mind to provide the full ruleset of your nat box ? Preferably
> the output of iptables-save ? A description of your network layout coul=
d
> be helpfull too (networks, NICs,...). As there is "No route to host" th=
e
> routing table could give some enlightment. There are at least two
> interfaces, so - is ip-forwarding enabled ? What does
>
> netstat -tulpn | grep ':22'
>
> give on the respective boxes ? When trying to connect via SSH to no
> avail, what does
>
> tcpdump -ni <respective_inerface>
>
> give (try reducing other traffic) ? Questions over questions :)
>
> Have a nice time,
>
> Joerg
>
>

- --=20
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint =3D 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFC3RVcst+vzJSwZikRAvjjAKCka178a2ROn/HBqff4RVj5PwjSNACdFsGj
zdr88jWe/HMxzivNy5u/UfA=3D
=3DnMTJ
-----END PGP SIGNATURE-----
--1028002384-936904562-1121785177=:30160--

