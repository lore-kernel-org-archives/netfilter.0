From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Ping flood
Date: Wed, 2 Nov 2005 16:36:37 -0500 (EST)
Message-ID: <Pine.LNX.4.60.0511021634320.5142@darkstar.sysinfo.com>
References: <43677BFD.3080805@darkstar.nom.za> <4367A11D.8000205@nemesys.hu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4367A11D.8000205@nemesys.hu>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Zoltan Nagy <kirk@nemesys.hu>
Cc: Paulo Andre <pandre@darkstar.nom.za>, netfilter <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



perhaps, but I think the real answer is to not allow icmp traffic to hit 
the braodcast address of the network or subnetwork in consideration, which 
is a slightly, if not totally different issue then multicast traffic 
passing the perimiter.  Though I'm up for educatiting and clues if I am 
mistaken here.

thanks,

Ron DuFresne


On Tue, 1 Nov 2005, Zoltan Nagy wrote:

>
> consider dropping all multicast packets
> $ipt    -d 224.0.0.0/4                  -j DROP
>
>
> Paulo Andre wrote:
>> I have the following log:
>> Nov  1 09:10:40 guardian ---SA_IN--- IN=eth1 OUT=
>> MAC=ff:ff:ff:ff:ff:ff:00:e0:1e:83:d5:19:08:00  SRC=64.34.170.237
>> DST=255.255.255.255 LEN=1072 TOS=00 PREC=0x40 TTL=243 ID=12209 DF
>> PROTO=ICMP TYPE=8 CODE=0 ID=0 SEQ=0
>>
>> I am receiving thousands of these a day, icmp traffic is blocked with
>> iptables. But still this traffic is coming up the line. Is my only
>> solution to contact the ISP or is there something I can do in
>> iptables/linux?
>>
>> Paulo
>>
>>
>

- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFDaTFnst+vzJSwZikRAlzaAJ4pwFiHxbgneeHnq2unfoO1ap7m8ACgzS9j
lylmKFXRvyyJGK8wTWJRyEU=
=CGLX
-----END PGP SIGNATURE-----

