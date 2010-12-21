From: Reuben Martin <reuben.m@gmail.com>
Subject: Re: ipsets: examples?
Date: Tue, 21 Dec 2010 10:54:06 -0600
Message-ID: <AANLkTi=9HYAAhbj4eauqzYm07OJeS+jmNVY=rtgad6Fd@mail.gmail.com>
References: <201012192237.43878.reuben.m@gmail.com>
	<alpine.DEB.2.00.1012201622001.14191@blackhole.kfki.hu>
	<201012201418.14281.reuben.m@gmail.com>
	<alpine.DEB.2.00.1012211032420.15250@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=p1FmQ6aBDel94VLJD1LrF7hivrFedMQxnyPozg7Sxvw=;
        b=XBSQAJft0w3/zYwGD/99hxe6VZkli/VUIuV8khV6nSOvDN/DT0ul6HsuSZmV5OzlUw
         gyf6vBk5WBcupji2doc1PP5RkZU/Ql0S0NeKrDHadFmrKDXVtC+ppMRxegSGs5I9tCxJ
         7oSSC/ibZQaNZ5EXAIXRyUxVWJoXPiBwD0aVE=
In-Reply-To: <alpine.DEB.2.00.1012211032420.15250@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

On Tue, Dec 21, 2010 at 3:36 AM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Mon, 20 Dec 2010, Reuben Martin wrote:
>
>> On Monday, December 20, 2010, Jozsef Kadlecsik wrote:
>> >
>> > On Sun, 19 Dec 2010, Reuben Martin wrote:
>> >
>> > > I'm trying to put together an extension to forward udp packets to an
>> > > arbritary set of destinations using ipsets. Specifically I want the
>> > > extension to be able to take either an ipmap or iphash as a set of
>> > > destinations for the forwarded udp packets. (I'm starting with the
>> > > rawdnat, stripping out the tcp code, and changing it so that it
>> > > duplicates the packet as needed for destinations instead of changing the
>> > > dest address in the origional packet.
>> >
>> > I don't really see why you need to embed ipset. Why don't you call it as a
>> > normal match and use your extension as a target?
>>
>> I think I have misunderstood what can be done with ipsets. I knew you
>> could use it as a match, but for some reason I though it had an API to
>> allow other extensions to use sets as targets. (i.e. my intention is, as
>> you suggested, to use the extension as a target)
>
> But what is the difference between
>
> ... -m set --match-set foo src -j YOUR_TARGET
>
> and
>
> ... -j YOUR_TARGET
>
> where your target calls internally the same or hardcoded ipset match?

The difference is that I'm not really concerned about the -m option at
all. Any of the existing match methods are sufficient.

I want to be able to do:

... -j MY_TARGET --ipset foo

where MY_TARGET would iterate over the members of foo, and for each
member of foo the original packet is duplicated, the duplicate's
destination is changed to the address value of the member, checksums
recalculated, and sent on it's way.

My intent is to be able to take RTP media stream packets, and
transparently forward them to a dynamically changing group of
destination addresses.in a network where multicast is not an option.
I'm sure there might be other uses for it, but that's all I'm
concerned about at the moment.

>
>> Is there any way via the standard API to request the contents of a named
>> set? That's really what I want to do. Basically for each packet I would
>> request I want to be able to check what addresses are in the set named
>> in the parameters of my extension, and then copy the packets to each of
>> those addresses, and hence have a dynamic list of destination addresses.
>
> In my previous mail I wrote about the current API and possibilities.
>

Yes, thank you so much. I finally got home last night and was able to
take a look at it. I think that in order to do what I want, ipset
would need a new exported function that would provide access to
members of a set.

-Reuben
