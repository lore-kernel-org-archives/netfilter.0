From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: Problems with bridge+router setup
Date: Mon, 28 Dec 2015 17:50:36 -0500
Message-ID: <20151228175036.2ff7ee1d@playground>
References: <b012b8f6ef5b98338b2ce4544df60a24@vpn.quintux.com>
	<20151227142118.27861ea5@playground>
	<7f5d15a0a7067992b1ae21b149d64266@vpn.quintux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU tBSModHR008589
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
	t=1451343039; i=@wpi.edu;
	bh=1FsAAmjU5KiwpqjQAE+z0W3bOcC1G9i/AOX7D66tG1M=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=PFPkrleDpCBG0Mks0pwVt2nNLDYuvxpRG4Hg4Mz5XtQ/eSmfzAJQZcOElaGAuTa8A
	 tNxNNcCWbst6LovDV5D9JsVJyaBVqiPobtDUi18+CaHQt0LyCVgOcY1/bqanIBljFs
	 g5MTZGs2xiLJQx1wf10F81vEkLNiDJnt0aPdbnv0=
In-Reply-To: <7f5d15a0a7067992b1ae21b149d64266@vpn.quintux.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Mon, 28 Dec 2015 10:57:11 +0100
Misterke <netfilter@quintux.com> wrote:

> Reduced to the minimal, the needed setup would look something like 
> this:
> 
>          +------+
>    A ----|      |   single IP link   +------+       +-----------+
>          |Switch|--------------------| RPi2 |-------|Cable modem|
>    B ----|      |                eth1+------+eth0   +-----------+
>          +------+
> 
> Here client A is a normal network device for which the network it is 
> connected to should look like a normal LAN and the RPi2 should act as 
> firewall, DHCP & DNS server, etc.  In short: for client A the RPi2 
> should look like a typical router/firewall.
> 
> Client B however is a Digital TV box and my triple-play provider 
> unfortunately requires those to be directly connected to the cable 
> modem, which will hand them actually a DHCP address in a particular 
> range and probably do other special stuff.  In short: for client B the 
> entire network between itself and the cable modem should consist solely 
> of hubs/switches/bridges and hence for it to work the RPi2 should behave 
> as a simple bridge.

Hmmm. Since you have the RPi set up, connect the TV box directly to it and 'tcpdump -i br0 -vvv -X' so you can see the traffic that passes between the TV box and the CM. As Pascal said, TV traffic can be (or is usually) VLAN-tagged.

With the bridge in place, you should see traffic flow between B and the CM through the switch and RPi. If the traffic is VLAN-tagged, you might have to add that VLAN to eth0. At least once you *see* the traffic, you should be able to figure out how to make it work.

*However*, if the TV box and/or CM do not speak STP (which nodes need to learn where things reside behind switches and bridges) you might not be able to make it work.

You might end up having to use two RPis as forwarding/tunneling routers, one at the TV box and on at the CM, and run a GRE/IPSEC/OpenVPN tunnel between the two RPis, probably bridging (encapsulating) layer 2 through the tunnel. Done right, the tunnel should allow the TV box and the CM to think they are talking directly to each other.

          +------+
    A ----|      |   single IP link                  +-----------+
          |Switch|-----------------------------------|Cable modem|
       ---|      |----------                        -|           |
      /   +------+          \                      / +-----------+
     |                       |                     |
      \   (tunnel)           |                     |
       ------------          |                     |
                   \         | (tunnel)            |
                    |        |                     |
          +------+  |        |                     |
          |      | /         \        +------+     /
          | RPi3 |-           --------| RPi2 |-----
    B ----|      |                eth1+------+eth0   
          +------+

Note that "Switch" in the diagram could be any configuration of switches and routers.

RPi2 should allow multiple RPis to connect tunnels into it so you could have multiple TV boxes connected to the CM.

If the TV box's MAC address is important to the CM (I don't know if CM mfrs have gone this far), you may have to be creative and figure out how to make RPi2's eth0 use difference MAC addresses based on which TV box a packet belongs to.

My twerk of your idea costs more (additional RPis), but should do a better job keeping the internet and TV traffic separate.

N
