From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: IP Nat or forward
Date: Wed, 6 Apr 2005 15:34:08 -0500
Message-ID: <001d01c53ae7$fbbd22e0$f5001eac@riverview.office>
References: <4254272C.3060706@provident-solutions.com><002701c53ae0$3f633a00$f5001eac@riverview.office>
	<42542F33.8010501@provident-solutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: "Vernon A. Fort" <vfort@provident-solutions.com>, netfilter@lists.netfilter.org

Ok, one of us is not understanding the other, and it is likely me.  Normal
IPSec VPNs run on a netowrk as such:

[Host A] --- LAN --- [Host B] .... (INET) .... [Host C] --- LAN --- [Host D]

Where the LAN between Host A and Host B is one IP subnet and the LAN between
Host C and Host D is another IP subnet, prefferably different than the IP
subnet on the first LAN.  The VPN in this scenario would be between Host B
and Host C.  Let's suppose that the hosts have the following IP addresses:

Host A's LAN IP address is 172.16.1.1
Host B's LAN IP address is 172.16.1.254
Host B's INet IP address is 12.34.56.78
Host C's INet IP address is 87.65.43.21
Host C's LAN IP address is 172.31.255.254
Host D's LAN IP address is 172.31.255.1

In this case the IPSec VPN would be between Host B's INet address of
12.34.56.78 and Host C's INet address of 87.65.43.21.  As far as what
traffic would and would not be NATed, you would NAT all traffic going out to
the INet from Host B's INet IP address of 12.34.56.78 except the IPSec VPN
traffic.  More information on how to NAT all traffic but the IPSec VPN
traffic is avaliable with your IPSec VPN software.  Ask if you need more
help configuring your NATing on Host B and / or Host C.  You (or your
counter part an the other LAN would NAT all traffic going out to the INet
from Host C's INet IP address of 87.65.43.21 except the IPSec VPN traffic.
Because you have the VPN passing traffic from one LAN to the other LAN you
don't normaly need to NAT the traffic at all except for in your case you
have the same IP subnet on both LANs which will mess up normal routing and
thus you have to augment it via NATing.  I hope this helps clear up some
things for you.



Grant. . . .

> Thanks!  I want to make sure I understand the IPSEC and NAT.  I'm
> connecting a PUBLIC address to my FIREWALL but NOT including the gateway
> address:
>
>     66.83.239.66 -> IPSEC -> 192.168.90.1      # a host to host / ip to
> ip VPN
> THEN
>     NAT 192.168.90.1    to  192.168.1.1
>
> Since the NAT takes place AFTER the IPSEC traffic, do I really need the
> NAT-T enabled?
>
> Do I just aliase the 192.168.90.1 address or should I do a VLAN?
>
> Vernon
>
>


