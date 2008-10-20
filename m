From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: Log flooded with these...
Date: Mon, 20 Oct 2008 01:22:38 -0500
Message-ID: <gdh83f$fmn$1@ger.gmane.org>
References: <48FB4FD8.7090307@libertytrek.org> <48FB64CD.6070205@libertytrek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48FB64CD.6070205@libertytrek.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Simon wrote:
> On 10/19/2008, Simon (tanstaafl@libertytrek.org) wrote:
>> Oct 19 11:10:33 myhost IPTABLES-IN Default Drop: IN=eth0 OUT=
>> MAC=ff:ff:ff:ff:ff:ff:00:1c:c0:69:16:89:08:00 SRC=0.0.0.0
>> DST=255.255.255.255 LEN=328 TOS=0x00 PREC=0x00 TTL=128 ID=46967
>> PROTO=UDP SPT=68 DPT=67 LEN=308
>> Oct 19 11:10:33 myhost IPTABLES-IN Default Drop: IN=eth0 OUT=
>> MAC=ff:ff:ff:ff:ff:ff:00:04:5a:8f:d6:11:08:00 SRC=192.168.1.250
>> DST=255.255.255.255 LEN=347 TOS=0x00 PREC=0x00 TTL=128 ID=55784
>> PROTO=UDP SPT=67 DPT=68 LEN=327
>> Oct 19 11:10:33 myhost IPTABLES-IN Default Drop: IN=eth0 OUT=
>> MAC=ff:ff:ff:ff:ff:ff:00:1c:c0:69:16:89:08:00 SRC=0.0.0.0
>> DST=255.255.255.255 LEN=360 TOS=0x00 PREC=0x00 TTL=128 ID=46968
>> PROTO=UDP SPT=68 DPT=67 LEN=340
> 
> Help! I'm not an iptables guy... at a minimum, is there a way to just
> tell iptables to stop logging these (silently drop)? I'll continue to
> troubleshoot, if there is a problem, but this is making my logs
> virtually (not totally, but almost) useless...
> 
> Also, I guess it would be good to have the reverse command handy - how
> to turn this off and on, so I can test if the problem persists...

All of those groups of 3 packets look like normal DHCP broadcast packets
by machines that do not yet have an IP address assigned.  Looking at the
above packets, the first is probably a DHCPDISCOVER sent from MAC address
00:1c:c0:69:16:89 (a device made by Intel, Malasia), the second would
be the DHCPOFFER sent by your Windows domain controller at IP address
192.168.1.250 and relayed through a Linksys router with MAC address
00:04:5a:8f:d6:11, and the third a DHCPREQUEST sent from the same
device that sent the first packet.

It all looks normal apart from the sudden increase in frequency.  Are
machines on your network having trouble getting an IP address assigned
from your domain controller?  Note that these are NOT lease renewals --
renewals do not use broadcast packets.

You can filter these out of the log quite easily by adding a
"--dst ! 255.255.255.255" matcher to the LOG rule so that broadcast
packets do not get logged.

-A INPUT --dst ! 255.255.255.255 -j LOG --log-prefix "IPTABLES-IN Default Drop: " --log-level 7


-- 
Bob Nichols     "NOSPAM" is really part of my email address.
                 Do NOT delete it.

