From: "Leonid Zeitlin" <lz@csltd.com.ua>
Subject: Re: Invalid SACK numbers in NAT'ed packets
Date: Fri, 25 Apr 2008 11:50:28 +0300
Message-ID: <006b01c8a6b1$884da030$5101a8c0@csltd.intranet>
References: <funk78$srq$1@ger.gmane.org> <Pine.LNX.4.64.0804232126040.28881@blackhole.kfki.hu> <00c101c8a5ea$d83213f0$5101a8c0@csltd.intranet> <Pine.LNX.4.64.0804241130040.30382@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

Thanks, Jozsef, I see.
It appears that short of writing a custom netfilter extension, there's no 
way to turn off SACKs on a particular connection. Is this right?

Thanks,
  Leonid

----- Original Message ----- 
From: "Jozsef Kadlecsik" <kadlec@blackhole.kfki.hu>
To: "Leonid Zeitlin" <lz@csltd.com.ua>
Cc: <netfilter@vger.kernel.org>
Sent: Thursday, April 24, 2008 12:33 PM
Subject: Re: Invalid SACK numbers in NAT'ed packets


> On Thu, 24 Apr 2008, Leonid Zeitlin wrote:
>
>> > or use IPV4OPTSTRIP for the SYN packets sent/received in this direction 
>> > as
>> > a selective workaround for the problem.
>>
>> What is IPV4OPTSTRIP? How can I get it? It's not in standard iptables 
>> (not the
>> one that I have anyway), and I can't find it at the netfilter site 
>> either.
>
> It's a target extension which can be found in patch-o-matic-ng. But sorry,
> I mixed up: it strips off IPv4 options and not TCP options, so it'd not
> help.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>          H-1525 Budapest 114, POB. 49, Hungary
> 

