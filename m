From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: port based routing - help with tcpdump
Date: Tue, 09 Nov 2010 20:43:09 +0100
Message-ID: <4CD9A44D.80504@plouf.fr.eu.org>
References: <AANLkTik6E8KDgN8S+J952ULLpzUjy2yAY9oNA1jv+ZEJ@mail.gmail.com>	<4CD7CD88.6010100@plouf.fr.eu.org>	<AANLkTimeCfv9i13L9PFpOxTRbzG4c4Qpa7XO5quK2CEY@mail.gmail.com>	<AANLkTikRY6mYY5fAAN4Ey-BaOQSOiXtx-StUejyQGG+x@mail.gmail.com>	<4CD97137.5000706@plouf.fr.eu.org> <AANLkTikTJqQj7ARSbr4XrK6oUwQiZDQmQjBUuSR6u3yG@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikTJqQj7ARSbr4XrK6oUwQiZDQmQjBUuSR6u3yG@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ilo Lorusso <sneak147@gmail.com>
Cc: netfilter@vger.kernel.org

Ilo Lorusso a =E9crit :
> Yes I can see the traffic coming back when I do a tcpdump...
>=20
> you can see  172.69.128.107 access 74.125.79.104.http and then
> 74.125.79.104.http  talks back to 172.69.128.107 ,
> now this is encapsulated in a GRE tunnel as my alt interface is a GRE
> tunnel but it works for the local box.. as per my previous post a
> couple days ago...
>=20
> below is the sample of the tcpdump,
>=20
> 18:26:21.722567 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
> 172.69.128.107.elatelink > 74.125.79.104.http: Flags [S], seq
> 224859509, win 65535, options [mss 1460,nop,nop,sackOK], length 0

> 18:26:21.982269 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
> 74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
> 192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK]=
,
> length 0

> 18:26:21.982316 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
> 74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
> 192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK]=
,
> length 0

This is the same SYN/ACK segment that was just received, encapsulated
and sent again and received again and sent again...
Looks like you have a loop. Check your routing rules.

