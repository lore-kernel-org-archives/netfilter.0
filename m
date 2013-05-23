From: Wim Vandersmissen <Wim.Vandersmissen@kuleuven.be>
Subject: ipset and hash:net,port,net set
Date: Thu, 23 May 2013 17:48:40 +0000
Message-ID: <C662177C398FC342AAE60CBE7593707D107DC4A7@ICTS-S-MBX3.luna.kuleuven.be>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,
=20
I=92m redesigning our firewall to use as much as ipset as possible inst=
ead. (great tool)
But we have rules that allow a specific source range to some ports for =
a specific destination range.
So the one type of set I=92m missing at the moment is hash:net,port,net
Of course I could put this in hash:ip,port,net but the hash would get r=
ather big when using /16=92s
=20
So I=92m wondering if this could be implemented, or maybe done in a dif=
ferent way that I don=92t see yet :)
=20
Thanks,
