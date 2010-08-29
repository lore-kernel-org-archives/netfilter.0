From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: ebtables and anti-spoofing rules not working 100%?
Date: Sun, 29 Aug 2010 19:23:12 +0100
Message-ID: <4C7AA590.6040704@abpni.co.uk>
References: <4C7A67B3.4070505@wpkg.org> <4C7A7CB7.9020701@plouf.fr.eu.org> <4C7A8EED.9060203@wpkg.org> <4C7A9825.9080602@abpni.co.uk> <4C7A9A0C.50203@wpkg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C7A9A0C.50203@wpkg.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tomasz Chmielewski <mangoo@wpkg.org>, netfilter@vger.kernel.org


On 29/08/10 18:34, Tomasz Chmielewski wrote:
> On 29.08.2010 19:25, Jonathan Tripathy wrote:
>
>>> Also, if I do this on the "rogue" guest (with MAC, IP belonging to the
>>> "other" guest):
>>>
>>> ifconfig eth0 hw ether AA:BB:CC:DD:EE:FF
>>> ifconfig eth0 1.2.3.22
>>>
>>>
>>> any communication to the "other" still breaks (from external hosts).
>>> So, no improvement.
>>>
>>>
>> Why do you need to use the INPUT chain with ebtables in a VM
>> environment? In my ebtables setup, I have INPUT to drop everything,
>> except stuff from/to the loopback interface (lo)
>
> I can use anything, as long as it "pins" given MAC/IP addresses to a 
> VM guest - and that any "rogue" guest is not able to disrupt traffic 
> to other VM guests (or, worse, the gateway) - i.e. by changing its own 
> IP/MAC to something else, possibly addresses used by other guests / 
> gateway.
>
>
Yes, but the INPUT chain is only relevant for traffic destined for the 
host itself. Does the host actually do anything in your case, or is it 
just a bridging device?
