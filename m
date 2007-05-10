From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Filter a TCP stream based on a text appearing in the initial IP
 packet of the stream
Date: Thu, 10 May 2007 23:25:51 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705102321570.6426@yvahk01.tjqt.qr>
References: <22b256140705100551q3a67e680nb184c23f4966cb1d@mail.gmail.com>
	<Pine.LNX.4.61.0705101611360.32349@yvahk01.tjqt.qr>
	<464377CC.7000502@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <464377CC.7000502@plouf.fr.eu.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org


On May 10 2007 21:51, Pascal Hambourg wrote:

>> > I know that there is a certain phrase at the top of the
>> > website, let's say "foobar", which will therefore be part of the first
>> > IP packet of this TCP stream.
>
> Do you mean the page title enclosed in the <title> tag, which most browsers
> conveniently display in the title bar ?
> No, it is not part of the first IP packet. The first packets in a TCP stream
> are SYN packets used for synchronisation, which contain no TCP data.

Well. One may match by l7 or similar, and filter by it. But NAT
operations need to happen on the very first packet.

That said, magically -A OUTPUT -m layer7 --l7proto http never worked
for me, i.e. the counters just did not increase.

>> The first return packet is not guaranteed to carry the first byte
>> of the HTML page.
>
> Don't you mean "the first return packet *is* guaranteed *not to* carry the
> first byte of the HTML page", or "the first return TCP *segment* is not
> guaranteed to carry the first byte of the HTML page" ? ;-)

"The packet that contains the first byte of the HTTP reply may not
necessarily carry the first byte(s) of the HTML/XML/etc. data."

>> -m string --string foobar -j CONNMARK --set-mark 1
>> -m connmark --mark 1 -j DROP/REJECT/whatever.
>
> Does this work if the string is split in two consecutive segments ?

I suppose not, hence l7 exists (also because it can do regexp).


	Jan
-- 

