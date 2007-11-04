From: =?gb2312?B?wO7OsLuq?= <liweihuahot@hotmail.com>
Subject: RE: iptables NAT logging
Date: Sun, 4 Nov 2007 01:46:21 +0000
Message-ID: <BAY122-W239F4F4006EC22445FD3E9BE8F0@phx.gbl>
References: <472AE429.1060906@bristol.ac.uk>
 <472B3B63.7000203@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <472B3B63.7000203@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="gb2312"
To: netfilter@vger.kernel.org



> Date: Fri, 2 Nov 2007 09:59:47 -0500
> From: gtaylor@riverviewtech.net
> To: netfilter@vger.kernel.org
> Subject: Re: iptables NAT logging
>
> On 11/02/07 03:47, Jonathan Gazeley wrote:
>> My NAT solution is implemented in iptables and works fine. The loggi=
ng
>> partially works but the problem is this: I am logging pre NAT, and m=
y
>> log shows the internal IP and port, and the destination IP and its p=
ort.
>> But it does not show the port used by the NAT box to talk to the
>> external IP. Logging post NAT would never detect any packets. If I w=
as
>> able to long pre and post NAT I would be able to log all the informa=
tion
>> I need.
>
> Ugh, this could be problematic. If I understand you correctly, you
> essentially need to log the following information. I also suspect tha=
t
> it needs to be per connection NOT per packet. Correct?
>
> Internal Source IP
> Internal Source Port
> External Source IP (post NAT)
> External Source Port (post NAT)
> External Destination IP
> External Destination Port
> Protocol
>
> I'm not sure if you will want to log the IP level protocol or not, bu=
t
> it may be a good thing to do.
>
> I would suggest that you do this logging in the NAT table so that you
> only log the initial packet and not each and every packet that passes
> through.
>
> I'm presuming that you are already logging when the connection
> initiates. Do you also want to log when the connection terminates?
>
> I unfortunately don't have access to a Linux box doing NATing at the
> moment to know for sure. However I suspect that some of the external
> information you are needing can be obtained from the connection track=
ing
> / NATing sub system. You may need to use some sort of user space
> process or write a match extension and / or a target that will grab t=
he
> external post nat information that you need.
>
> I would also suggest that you find an optimal way to store the logged
> information. I don't think that a TCPDump file, or a libcap output fi=
le
> will suffice because normally they only refer to two sets of IP and
> Port, not three like you need.
>
> Another option that may work is to mark each packet in some fashion a=
nd
> log it before and after NATing. However seeing as how dynamic things
> are I think it would be very impractical to ""mark packets in the
> traditional sense.
>
> Thinking about the last idea... If you could somehow augment the LOG
> target to also include the connection tracking information (ID if you
> will) you could probably log pre and post NAT and then just have
> multiple records that you would need to pull to correlate your
> information, say connection tracking ID, source IP, source port,
> destination IP, and destination port both before and after. This way
> you would have everything that you need.
>
> I still feel like your best solution is going to be the first idea, w=
ork
> with the connection tracking sub system.
>
>
>
> Grant. . . .
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html


'$IPT -t nat -A POSTROUTING -m state --state NEW -j LOG' can log new co=
nnection  include  internal source ip port and external source ip port =
=2E..... =20
And '$IPT -t filter -A FORWARD -m state --state NEW -j LOG' can log new=
 connection include internal source ip port and external dest ip port .=
=2E.....
_________________________________________________________________
=D3=C3 Live Search =CB=D1=BE=A1=CC=EC=CF=C2=D7=CA=D1=B6=A3=A1
http://www.live.com/?searchOnly=3Dtrue
