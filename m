From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Re: Rules PREROUTING doesn't work
Date: Wed, 17 Mar 2010 07:21:06 +0100
Message-ID: <4BA074D2.9090600@unipex.it>
References: <1c1b5a0f1003162027s73fe4756yefd48b436375b04b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1c1b5a0f1003162027s73fe4756yefd48b436375b04b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Angel Motta <angelmotta@gmail.com>
Cc: netfilter@vger.kernel.org

Angel Motta wrote:
> Hi List

Hi,

> This is my first time the I write to this list. I have a problem case
> with rules PREROUTING.
> I am creating a rule PREROUTING from a range of port which request
> openvpn client and the problem is that when I apply this rules and
> only rules NATs are runing (PREROUTING and POSTROUTING the output of
> #> iptables -L is blank) the clients openvpn still conect to the
> Firewall and not to the SERVERVPN, all requests are processed for
> firewall.
> 
> this is the rule:
> $IPT -t nat -A PREROUTING  -i $IF_EXT -d $TESTVPN -p udp --dport
> 5000:6000 -j DNAT --to-destination $IP_DMZ_SERVERVPN
> 

You miss to report some same informations: $TESTVPN, $IP_DMZ_SERVERVPN
and $FW_IP at least how (netmask, etc...) and if a client can "ping"
(for trying if routing works) the $TESTVPN server

However, try to think: how you kernel can know where the openvpn packets
will routed inside PREROUTING table if it can't route? It couldn't. So
that rules will never match. Try to remove -d $TESTVPN and retry.
And after, then you debug, tcpdump -nvi $IF_EXT (and all the other
ifaces) is your big big friend. Of course the -j LOG is too.


Michele
