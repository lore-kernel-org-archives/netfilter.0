From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Re: "Carrier Grade" NAT44 setup
Date: Sun, 14 Jun 2020 21:27:34 +0200
Message-ID: <20200614192734.GA31553@principal.rfc2324.org>
References: <5c2c7d45-ea99-0f70-04ee-544f9837b8a8@rfc2324.org>
 <87h7vi880m.fsf@goll.lan>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87h7vi880m.fsf@goll.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Anno domini 2020 Trent W. Buck scripsit:

> Maximilian Wilhelm <max@rfc2324.org> writes:
> > Did anyone here already build such a setup [linux as CGNAT router]?
> 
> I have some derpy non-expert comments, below.
> 
> > What resources would be required on the Linux box? I would assume any
> > decent server CPU with 6+ cores will be fine and 16-32GB of RAM would
> > suffice for storing the conntrack mappings?
> 
> Obligatory question whenever CGNAT comes up:
> Can you just use IPv6 instead? ;-)

"Instead" as in IPv6-only won't work, as people are using all sorts of
applications we can't control. The final setup will be real dual-stack
of corse, so we are "only" talking about the bits of traffic which are
IPv4 and will leave our network. I would expect this to be a lot less
than the full traffic volume from today, but that's only a guessimate.

> When I was doing NAT for up to 1000 desktops,
> I looked into conntrack table size, and
> concluded it was not worth even worrying about.
> 
> From first principles, the NAT record is basically a struct like
> 
>     (orig_ip, orig_port, nat_ip, nat_port)
> 
> Which for IPv4 is only like 10 bytes or something.
> So in 10MiB you can remember 10Mi concurrent flows.
> 
> I looked for a quick sanity-check of that and I found this old post
> which reckons 32K concurrent flows in 512MB:
> 
>     https://wiki.khnet.info/index.php/Conntrack_tuning
> 
> Another old post estimates about 350b/flow, so about 10MB = 28K flows:
> 
>     https://www.cyberciti.biz/faq/ip_conntrack-table-ful-dropping-packet-error/
> 
> Obviously those numbers don't line up too well.
> Next step is probably to dig through the kernel's Documentation/ tree
> for notes about conntrack limits.

I would expect the conntrack entry for NAT being more like two
5-tuples (L4 proto, src/dst ip, src/dst port). I guess I'll really have
to dig through Documentation and/or the code the next days :)

We're currently looking at boxes with 64GB of RAM as RAM is rather cheap
compared with CPUs and meaningful NICs. On the latter we're going for
Mellanox ConnectX 4 with 2x 10/25G ports as of now, they seem to provide
a lot of queues and I don't hear people complain about problems as I hear
with bcm or Intel X7xx lately.

Best
Max
-- 
     "really soon now":      an unspecified period of time, likly to
                             be greater than any reasonable definition
                             of "soon".
