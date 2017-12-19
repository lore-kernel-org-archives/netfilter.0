From: Robert White <rwhite@pobox.com>
Subject: Re: Nftables atomic reload at reboot
Date: Tue, 19 Dec 2017 00:43:52 +0000
Message-ID: <55f158b3-afa4-aaea-e094-a41b7a34f033@pobox.com>
References: <69931d71-baa9-d2ae-9a43-242aeb6a709f@justdev.ca>
 <CAOkSjBj6VcnAmQPV8Bdz+pfckGKKZ2SDvG=T84gwCq3ZmVvpJw@mail.gmail.com>
 <20171218220404.GA3366@dimstar.local.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20171218220404.GA3366@dimstar.local.net>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 12/18/2017 10:04 PM, Duncan Roe wrote:
> On Mon, Dec 18, 2017 at 11:08:21AM +0100, Arturo Borrero Gonzalez wrote:
>> On 17 December 2017 at 23:02, Jeff <jarvis@justdev.ca> wrote:
>> Don't use 'iif', but 'iifname'.
>>
> To elaborate a little: iifname does a string comparison of the interface name so
> is slower than iif which does a numeric comparison of the interface index.
> 
> You can only use iif on interfaces with a fixed index number and which exist
> (i.e. pretty much hardware interfaces e.g. wlan0 & eth0, but not ppp0 or
> virbr0).

Side Note:

The thing _I_ use to get around this is interface group numbers.

#In startup scripts, for example
ip link set dev ppp0 group 1

Then

#in the nftables file
iifgroup gt 1 counter accept
iifgroup 1 tcp dport {ssh,http} ct state new counter accept

I use group 1 for ingress ports, 2 for local bridges, 3 for bridge
members and so on. Now I have a greater-than one domain for interior and
equal-to 1 for configured interfaces.

When an interface is being built it's group is "default" (as in zero) so
it starts life as blocked by the drop policies until it's assigned its
correct group.

You also get the numeric comparison speed and you can cover groups of
interfaces without elaboration or sets.

--Rob.
