From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: What does nflog_unbind_pf actually do?
Date: Fri, 11 Feb 2011 15:29:36 +0100
Message-ID: <4D5547D0.7020804@netfilter.org>
References: <20110125125426.GA7749@buero.cygnusnet.de> <20110203120052.GA4217@buero.cygnusnet.de> <4D4AAD40.1060204@netfilter.org> <20110203172429.GA8709@buero.cygnusnet.de> <4D4BCD39.7010503@netfilter.org> <20110210085207.GA4042@buero.cygnusnet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110210085207.GA4042@buero.cygnusnet.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 10/02/11 09:52, Helmut Grohne wrote:
> Hi Pablo,
> 
> On Fri, Feb 04, 2011 at 10:56:09AM +0100, Pablo Neira Ayuso wrote:
>> On 03/02/11 18:24, Helmut Grohne wrote:
>>> Thanks for the information. Again I'd need more understanding of the
>>> matter before I can create a patch. (For instance I fail to see why
>>> suppressing ENOBUFS would not help the performane.) The performance
>>> issues on my project seem to have solved themselves in the mean time.
> 
> Rereading what I wrote I figured that the sentence in braces has a
> spurious negation. What I really meant was: For instance I fail to see
> why suppressing ENOBUFS would help/improve the performance.

Suppresing ENOBUFS will help for nfqueue but not for nflog. For nfqueue,
we drop network packets if netlink is congested, for that reason,
disabling ENOBUFS is a good idea in that case.

nfqueue drops packet if the application cannot issue a verdict on them.
Otherwise, we may leak packets.

For the nflog case, the packets are not dropped if netlink is congested,
but you miss some log messages.

>> ENOBUFS means that your application is too slow to handle the amount of
>> messages that the kernel sends to user-space. Basically, the socket
>> queue between kernel and user-space gets full and the kernel starts
>> dropping messages.
>>
>> ENOBUFS is a way to know that you're losing messages. In the particular
>> case of logging, it's telling that your logging has become not fully
>> reliable at some point (because some log lines will be missing).
>>
>> In the case of ctnetlink and nfqueue, the general interpretation of
>> ENOBUFS is the same, but the action that user-space has to do to handle
>> the situation is different.
>>
>> Increasing the socket queue (buffer) helps in the case of ENOBUFS, but
>> under high stress, increasing indefinitely the buffer size is not the
>> way to go.
> 
> Yes, I figured the meaning of ENOBUFS and this mitigation with help from
> Florian Westphal. Still all your writing does not explain why the
> following statement from the Doxygen documentation should be true.
> 
> | To improve your libnetfilter_queue application in terms of
> | performance, you may consider the following tweaks:
> | ...
> |  * set NETLINK_NO_ENOBUFS socket option to avoid receiving ENOBUFS
> |    errors (requires Linux kernel >= 2.6.30).
> 
> I do not need an answer, because my performance issues got solved by
> increasing the socket buffer. On the other hand this makes it clear just
> how much more knowledge is required to write documentation than I have.

The answer is above.

>> Hm, I think I need to write some article on ENOBUFS and netlink.
> 
> Well for people who never heared about it (like me three weeks ago) your
> explanations here are quite helpful. Maybe you should add a note to
> explicitly clarify that receiving ENOBUFS does not indicate a permanent
> breakage of the file descriptor (in contrast to EBADFD).

Yes I can do that, but I get less load of work if others send me a patch
for that :-)

And yes, some more documentation on ENOBUFS in the library may come in
handy. But someone would have to do it.

To know more about netlink, you may want to read:
http://1984.lsi.us.es/~pablo/docs/spae.pdf

> Also I do wonder why the manual page for recv(2) does not list ENOBUFS
> in the list of possible errors. Since posix[1] seems to specify it, it
> looks like a bug in the manual page. *sigh*

This is quite netlink specific and nobody probably sent a patch for it
so far. I encourage you to send a patch to the manpage maintainers. This
is how things work, it's up to you to help others to fix this situation.
