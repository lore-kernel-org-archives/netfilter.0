From: "Grant Taylor" <gtaylor@riverviewtech.net>
Subject: Re: MAC Address masking/NAT
Date: Sat, 18 Oct 2008 14:49:00 -0500 (CDT)
Message-ID: <49916.66.119.9.143.1224359340.squirrel@webmail.riverviewtech.net>
References: <1460c7de0810162313t28b5cd7ete6dda27e534ae55d@mail.gmail.com>
    <1460c7de0810171952naa78102l79536b3089035944@mail.gmail.com>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1460c7de0810171952naa78102l79536b3089035944@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On Fri, October 17, 2008 21:52, Timothy Toole wrote:
> I've tried the following two rules (independently):
> # ebtables -t nat -A POSTROUTING -j snat --to-src 11:11:11:22:22:22
--snat-arp
> and
> # ebtables -t nat -A POSTROUTING -j snat --to-src 11:11:11:22:22:22
--snat-arp -s 55:44:33:22:11:00
>
> The result is that the traffic destined to Host A has the "new/faked"
MAC address, but the return traffic back to Host B still has the faked
address (and thus is ignored by the host).
>
> Does a corresponding DNAT rule need to be made in the  PREROUTING nat
chain?

Hum...  Let me think about this / look through notes / get more sleep
(currently 3 hours in the last 36) and get back with you.  However in my
current sleep deprived state, you may indeed have to DNAT traffic.

> Whoops. The ebtables project page states to post questions to the
netfilter list (http://ebtables.sourceforge.net/contact.html)

*Whaa???*

That's news to me.  I've been an active subscribed member to the EBTables
list (answering questions like a good little Tux) for three or more years
and I had absolutely no idea that the mailing lists were deprecated.  That
explains the lack of traffic of late and why messages like yours have
appeared here on the IPTables mailing list.

> Thanks again.

*nod*

More sleep and I'll try to give a better answer.



Grant. . . .

