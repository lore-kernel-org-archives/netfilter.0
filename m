From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: simple connection bridging
Date: Mon, 14 Apr 2008 19:14:29 -0500
Message-ID: <4803F365.1080105@riverviewtech.net>
References: <5d97c170804121439m44ef9243r466dc7e106f0d947@mail.gmail.com>	 <4801622E.1060407@bofhland.org>	 <5d97c170804130410p400d523bs118b8885b5c1548a@mail.gmail.com>	 <alpine.LNX.1.10.0804132100520.9651@fbirervta.pbzchgretzou.qr>	 <48030D4B.1040204@bofhland.org>	 <alpine.LNX.1.10.0804141244260.9651@fbirervta.pbzchgretzou.qr>	 <48033984.9060206@bofhland.org>	 <5d97c170804141239t1ea0a2c0j6a7f865b508fccb2@mail.gmail.com>	 <4803B81B.5010201@riverviewtech.net> <5d97c170804141526m27dd597cw8d2cdb2d8656bb00@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5d97c170804141526m27dd597cw8d2cdb2d8656bb00@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 4/14/2008 5:26 PM, Peter Boughton wrote:
> Thanks Grant.

You are welcome.

> As little as I can get away with - I know it's a problematic entity, 
> but (afaik) it's the only way to share the connection. (It's a 3G 
> connection, and appears as dialup)

Ah, there is the missing piece of the puzzle.  I can see how you are 
tied to where you can get the card to work.

> Yeah, I have a vague grasp of concepts, but with lots of holes, and 
> not much practical knowedge.

That's ok.  Knowing what you do and don't know and trying to learn more 
is a lot better than incorrectly thinking that you know it all.

> Your explanations are helping me to make sense of it though, so 
> thanks. :)

You are welcome.

> Yep, that's correct. I've got an image that shows the same with 
> pretty pictures here: 
> http://hybridchill.com/misc/network_setup_small.png

*nod*

Do you have any plans to remove Midnight (I) from the network down the 
road?  In other words is Midnight (I) just in the picture long enough 
for you to move the 3G internet connection to Photon (L)?

> So far it appears that I've got it working with static IPs. Someone 
> has said DHCP is possibly a better way on the Puppy Linux forum, but 
> given that it's working at the moment I'm okay with leaving it on 
> static, unless there's any specific advantages to doing otherwise?

I'm glad that you got ICS working.  The last time I messed with ICS 
(Windows 98) I had to have the clients DHCP.

Honestly, the static will work out better.  Midnight (I) will have to 
route through Photon (L) to be able to get to Silver (M).  I'm not aware 
of any way to dynamically augment the routing table on Midnight (I) with 
out doing some *VERY* *NASTY* scripting / hacking.  With Photon (L) 
having a static IP, you can put a persistent static route on Midnight 
(I) to be able to get to the network that Silver (M) is on via Photon 
(L).  I.e.:

route -p ADD 192.168.1.0 MASK 255.255.255.0 192.168.0.10 METRIC 1

Will add your persistent route on Midnight (I).

> Thanks,

You are welcome.



Grant. . . .
