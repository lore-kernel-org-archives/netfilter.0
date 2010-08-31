From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Awkward scenario: 3 interfaces and 3 devices with same ip/subnet.
Date: Tue, 31 Aug 2010 09:30:13 -0500
Message-ID: <4C7D11F5.1010105@riverviewtech.net>
References: <AANLkTik15tix2nxCQfeD=W+t10NuiYLBeSCuYZ8R_2s+@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTik15tix2nxCQfeD=W+t10NuiYLBeSCuYZ8R_2s+@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/31/10 06:34, Giacomo Bernardi wrote:
> want to solve a very awkward scenario?
> 
> There's a linux box with three interfaces (eth0, eth1, eth2) each 
> directly connected to an embedded device that has configuration:
> - IP: 10.0.0.1
> - Mask: 255.255.255.0
> (in other words: all three devices answer to 10.0.0.1/24 and their 
> configuration can't be changed)
> 
> I need to send and receive snmp packets to an arbitrary given device 
> among these three ...how?

I don't know if it would work for you or not, but you could try an old / 
odd / if not dirty trick.

Try adding static ARP entries to each device's MAC address using 
different (bogus) IPs.  Then try communicating with the bogus IPs.  You 
might get lucky and be able to communicate.  It really depends on what 
is included in the higher layer protocol.  (I've not dealt with enough 
SNMP to know if this is possible.)

The main thing that the differing IPs are use for is to translate the 
layer 3 IP address to the layer 2 MAC address.  So, if you can side step 
that problem, you may be golden.

Yes, this is a dirty trick / hack, but sometimes that's what you have 
got to do.



Grant. . . .
