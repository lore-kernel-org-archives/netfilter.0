From: =?gb2312?B?wO7OsLuq?= <liweihuahot@hotmail.com>
Subject: RE: question about connection tracking tcp timeout values
Date: Thu, 8 Nov 2007 09:55:21 +0000
Message-ID: <BAY122-W40007C3ADF194216E5E033BE8B0@phx.gbl>
References: <1C795E2FCD154E46979DDDD5374B5ABE01B99B7B@TTMAIL2.teltone.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1C795E2FCD154E46979DDDD5374B5ABE01B99B7B@TTMAIL2.teltone.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="gb2312"
To: netfilter@vger.kernel.org



> Subject: question about connection tracking tcp timeout values
> Date: Wed, 7 Nov 2007 16:43:43 -0800
> From: hmoroff@teltone.com
> To: netfilter@vger.kernel.org
>
> I'm working on a router application. The application monitors
> activity on the router, and in certain cases it must terminate
> a TCP connection. It does this by watching sequence numbers
> and sending RST to both participants of the connection that it
> wants to cut. I look in /proc/net/ip_conntrack for information
> about the connection (source port) before I cut it.
>
> My problem is that entries in ip_conntrack persist for a short
> time after I cut the connection. If another connection from the
> same client is opened, and if I must cut that one as well then I
> may find both the new connection and the obsolete one in ip_conntrack=
=2E
> This causes my application fits, and I can't find any way to distingu=
ish
> the two sessions.
>
> The solution I've found is to set ip_conntrack_tcp_timeout_wait_close
> and ip_conntrack_tcp_timeout_wait_close down to 1.
>
> I have 2 questions:
> 1. what's the difference between these 2 parameters
> 2. is there going to be a downside to me setting these to 1?
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html

Maybe  you can delete ip_conntrack record when you sending RST to both =
participants of the connection by some tool . you can find it on netfil=
ter's site .

_________________________________________________________________
=D3=C3 Live Search =CB=D1=BE=A1=CC=EC=CF=C2=D7=CA=D1=B6=A3=A1
http://www.live.com/?searchOnly=3Dtrue
