From: "Knight, Steve" <Steve.Knight@bskyb.com>
Subject: RE: quick question re: natting
Date: Fri, 21 Nov 2003 13:18:44 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDB52A0429DFD31196FB0008C7D972D50EA57A74@OST_EXCH_USR5>
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Thanks!

I will suck it and see - can't hurt at the end of the day.  I'm hoping to
map 48/9/50 to 192.168.0.1/2/3 on the inside, then leave the rest of the
workstations to talk via .51.

As far as I'm aware, my little class-C is pretty normal in networking terms,
.53 is my broadcast address, .46 is the network - etc etc.  It's not a
standard 1 node DHCP-based ADSL connection.





-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: 21 November 2003 11.43
To: netfilter@lists.netfilter.org
Subject: Re: quick question re: natting


On Friday 21 November 2003 10:58 am, Knight, Steve wrote:

> Hi there
>
> I've got ADSL ppp0 facing the net, at x.x.x.47 [as part of a x.x.x.46/29
> subnet], and I want to do static NAT for hosts 48,49 and 50.
>
> I have a quick question, and my Ziegler book is at home at the moment. 
> Back in the days when I worked with Checkpoint, I would have had to have
> ARPed 48, 49 and 50 onto the external interface via the operating system,
> for the one-to-one static NAT to work.  Do I need to ARP the IP addresses
> onto ppp0 under Linux / iptables also?

Maybe :)

Sorry to be uncertain, but it depends how your ADSL link works.

If this were a 'normal' routed leased-line type link, then I would say "Yes,

you need to ARP for the extra addresses (a simple way is to use ip addr to 
assign those addresses to you external interface, although I'm not sure if 
you can do this with ppp interfaces?)".

However, since this is an ADSL setup (and certainly on UK BT ADSL
connections 
I've seen some very odd routing arrangements), it may be that all addresses 
in your range are being routed through to your end of the ppp link, and you 
don't need to ARP for them (ARP is not needed on a point to point link, only

on broadcast-type network structures).

I would recommend just trying it without ARP and see if you get packets - 
either set up a netfilter rule matching one of the the addresses and see if 
"iptables -L -n -v -x" shows any bytes or packets being counted for it, or 
else use a packet sniffer / protocol analyser such as tcpdump or ethereal to

see if such packets arrive at your machine.   If they do, no need for ARP.

Hope this helps,

Antony.

-- 

The difference between theory and practice is that
in theory there is no difference, whereas in practice there is.

                                                     Please reply to the
list;
                                                           please don't CC
me.



.


-----------------------------------------------------------------------
Information in this email may be privileged, confidential and is 
intended exclusively for the addressee.  The views expressed may
not be official policy, but the personal views of the originator.
If you have received it in error, please notify the sender by return
e-mail and delete it from your system.  You should not reproduce, 
distribute, store, retransmit, use or disclose its contents to anyone.
 
Please note we reserve the right to monitor all e-mail
communication through our internal and external networks.
-----------------------------------------------------------------------


