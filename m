From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: learning to understand iptables
Date: Wed, 3 Nov 2021 15:51:33 +0000 (GMT)
Message-ID: <85e869fc-bded-c41-db86-91dfbcf5de@jubileegroup.co.uk>
References: <b4aec750-bbeb-eb72-33f6-01d1e64c6949@sunrise.ch>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <b4aec750-bbeb-eb72-33f6-01d1e64c6949@sunrise.ch>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: serando <serando@sunrise.ch>
Cc: netfilter@vger.kernel.org

Hi there,

On Wed, 3 Nov 2021, serando wrote:

> At the moment I am reading a book about iptables. It's very hard to 
> understand.

My guess is that it is hard to understand because you do not have a
sufficient background understanding of networking in general.

> My system:
> An office desktop PC i5-4570.
> My PC does not offer any services for the internet. It is used for serving 
> the web only. And I have installed a virtual machine (with a windows guest). 
> Samba is used to communicate with my virtual-machine (VirtualBox).
> I have no (internal) network. And the PC is behind a router.

Your description gives me confidence that my guess is right.  For
example, if your PC is behind a router then indeed you do have an
internal network; that is how the PC communicates with the router.

> I know, that my system does not need an iptables firewall.

Perhaps.  Perhaps not.  I am inclined to think that it can't hurt, if
it's done properly. :)

> But I am just interested to understand the very basics of iptables.

Good. :)

> This is why I am reading a book about iptables. So I would be happy to ask 
> questions about iptables from time to time.
>
> Is this OK for you?

It's perfectly OK for me, but you might find that you will get more
and better responses from others if your questions are very specific.

To begin with, look at the netfilter site documentation page:

https://netfilter.org/documentation/index.html

Be aware that iptables is

(a) confusing enough in itself, partly because it can be used to refer
to a simple command-line tool or an entire packet filtering framework,
sometimes in the same breath, and

(b) gradually being replaced, currently by 'netfilter', which I find
_very_ much more confusing than ever I found iptables.

Long ago I started to learn about networking with the Net-3-HOWTO.  It
will still be available online, and if I had to start again that's the
place I'd probably start.  The nearest that I can see on the netfilter
documentation page is the "Networking Concepts HOWTO" but that's even
older than the Net-3-HOWTO.  I'm neither an expert nor current on the
state of the documentation, others here might have better suggestions.

-- 

73,
Ged.
