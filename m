From: Alex Bligh <alex@alex.org.uk>
Subject: Re: ebtables, MAC masquerading, and ARP and ND rewriting
Date: Fri, 13 Jun 2014 07:33:54 +0100
Message-ID: <E0CB0E20-9481-41C7-A2CB-10F283C0C09D@alex.org.uk>
References: <A84A4D9E-256A-48E6-A004-111F07E6091B@alex.org.uk> <CAPJdpdBXd9wrzBbBsbTU1r7U-Rd2kH0uC5-PX35nbQ5ytAQQ_A@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.2\))
Content-Type: multipart/signed; boundary="Apple-Mail=_087F5EBC-4B3E-4123-A6C4-D459F4B227C5"; protocol="application/pgp-signature"; micalg=pgp-sha512
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAPJdpdBXd9wrzBbBsbTU1r7U-Rd2kH0uC5-PX35nbQ5ytAQQ_A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Paul Robert Marino <prmarino1@gmail.com>
Cc: Alex Bligh <alex@alex.org.uk>, Mail List - Netfilter <netfilter@vger.kernel.org>


--Apple-Mail=_087F5EBC-4B3E-4123-A6C4-D459F4B227C5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252

Paul,

On 10 Jun 2014, at 15:25, Paul Robert Marino <prmarino1@gmail.com> =
wrote:

> have you tried bonding or teaming instead, then you would have one
> virtual device and you wouldn't have to worry about learning mac
> addresses. then you can use a bridge to link the VMware Ethernet
> interface to the bonded or teamed nics
>=20
> the scenario you described is not what the bridging driver was =
designed for.

The customer is using teaming & bonding which is what creates the
VMware bridge. I need the bridge in Linux because, well, it=92s
running eatables, has multiple devices on (not just 3), does
VLAN stuff etc.; actually I simplified and there are many bridges.
Everything works fine until the customer uses NIC teaming on the
LHS.

IE I=92m not putting in bridging to solve this. I=92m putting in
bridging because I need bridging, then the broken VMware bridge
that its teaming features inserts is breaking the bridge
in the VM.

Alex




>=20
> On Wed, Jun 4, 2014 at 11:15 AM, Alex Bligh <alex@alex.org.uk> wrote:
>> I am trying to use Linux to perform in a bridge configuration using
>> ebtables. The particular bridge I am plugging Linux into appears to
>> have some design flaws (for anyone interested, it's the bridge inside
>> VMware with NIC teaming), and the vendor appears to be uninterested
>> in fixing it.
>>=20
>> The configuration looks like this:
>>=20
>>   |          ..........      ......................  =
aa:bb:cc:dd:ee:01
>>   |  NIC-A   : VMware :      :    Linux bridge    :------------ Dev1
>>   +----------: bridge :      :                    :
>>   |          :        :      : 11:22:33:44:55:66  :  =
aa:bb:cc:dd:ee:02
>>   |          :        :------: eth0               :------------ Dev2
>>   |  NIC-B   :        :      :                    :
>>   +----------:        :      :                    :  =
aa:bb:cc:dd:ee:03
>>   |          :        :      :                    :------------ Dev3
>>   |          :........:      :....................:
>>  LAN
>>=20
>> NIC-A and NIC-B are in active/passive mode, however, passive does not
>> mean 'does not transmit packets'.
>>=20
>> What happens is a broadcast packet leaves device Dev1 with source =
address
>> aa:bb:cc:dd:ee:01, is passed through the linux bridge and transmitted
>> through device eth0 to the VMware bridge. It is then transmitted
>> out of NIC-A onto the LAN. What then happens is that the switch(es)
>> on the LAN transmits the packet through NIC-B back to the VMware
>> bridge.
>>=20
>> The VMware bridge appears to have an 'interesting' bridge algorithm,
>> in that it is not a learning bridge that it appears to examine the
>> source address of the packet, and determine that as it is not the MAC =
of
>> the VM device (11:22:33:44:55:66), it transmits it to eth0. This
>> causes the linux bridge to learn (incorrectly) that aa:bb:cc:dd:ee:01
>> can be reached through eth0.
>>=20
>> Essentially VMware has not been designed with there being more
>> than one MAC address used to the right of the bridge.
>>=20
>> One route here would be to drop all packets coming in from eth0
>> that have the MAC addresses of Dev1 to Dev3. But that is hard
>> as I'd need to know in advance what Dev1 to Dev3's MAC addresses
>> are and indeed these can change real time.
>>=20
>> A better route (I think) be to do what VMware wants, and only use
>> one MAC source address to the right of the bridge. This would require
>> MAC masquerading. I know how to do this with ebtables, but I don't
>> know how to handle the issue of ARP (IPv4) and ND (IPv6) packets.
>>=20
>> The ebtables examples page suggests this is handled by the BROUTE
>> table DROP-ing, and hence routing the packets. That won't work
>> for me as I'm not using the IP stack under Linux and indeed there
>> may be IP address conflicts between the management of the Linux
>> box and the VLANs which are bridged. What I think I need to do is
>> rewrite the outgoing arp replies and ND replies going through eth0
>> so that all MAC addresses are set to that of eth0 (i.e. =
11:22:33:44:55:66
>> on the above). I don't think I can use arptables to do this as
>> this requires the packets are routed. And that doesn't help with ND.
>>=20
>> Any ideas?
>>=20
>> --
>> Alex Bligh
>>=20
>>=20
>>=20
>>=20
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20

--=20
Alex Bligh





--Apple-Mail=_087F5EBC-4B3E-4123-A6C4-D459F4B227C5
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJTmptSAAoJEBPm5K7i9iORZBQQAJ+BOYnffrQS3EI0AARnt8l7
RUst9YZZQOoA4nPsQmD1TyEdgG64O/CdvCHUd87ldo+z44trOfUuhd5t73q1Wsu2
kvy6g1E23wEojpB9kQs76zSWgzzL8B7i2lJC8vRU3c90JPT1cbQ1VfIyhQEqkoX/
jKPs1vfqAbEnjlpgrB7fpWjkdYi0QxBnGqVKTV+/2K8vWCGC3f7VorR2fs+dekKf
hGeGB3mwVR/c+dqZhYUBSLZr9dGw7hUXENcAlu5MLy9sR/8+NgiaDv1gIgTEMC4h
rEPvHcCKukv+0w+SamQTR5eSxBo5UuSOFp0YSWViawdd1z0aVeqQQgHULX5HSwXz
v+uK2VzDegXIgTz+LN/lg000fNPbZ0GOC7JFaw5vIl6D7DESf+jUEuzblPZjELK/
885oajabjKr2geuuYlhfb7LXxAjVv2Yjk2F5U5OBHiP69GzD2kbS4/lr6GNaBgDv
Hx/lo9Skx6tvZKNfmfIbjDcM1EhAnaTGQb6VQVLf8Z8rqefMzhbE4fAfjrtWDgP8
Gxxc+grvlkqBqsugIzSQLVyVJOt+pMDqRii6BHPKA6QAAMa4jpCOxixf+PofbfFl
AEU3Iu71+KX0zmxJdw+L8oxMhgcorO3r5yWrHV3/OTZVIpKzaQwHfbnxPE5QHrc6
dgJz0yr/vqVmQWT3l8H7
=S8MC
-----END PGP SIGNATURE-----

--Apple-Mail=_087F5EBC-4B3E-4123-A6C4-D459F4B227C5--
