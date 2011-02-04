From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: What does nflog_unbind_pf actually do?
Date: Fri, 04 Feb 2011 10:56:09 +0100
Message-ID: <4D4BCD39.7010503@netfilter.org>
References: <20110125125426.GA7749@buero.cygnusnet.de> <20110203120052.GA4217@buero.cygnusnet.de> <4D4AAD40.1060204@netfilter.org> <20110203172429.GA8709@buero.cygnusnet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110203172429.GA8709@buero.cygnusnet.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Helmut Grohne <h.grohne@cygnusnetworks.de>

On 03/02/11 18:24, Helmut Grohne wrote:
> On Thu, Feb 03, 2011 at 02:27:28PM +0100, Pablo Neira Ayuso wrote:
>> On 03/02/11 13:00, Helmut Grohne wrote:
>>> On Tue, Jan 25, 2011 at 01:54:27PM +0100, Helmut Grohne wrote:
>>>> libnetfilter-log src/libnetfilter_log.c:
>>>> | /**
>>>> |  * nflog_unbind_pf - unbind nflog handler from a protocol family
>>>> |  * \param h Netfilter log handle obtained via call to nflog_open()
>>>> |  * \param pf protocol family to unbind family from
>>>> |  *
>>>> |  * Unbinds the given nflog handle from processing packets belonging
>>>> |  * to the given protocol family.
>>>> |  */
>>>
>>> This comment is indeed very misleading.
>>
>> Let's fix it then :-)
> ...
>> Please, would you send me a patch so others can benefit for this
>> conclusion in the official documentation? I'd appreciate it.
> 
> I just touched the surface of what is going on here. It would certainly
> be better if someone with more oversight would try to fill in this gap.

If you send a patch, I can complete/mangle it to include and to correct
imprecise information ;-)

>> There is other things that you can do to avoid ENOBUFS, it is documented
>> in libnetfilter_queue but it also applies to libnetfilter_log:
>>
>> http://www.netfilter.org/projects/libnetfilter_queue/doxygen/
>>
>> See performance, the last two items do not apply to libnetfilter_log.
>> Another patch for this would be great.
> 
> Thanks for the information. Again I'd need more understanding of the
> matter before I can create a patch. (For instance I fail to see why
> suppressing ENOBUFS would not help the performane.) The performance
> issues on my project seem to have solved themselves in the mean time.

ENOBUFS means that your application is too slow to handle the amount of
messages that the kernel sends to user-space. Basically, the socket
queue between kernel and user-space gets full and the kernel starts
dropping messages.

ENOBUFS is a way to know that you're losing messages. In the particular
case of logging, it's telling that your logging has become not fully
reliable at some point (because some log lines will be missing).

In the case of ctnetlink and nfqueue, the general interpretation of
ENOBUFS is the same, but the action that user-space has to do to handle
the situation is different.

Increasing the socket queue (buffer) helps in the case of ENOBUFS, but
under high stress, increasing indefinitely the buffer size is not the
way to go.

Hm, I think I need to write some article on ENOBUFS and netlink.
