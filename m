From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: Waiting until first release of NFTABLES
Date: Tue, 25 Feb 2020 14:30:31 +1100
Message-ID: <87a757qr6w.fsf@goll.lan>
References: <c4e081c5-3bb9-827e-a382-388fe4d859de@satchell.net>
        <875zfwssw1.fsf@goll.lan>
        <b0399d25-901e-38a8-7359-8096516a818e@satchell.net>
        <e36d450d-6707-4902-9378-a326504e5840@thelounge.net>
        <ff0fb90e-8da1-18b5-9be5-dc7c4886a009@satchell.net>
        <87r1yjqxki.fsf@goll.lan>
        <e73f8381-66ea-18f7-9267-d8493de3dafd@satchell.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Stephen Satchell <list@satchell.net> writes:

> On 2/24/20 5:12 PM, Trent W. Buck wrote:
>> Can't you use "ip netns" (or systemd-nspawn, or docker, or libvirt-qemu)
>> to set up a test network with a test firewall, then send packets into /
>> out of that test environment?
>>
>> OK, it's a bit fiddly to set up, but I don't see why you need any
>> special nftables-specific thing when you can just do regular
>> namespace/container/vm techniques.
>
> HOWTO link?

I don't have one, but this is a basic introduction to "ip netns":
https://lwn.net/Articles/580893/

Once the netns is set up, you'd do something like

    ip netns exec my-cool-namespace  nft --file=my-cool-firewall.nft
    ip netns exec my-cool-namespace  firefox gopher://porn.example.edu

Then look at nft's counters (add rule ... counter accept), or
kernel logs (add rule ... log accept), or
whatever diagnostics you normally do.

The fiddly part is turning that into a turnkey "solution" that can have
multiple namespaces hooked up to one another, and to the real internet.

