From: Alessandro Vesely <vesely@tana.it>
Subject: Re: Links to projects using netfilter
Date: Sat, 27 Dec 2008 12:43:45 +0100
Message-ID: <495614F1.5070903@tana.it>
References: <4954EEA7.7000302@tana.it> <4955116C.7010806@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4955116C.7010806@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Nick <vbox.nick@gmail.com>
Cc: netfilter@vger.kernel.org

Nick wrote:
> Alessandro Vesely =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> IPQ BDB maps an IP Queue to a Berkeley DB indexed on the ipv4
>> field. More at https://savannah.nongnu.org/projects/ipqbdb/
>>
> The NFQUEUE target is nice feature. I using perl ( module ) for inspe=
ct=20
> and accounting network traffic, but perl script works slow. If the=20
> bandwidth of more than 2MBit/s, the cpu loading is 50% (C2D E6550).
> Here is a program written in C, works much faster and less weight CPU=
 1-2%.

Besides being written in C, using BDB makes it very fast. On the 5th=20
day I had 9140 records and the following /top/ output
PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  SWAP   CODE DATA COMMAND
15   0 10376 1308 1172 S    0  0.0   0:02.05 9068   16  252 ipqbdbd
18   0  9500 1312 1152 S    0  0.0   0:31.78 8188   32  256 ibd-parse

The second line above is a daemon that applies 5 pcre expressions to=20
each mail.log line, in order to catch attackers: it consumes 15+ times=20
more than issuing verdicts (both configured for a single queue.)
