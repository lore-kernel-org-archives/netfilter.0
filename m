From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Re: Brouter basic question .
Date: Tue, 30 Mar 2010 16:22:26 +0200
Message-ID: <4BB20922.20704@unipex.it>
References: <cfeab66d1003300601l140102e0nd8111713140044b5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d1003300601l140102e0nd8111713140044b5@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org

ratheesh k ha scritto:
> Hi ,
>
>   i have a rule
>
>             ebtables -t broute -A BROUTING -j ACCEPT .
>
> So packet wont traverse any other chain ?  ( Prerouting , Input ,
> Forward , Postrouting ) ???
>

http://ebtables.sourceforge.net/br_fw_ia/br_fw_ia.html

And

http://ebtables.sourceforge.net/br_fw_ia/PacketFlow.png

broute and iptables chains are different things.

Michele
