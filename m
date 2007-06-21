From: "Tercio F. Gaudencio Filho" <terciofilho@gmail.com>
Subject: Netfilter Hooks
Date: Wed, 20 Jun 2007 22:41:41 -0300
Message-ID: <f9432b90706201841p7cf4cf95u25dcaa0a55124fac@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=mcqWrNyxXqjdoibbpY9HRaP+dvFS8U5NgT9oTBfdhRZv3X/lOtaJ2ibgRfg9lNatewjN0b59uefLTDzkCJtBYzFO1rvfxk0RsDJ/833TSOeqP/MF90qRFA7HGD/Ai2tb5024LD4YZN8IRaM9KatuyFEp5ZGTCr65EUOAXGXGE0U=
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi All!

I'm new in Netfilter world and I'm with some doubts...

I want to create "something" that can analyze packets that get in and
get out from my machine, but I want to analyze the packet data not
it's origin or destination, it's content.

Imagine that I want to create a filter, that blocks/allow every packet
that contains the word, for example, "GOOGLE" in it. I don't want to
block a packet deriving from some IP, or something like that, I want
to filter the content. For example, be able to parse a XML file in a
packet, or parse some protocol, something like that.

Question, is it possible to do with netfilter hooks? I read sometime
ago, about netfilter hooks, and it seems to be pretty simple, with
restrictions.... but I'm not sure about that.

If not possible with netfilter hooks, is that possible in another way?
Which way?

Thanks all!

Tercio.

