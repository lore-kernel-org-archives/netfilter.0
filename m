From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: connlimit performance
Date: Tue, 15 Jan 2013 10:49:58 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1301151012570.16853@nerf07.vanv.qr>
References: <CAJygYd1435Juip=6rMVyF5oQ7F53+eMB_ezAptJ0OVy7N02=aA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJygYd1435Juip=6rMVyF5oQ7F53+eMB_ezAptJ0OVy7N02=aA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?B?5Y+26Zuo6aOe?= <sunyucong@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tuesday 2013-01-15 07:32, =E5=8F=B6=E9=9B=A8=E9=A3=9E wrote:

>Hi,
>
>Is anyone here have experience on connnlimit performance?   I am
>trying to use it to limit connection per dest IP (about 1K of them )
>on a 100Mbps firewall.  (without only about 70k connections) and as
>soon as put this rule in, cpu usage sky raise.


connlimit uses a fixed hash table of 256 buckets and thus a lot less=20
optimal than hashlimit's default table-size of 4096 buckets (assuming=20
a machine with >=3D 1 GB RAM and 64-bit kernel).
