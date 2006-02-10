From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Query
Date: Fri, 10 Feb 2006 15:28:22 +0100 (CET)
Message-ID: <50988.193.173.147.3.1139581702.squirrel@webmail.sterenborg.info>
References: <20060210043532.26157.qmail@web8510.mail.in.yahoo.com>
	<56244.193.173.147.3.1139578250.squirrel@webmail.sterenborg.info>
	<859616420602100546w2f9870abi@mail.gmail.com>
	<60942.193.173.147.3.1139580157.squirrel@webmail.sterenborg.info>
	<859616420602100605j42b14cfcy@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <859616420602100605j42b14cfcy@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Fri, February 10, 2006 15:05, David Vogt wrote:
> 2006/2/10, Rob Sterenborg <rob@sterenborg.info>:
>> Yes, but still : can you give me a reason why I would use
>> iptables/netfilter/libipq to sniff and log packets when I can do it wi=
th
>> tcpdump or something ?
>> The OP says <quote>I want to capture IP packets so that I can compress=
 it
>> and
>> then send it to the receiver</quote>. If he just wants to capture pack=
ets,
>> it
>> seems to me that using iptables for this is a bit more difficult.
>>
>
> As far as I understood he wants to modify the packets and reinject
> them. Is this possible with pcdump and ethereal as well? I thought
> they were ... read-only?
> On the other hand ... if he takes care of the communication of the
> packets in any other way (socket or whatever), libipq would not by my
> first choice either.

<quote>
I want to capture IP packets so that I can compress it and then send
it to the receiver. Receiver decompresses it at its side. Is it
possible to do it with iptables?
</quote>

What I understand is that he wants to send (not specified how) packet log=
s to
somebody who can process those (also not specified how).

Oh well, the OP can choose ;-)


Gr,
Rob



