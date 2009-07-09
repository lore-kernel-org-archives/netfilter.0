From: Benedikt Gollatz <ben@differentialschokolade.org>
Subject: Re: Problem with IPv6 tunnel
Date: Thu, 09 Jul 2009 16:51:20 +0200
Message-ID: <5b933efdfd09476e4b00a15fe5dc3ac0@localhost>
References: <9948385e0906190131q58ba27c6ye625b662945f63ac@mail.gmail.com> <9948385e0907090448j566df6cdv961973e398b8b73b@mail.gmail.com> <9948385e0907090606x1d33d7abw64c38e7ac6238cc3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9948385e0907090606x1d33d7abw64c38e7ac6238cc3@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter@vger.kernel.org

On Thu, 9 Jul 2009 15:06:52 +0200, David Bala=C5=BEic <xerces9@gmail.co=
m>
wrote:
> iptables -A input_wan --proto 41 -s 3.4.5.6 -j ACCEPT

Doing this in the filter tables is too late. You need to accept proto-4=
1
packets in the PREROUTING chain to stop the connection tracker from loo=
king
at them.

You can check "conntrack -L" to see which connections are being tracked=
=2E
