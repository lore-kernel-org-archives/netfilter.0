From: Stephen Satchell <list@satchell.net>
Subject: Re: Waiting until first release of NFTABLES
Date: Mon, 24 Feb 2020 17:18:30 -0800
Message-ID: <e73f8381-66ea-18f7-9267-d8493de3dafd@satchell.net>
References: <c4e081c5-3bb9-827e-a382-388fe4d859de@satchell.net>
 <875zfwssw1.fsf@goll.lan> <b0399d25-901e-38a8-7359-8096516a818e@satchell.net>
 <e36d450d-6707-4902-9378-a326504e5840@thelounge.net>
 <ff0fb90e-8da1-18b5-9be5-dc7c4886a009@satchell.net> <87r1yjqxki.fsf@goll.lan>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <87r1yjqxki.fsf@goll.lan>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 2/24/20 5:12 PM, Trent W. Buck wrote:
> Can't you use "ip netns" (or systemd-nspawn, or docker, or libvirt-qemu)
> to set up a test network with a test firewall, then send packets into /
> out of that test environment?
> 
> OK, it's a bit fiddly to set up, but I don't see why you need any
> special nftables-specific thing when you can just do regular
> namespace/container/vm techniques.

HOWTO link?
