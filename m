From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: "Carrier Grade" NAT44 setup
Date: Thu, 11 Jun 2020 15:51:37 +1000
Message-ID: <87h7vi880m.fsf@goll.lan>
References: <5c2c7d45-ea99-0f70-04ee-544f9837b8a8@rfc2324.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Maximilian Wilhelm <max@rfc2324.org> writes:
> Did anyone here already build such a setup [linux as CGNAT router]?

I have some derpy non-expert comments, below.

> What resources would be required on the Linux box? I would assume any
> decent server CPU with 6+ cores will be fine and 16-32GB of RAM would
> suffice for storing the conntrack mappings?

Obligatory question whenever CGNAT comes up:
Can you just use IPv6 instead? ;-)


When I was doing NAT for up to 1000 desktops,
I looked into conntrack table size, and
concluded it was not worth even worrying about.

From first principles, the NAT record is basically a struct like

    (orig_ip, orig_port, nat_ip, nat_port)

Which for IPv4 is only like 10 bytes or something.
So in 10MiB you can remember 10Mi concurrent flows.

I looked for a quick sanity-check of that and I found this old post
which reckons 32K concurrent flows in 512MB:

    https://wiki.khnet.info/index.php/Conntrack_tuning

Another old post estimates about 350b/flow, so about 10MB = 28K flows:

    https://www.cyberciti.biz/faq/ip_conntrack-table-ful-dropping-packet-error/

Obviously those numbers don't line up too well.
Next step is probably to dig through the kernel's Documentation/ tree
for notes about conntrack limits.

