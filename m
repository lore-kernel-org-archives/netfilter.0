From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Delay in responding caused by netfilter ?
Date: Fri, 29 Apr 2005 13:45:59 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0504291344460.21818@darkstar.sysinfo.com>
References: <42721F84.6080503@mnemon.de>
	<200504290937.49507.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1429134960-773139243-1114796759=:21818"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200504290937.49507.Alistair@nerdnet.ca>
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
To: Alistair Tonner <Alistair@nerdnet.ca>
Cc: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1429134960-773139243-1114796759=:21818
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by darkstar.sysinfo.com id
	j3THk5Pv021840

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


sendmail likes to do an ident check and will slow if port 113 is not=20
allowed to talk, popd might as Allister hints do the same, add rules to=20
allow ident to pass and see if things run swifter.

Thanks,

Ron DuFresne

On Fri, 29 Apr 2005, Alistair Tonner wrote:

> On April 29, 2005 07:50 am, J=F6rg Harmuth wrote:
>> Hi all,
>>
>> Situation:
>>
>> 2 independant servers, one running RH7.2, the other SuSE8.1, with the
>> same symptoms. There is a delay between the TCP/IP habdshake and the
>> server greeting of 26 seconds (SuSE) or 32 seconds respectively (RH).
>> Indeed everything is working, but there is this delay. Some tcpdump:
>>
>> tcpdump -n -i bond1 'tcp[1] =3D=3D 110 or tcp[3] =3D=3D 110'
>> tcpdump: listening on bond1
>
> 	This gets us the connection you are looking at, but drops anything els=
e.  So
> -- we can't see things that MIGHT be going wrong.
>>
>> 13:25:24.835287 10.10.10.100.60719 > 81.169.151.156.110: S \
>> 3714172130:3714172130(0) win 5840 <mss 1460,sackOK,timestamp \
>> 335589204 0,nop,wscale 0> (DF) [tos 0x10]
>>
>> 13:25:24.879667 81.169.151.156.110 > 10.10.10.100.60719: S \
>> 2643711030:2643711030(0) ack 3714172131 win 5792 <mss \
>> 1460,sackOK,timestamp 17886154 335589204,nop,wscale 0> (DF)
>>
>> 13:25:24.879702 10.10.10.100.60719 > 81.169.151.156.110: . ack 1 win \
>>     5840 <nop,nop,timestamp 335589209 17886154> (DF) [tos 0x10]
>>
>> 13:25:50.964202 81.169.151.156.110 > 10.10.10.100.60719: P 1:35(34) \
>> ack  1 win 5792 <nop,nop,timestamp 17888762 335589209> (DF)
>>
>> 13:25:50.964224 10.10.10.100.60719 > 81.169.151.156.110: . ack 35 \
>> win 5840 <nop,nop,timestamp 335591818 17888762> (DF) [tos 0x10]
>>
>
> I'm wondering if that pop3 server is trying to do an identd check on th=
e
> connection that is getting *b0rked* with the firewall up.  Try that dum=
p
> again and loosen the filter a tad.
>
>> ...
>>
>> This seems to concern only services that are started by inetd, so I
>> thought inetd would cause this delay. But when I empty the chains (onl=
y
>> having a default policy of ACCEPT, nothing more) this delay vanishes a=
nd
>> everything is working as expected.
>
> 	That might be part of the problem, but thing of what inetd/xinetd migh=
t be
> doing to authenticate the connection before they start the server.
>>
>> Complete ruleset:
>>
>> *filter
>>
>> :INPUT DROP [343:76556]
>> :FORWARD DROP [0:0]
>> :OUTPUT DROP [1648:107018]
>>
>> -A INPUT -i lo -j ACCEPT
>> -A INPUT -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT
>> -A INPUT -p tcp -m tcp --dport 22222 -m state --state NEW \
>>    --tcp-flags SYN,RST,ACK SYN -j ACCEPT
>> -A INPUT -p tcp -m tcp --dport 443 -m state --state NEW \
>>    --tcp-flags SYN,RST,ACK SYN -j ACCEPT
>> -A INPUT -p tcp -m tcp --dport 25 -m state --state NEW \
>>    --tcp-flags SYN,RST,ACK SYN -j ACCEPT
>> -A INPUT -p tcp -m tcp --dport 110 -m state --state NEW \
>>    --tcp-flags SYN,RST,ACK SYN -j ACCEPT
>> -A INPUT -p tcp -m tcp --dport 80 -m state --state NEW \
>>    --tcp-flags SYN,RST,ACK SYN -j ACCEPT
>> -A INPUT -p tcp -m tcp --dport 22 -m state --state NEW \
>>    --tcp-flags SYN,RST,ACK SYN -j ACCEPT
>> -A INPUT -p tcp -m tcp --dport 21 -m state --state NEW \
>>    --tcp-flags SYN,RST,ACK SYN -j ACCEPT
>> -A INPUT -p tcp -m tcp --dport 990 -m state --state NEW \
>>    --tcp-flags SYN,RST,ACK SYN  -j ACCEPT
>> -A INPUT -p tcp -m tcp --dport 21000:21199 -m state \
>>    --state NEW --tcp-flags SYN,RST,ACK SYN -j ACCEPT
>> -A INPUT -p udp -m udp --dport 53 -j ACCEPT
>> -A INPUT -p udp -m udp --dport 123 -j ACCEPT
>> -A INPUT -p udp -m udp --sport 53 -j ACCEPT
>> -A OUTPUT -o lo -j ACCEPT
>> -A OUTPUT -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT
>> -A OUTPUT -p udp -m udp --sport 123 -j ACCEPT
>> -A OUTPUT -p udp -m udp --sport 53 -j ACCEPT
>> -A OUTPUT -p udp -m udp --dport 53 -j ACCEPT
>> COMMIT
>>
>> Nothing complicated in my eyes. I have absolutely no idea how this tin=
y
>> ruleset can cause such delays or - at least - is involved in this.
>>
>> Any ideas are highly welcome.
>>
>> Thanks and have a nice time,
>>
>> Joerg
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

iD8DBQFCcnLbst+vzJSwZikRAiuwAKCdITbONycqJqFhl0uyzkCmyA5ozQCg00Ao
ZHlhWDO0ZJiGcUg3zOIbVeY=3D
=3DTjkr
-----END PGP SIGNATURE-----
---1429134960-773139243-1114796759=:21818--

