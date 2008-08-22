From: Volkan YAZICI <yazicivo@ttmail.com>
Subject: Traffic Mirroring for Debugging
Date: Fri, 22 Aug 2008 10:57:13 +0300
Message-ID: <87vdxtwkh2.fsf@alamut.mobiliz.com.tr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

In one of our servers, I want to debug a network server daemon. The
problem is I don't have luxury for a downtime or to iterrupt related
server's network traffic. Current routing structure looks like below.

  VPN Switch (192.168.1.1) -> Server Machine (192.168.1.2)

To debug the related server daemon, I planned to redirect the network
traffic to a second sandbox server. Planned routing structure is:

  VPN Switch (192.168.1.1)
  |
  +-> Temporary Linux Machine (192.168.1.10)
      ||
      |+-> Server Machine (192.168.1.2)
      +--> Sandbox Server Machine (192.168.1.20)

For test purposes, I configured a client to connect to 192.168.1.10
(instead of actual server, 192.168.1.2). But I couldn't manage to
redirect incoming traffic of 192.168.1.10 to 192.168.1.2 and
192.168.2.20 machines. How can I get such a mirrored redirection?

Furthermore, I first considered using DNAT of iptables, but learnt that
it doesn't support multiple destinations without load-balancing. Anyway,
I wanted to give it a try for just a single machine. I connected to 1.10
machine and typed below iptables command:

  # iptables -t nat -A PREROUTING -d 192.168.1.10 -j DNAT --to-destination 192.168.1.20
  # iptables -L -n -t nat
  Chain PREROUTING (policy ACCEPT)
  target     prot opt source               destination
  DNAT       0    --  0.0.0.0/0            192.168.1.10 to:192.168.1.20

  Chain POSTROUTING (policy ACCEPT)
  target     prot opt source               destination

  Chain OUTPUT (policy ACCEPT)
  target     prot opt source               destination

And started a netcat listener on 1.20 machine:

  # nc -l -p 2310

Then tried to connect to the started nc listener from 1.10 machine:

  # nc -vvv 192.168.1.10 2310
  192.168.1.10: inverse host lookup failed: Unknown host
  (UNKNOWN) [192.168.1.10] 2310 (?) : Connection refused
   sent 0, rcvd 0

Gosh! Even couldn't manage to make DNAT for a single address work
properly. Any helps will be really really appreciated.


Regards.
