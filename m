From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: Waiting until first release of NFTABLES
Date: Tue, 25 Feb 2020 12:12:45 +1100
Message-ID: <87r1yjqxki.fsf@goll.lan>
References: <c4e081c5-3bb9-827e-a382-388fe4d859de@satchell.net>
        <875zfwssw1.fsf@goll.lan>
        <b0399d25-901e-38a8-7359-8096516a818e@satchell.net>
        <e36d450d-6707-4902-9378-a326504e5840@thelounge.net>
        <ff0fb90e-8da1-18b5-9be5-dc7c4886a009@satchell.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Stephen Satchell <list@satchell.net> writes:

> One thing I would love is a way of injecting packets into a userland
> test tool that reports what nftables did with it.  If I had such a
> tool, I would be more inclined to use a 0.x version because I could
> verify that the code plus ruleset is doing what it's supposed to do.

Can't you use "ip netns" (or systemd-nspawn, or docker, or libvirt-qemu)
to set up a test network with a test firewall, then send packets into /
out of that test environment?

OK, it's a bit fiddly to set up, but I don't see why you need any
special nftables-specific thing when you can just do regular
namespace/container/vm techniques.

