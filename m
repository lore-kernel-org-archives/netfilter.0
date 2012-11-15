From: =?UTF-8?Q?J=C3=B6rn_Krebs?= <jk@smartbyte.de>
Subject: Re: VoIP conntrack issue
Date: Thu, 15 Nov 2012 18:43:17 +1100
Message-ID: <CABY2qi8QcstBOJnozEn38aV=j7HLhex_-biq5xmKsYzyyCwzcQ@mail.gmail.com>
References: <CABY2qi8n0ttC99_UktcT+Jwnd9WCCsvk5+ug1GXrrYbd9ixxWw@mail.gmail.com>
 <alpine.LNX.2.01.1211150035180.32273@nerf07.vanv.qr> <CABY2qi9AnCJDXUFxo_ocUwU0dCmUEJ4W8aMQUbVBmRcS_=5EzA@mail.gmail.com>
 <alpine.LNX.2.01.1211150553090.7649@nerf07.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=BQLEX6kfP6cHrRr31ivPFTIlmkBhh5Wv/okXTUi1pJ0=;
        b=rUHDxEZJj9dtmJS/8ZyT2H9XJpUB95oEX4b7t6cIS1Q0sMIysLURzss3VJVPJDDNIH
         BaI4NkNETQ6DelyU45QAYqlZ1C+FoWLRGBdGi+tvuOnjYQzT3j5AxitXzTo45+WtKxj8
         ORZl3jB8mboOehjOumvXhxMaa+vwPeoxAS6nzDQltiAprG5RsU8895ln3fG9O4d23I3d
         y94d9X+nRvsLCYoDZelPRtA3n0pSEJa4UrdfTwdinEMbZW8dzbDxvZGfOchzi5JiXo7r
         tfvgJlOkvU25Ru6xKTYCewNY0b4v+cSi9vXPuOiluBQBnB6MNj3p9xkdO+Kz+Xe/cT5X
         93sQ==
In-Reply-To: <alpine.LNX.2.01.1211150553090.7649@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter <netfilter@vger.kernel.org>

Hi there,

On Thu, Nov 15, 2012 at 4:04 PM, Jan Engelhardt <jengelh@inai.de> wrote=
:
> On Thursday 2012-11-15 01:15, J=C3=B6rn Krebs wrote:
>
>>Hi,
>>
>>I think you don't get the point.
>
> I really think I don't. Which means your description was too convolut=
ed.
Yes, maybe I should describe it even easier, so you understand it...

>>I WANT A SYMMETRIC NAT!!!! -> Why doesn't anybody understand that?
>>I mean I am on the netfilter list. Everyone here should know what I
>>mean with the term symmetric NAT
>
> NF does not use these terms, so no. WP also warns about the problems
> with the term in http://en.wikipedia.org/wiki/Symmetric_NAT .
No, he does not, he warns that people use it, although they have no
clue what they are talking about, well that's not the case here.

But let me state that even simpler:
192.168.1.38 is the internal host
router is the router (with iptables nf and conntrack on it, and an
iptables MASQUERADE or SNAT rule)
123.0.0.1 is the external host
234.0.0.1 is the second external host

I will show the packets in the sequence they are send out:
Netfilter/Conntrack should do the following, protocol is UDP:
192.168.1.38:1234      -> router:1234 -> 123.0.0.1:4321
123.0.0.1:4321           -> router:1234 -> 192.168.1.38:1234
192.168.1.38:1234      -> router:1234 -> 234.0.0.1:5678
234.0.0.1:5678           -> router:1234 -> 192.168.1.38:1234

That doesn't work, because for some unknown reason netfilter/conntrack
creates a mapping for port 1234 for the external host 123.123.123.123,
and cannot create a second mapping for port 1234 for the external host
234.234.234.234.
It has to change the port in between.

What happens is (and this has nothing to do with STUN!)
192.168.1.38:1234      -> router:1234 -> 123.0.0.1:4321
123.0.0.1:4321           -> router:1234 -> 192.168.1.38:1234
192.168.1.38:1234      -> router:1025 -> 234.0.0.1:5678
234.0.0.1:5678           -> router:1234 (FAILS!!!!)

To be clear:
192.168.1.38:1234      -> router:1025 -> 234.0.0.1:5678
(In this case the linux router should not use port 1025, but use port
1234, as this was the port used by the internal host)
234.0.0.1:5678           -> router:1234 (FAILS!!!!)
(This is just the consequence of the wrong mapping!)

> Fact is outgoing streams don't magically add mappings for incoming on=
es,
> unless you use a nf_conntrack_* module that explicitly does it.
The NAT module does that, am I right?

> There's no nf_conntrack_stun, so if your STUN exchange with
(I cut off here, this should be "normal" NAT behaviour and has nothing
to do with STUN.)

>>I more and more got the impression, that you are developing in your
>>own little world, and not the world where we have different types of
>>NAT.
>
> We don't even think "types of NAT". We think in absolute > {a:b, c:d}=
 tuples.
Well, but you should know what a symmetric NAT is?
You are complaining about my description not beeing accurate, and at
the same time you are sending me links to WIKI pages, where the
correct description can be found.
So, you are investing more time in finding reasons not to help, than
actually recognize the problem and help!

So what are {a:b, c:d} tuples? Is a the ip and b the port? If it that
easy, see my description above, I am nearly using these terms there.)

Thanks, Joern.
