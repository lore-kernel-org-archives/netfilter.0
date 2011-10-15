From: Alex Bligh <alex@alex.org.uk>
Subject: Bridging & VLANs: make untagged packets bridge separately
Date: Sat, 15 Oct 2011 11:41:27 +0100
Message-ID: <A81E070B4B85068D6F6A3809@nimrod.local>
Reply-To: Alex Bligh <alex@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Alex Bligh <alex@alex.org.uk>

This is not quite like the FAQ, so please read on!

I want to send 802.1q frames, and 802.1ad / 802.1q-in-q frames to
a number of dynamically generated bridges. This bit works fine.
EG eth0.123 becomes a member of bridge123, eth0.124 becomes
a member of bridge 124.

I also wish to send only untagged frames to a particular bridge
ideally with a fixed number of ebtables rules.

The FAQ says do:
  ebtables -t broute -A BROUTING -i eth0 --vlan-id 15 -j DROP
to cause the eth0 bridge not to bridge VLAN 15 traffic.

That's not much good as I'd need a large number of those to cope
with a large and changing number of bridges. It also does not
necessarily match q-in-q.

I could (I think) do:
  ebtables -t broute -A BROUTING -i eth0 -p 802_1Q -j DROP
to cause all 802_1Q frames not to bridge on eth0, and instead
to bridge on its VLAN-tagged subinterfaces. Is that right?

If that is correct, how do I also capture Q-in-Q / 802.11ad?
There seems to be some dispute as to whether in practice
this uses 0x8100 as an ethertype, or 0x9100, 0x9200, 0x9300,
or 0x88A8 (which is what the original 802.1ad standard seems
to say) on the outer tag. But looking through the kernel source
the only way I can see things working is 0x8100 inside 0x8100.

I know I could do:
  ebtables -t broute -A BROUTING -i eth0 -p 802_1Q -j DROP
  ebtables -t broute -A BROUTING -i eth0 -p 0x9100 -j DROP
  ebtables -t broute -A BROUTING -i eth0 -p 0x9200 -j DROP
  ebtables -t broute -A BROUTING -i eth0 -p 0x9300 -j DROP
  ebtables -t broute -A BROUTING -i eth0 -p 0x88A8 -j DROP

for safety, but this is reasonably speed critical. I don't
have a wide variety of networking gear to test against, so
what I want to know is which of these is actually necessary.

-- 
Alex Bligh
