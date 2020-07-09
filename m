From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: WiFi Hotspot Disable Neighbor discovery,Ask
Date: Thu, 09 Jul 2020 15:42:02 +1000
Message-ID: <87sge1xn11.fsf@goll.lan>
References: <alpine.DEB.2.21.2006161012410.11442@piplus.local.jubileegroup.co.uk>
        <44cc0842-bd3b-986e-9537-bd11d980e61b@gmail.com>
        <01ddc95d-b6cd-193c-4a8c-4b2a42718441@gmail.com>
        <8a982f80-e11b-b506-3844-35dc8e655a0a@gmail.com>
        <alpine.DEB.2.21.2006271231370.13515@piplus.local.jubileegroup.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

"G.W. Haywood" <netfilter@jubileegroup.co.uk> writes:

> Hello again,
>
> On Fri, 26 Jun 2020, Hooman wrote:
>
>> ...
>> not being able to manipulate or drop such packets could be a security
>> issue, since these are packets that you can't really manage through
>> iptables/ebtables (think of firewalls). So I leave it to this community
>> to decide whether netfilter should be able to manage such packets.
>> ...
>
> It is not clear to me that the kernel design permits what you suggest.
>
> Thinking of firewalls, nobody in his right mind would do to a firewall
> what you have done to your computer

FWIW, I do the equivalent in wired networks on Cisco Catalyst
2950/2960/2970 switches.  There it is called "port isolation".

It prevents switching between desktops, while
still allowing switching between desktop and servers.

It works the same as if you set up a separate 802.1q tag for each
[a desktop] + [all servers], except you don't have to micro-manage it.

    https://www.cisco.com/c/en/us/support/docs/lan-switching/private-vlans-pvlans-promiscuous-isolated-community/40781-194.html

specifically this image

    https://www.cisco.com/c/dam/en/us/support/docs/lan-switching/private-vlans-pvlans-promiscuous-isolated-community/40781-194-a.gif

ap_isolate=1 in hostapd.conf appears to be the equivalent for 802.11.

    https://www.w1.fi/cgit/hostap/tree/hostapd/hostapd.conf#n533

I think the OP originally tried to set it in each wifi client,
instead of in the AP:

    https://www.w1.fi/cgit/hostap/commit/?id=19e20c14fb015d063dc248a0f4ded195ad229df3

