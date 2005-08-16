From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: ftp issue cont.
Date: Tue, 16 Aug 2005 18:06:12 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0508161805480.18549@darkstar.sysinfo.com>
References: <6c016e56bfd4d0.6bfd4d06c016e5@vsnl.net>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="1028002384-951718083-1124229972=:18549"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6c016e56bfd4d0.6bfd4d06c016e5@vsnl.net>
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
To: varun_saa@vsnl.net
Cc: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1028002384-951718083-1124229972=:18549
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by darkstar.sysinfo.com id
	j7GM6HXY018559

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



A good place to start might be man lsmod

Thanks,

Ron DuFresne

On Tue, 16 Aug 2005 varun_saa@vsnl.net wrote:

> Thanks Jorg,
>           I get the following for lsmod :
>
> [root@squidserver ~]# lsmod | grep conntrack
> ip_conntrack           41497  3 ipt_state,ipt_MASQUERADE,iptable_nat
>
> So how do I add :
>
>           ip_conntrack_ftp
>           ipt_conntrack
>
> And yes it is :
>               -A FORWARD -j DROP
>
> Thanks again
>
> Varun
>
>
>
>
>
> ----- Original Message -----
> From: J=F6rg Harmuth <harmuth@mnemon.de>
> Date: Monday, August 15, 2005 4:29 pm
> Subject: Re: ftp issue cont.
>
>> varun_saa@vsnl.net schrieb:
>>> Thanks Jorg,
>>>             How to find out if ftp-module is loaded or
>>> not.
>>
>> e.g.
>>
>> lsmod | grep conntrack
>>
>> gives on my box:
>>
>> ip_conntrack_ftp        3680   0  (unused)
>> ipt_conntrack           1120   0  (autoclean)
>> ip_conntrack           26484   1  (autoclean) [ip_conntrack_ftp ...
>>
>>>
>>> Thanks
>>>
>>> Varun
>>>
>>> ----- Original Message -----
>>> From: J=F6rg Harmuth <harmuth@mnemon.de>
>>> Date: Monday, August 15, 2005 2:43 pm
>>> Subject: Re: ftp issue cont.
>>>
>>>
>>>> Derick Anderson schrieb:
>>>>
>>>>> FTP passive mode creates an entirely new connection for data
>>>>
>>>> transfer.> It is not 'related' to the original connection and so
>>
>>>> iptables doesn't
>>>>
>>>>> pick it up as such (nor do any other stateful firewalls that I'm
>>
>>>>
>>>> aware> of).
>>>>
>>>> No, not really. Iptables regards FTP data traffic as related
>> stuff. To
>>>> be more exactly, the respective helper module does so
>>>> (ip_conntrack_ftp.[k]o). So, normally all you have to do, is load
>> this
>>>> module, allow ESTABLISHED,RELATED traffic in and out and allow
>> FTP in.
>>>> This looks something like this (assumed that policies are DROP
>> and
>>>> OUTPUT is ACCEPT and also assumed that the box is directly
>>>> connected to
>>>> the internet and that the FTP server is on the firewall box):
>>>>
>>>> modprobe ip_conntrack_ftp.[k]o
>>>>
>>>> iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
>>>> iptables -A INPUT -p tcp --dport 21 --syn -j ACCEPT
>>>>
>>>> This will work for active and passive FTP. If the ftp-module
>> isn't on
>>>> the system in question, varun_saa has to configure the kernel
>>>> correctlyand recompile as needed.
>>>>
>>>> BTW, the original ruleset didn't explain anything. IN|OUTPUT =3D=3D
>> ACCEPT
>>>> and in FORWARD no rule concerning FTP. So, what is this guy doing
>> ? If
>>>> the FTP server is on the firewall box, there is no iptables
>> problem at
>>>> all (on this box). If not, there are no rules that permit FTP and
>> thus
>>>> it cannot work. The whole thing looks quite mysterious to me,
>>>> includingthe -P issue Rob mentioned. May be a tiny ASCII art
>>>> network picture
>>>> would clarify the situation :)
>>>>
>>>> Have a nice time,
>>>>
>>>> Joerg
>>>>
>>>>
>>>>
>>>>
>>>
>>>
>>>
>>> !DSPAM:430073677568926616419!
>>
>>
>
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

iD8DBQFDAmNYst+vzJSwZikRAokXAJ47aeytIFGoZOoWdxPPTbkz3U587QCgwpN5
GS3EPRxQi7Jf/t+dC/1UhDk=3D
=3DGPSL
-----END PGP SIGNATURE-----
--1028002384-951718083-1124229972=:18549--

