From: abhijit <strongcofi@gmail.com>
Subject: GRE over IPsec -- filtering raw GRE packets?
Date: Thu, 15 Apr 2010 11:11:30 -0700
Message-ID: <l2g74db4fb71004151111qba00cb2lf463f3daf5b6b043@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:received:message-id
         :subject:from:to:content-type;
        bh=rYIV946keCPQ3QkzbSL/LK9HVIAJ3gXmey1PK/93yNw=;
        b=giY+Oi913onxP8jMIZcISSWMJDMEMw+uy4CYuDlgMS+67L+t946Kz9gTFZiiSmuuW2
         xSfdQuvw2HZfXwRm04Di5DfG/xXwqRFc3HZwslHtSdVG+Gnyy8QOcb9wQmzc63lfGkkT
         AhXd1laQ+STnh6atTWVmlWeshHxmUkrCOwSzI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

hi,

i have a simple GRE/IPsec config between two hosts (2.6.32 kernel,
iptables ver1.3.5). i have a GRE tunnel setup between the hosts and
have IPsec auth+encrypt the GRE traffic (only) in transport mode.

i'd like to ensure that no unecrypted GRE packets are sent (and
accepted) over the physical network. only IPsec encapsulated ones
should be. i.e. no GRE pkts should be ever seen on the physical wire
(outgoing).

my filter table chains look like this:
----------
Chain INPUT (policy DROP 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source
  destination
1        2   328 ACCEPT     ah   --  eth0   *       0.0.0.0/0
  0.0.0.0/0
....

Chain FORWARD (policy DROP 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source
  destination
1        0     0 REJECT     all  --  *      *       0.0.0.0/0
  0.0.0.0/0           reject-with icmp-port-unreachable
...

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source
  destination
1        0     0 ACCEPT     ah   --  *      eth0    0.0.0.0/0
  0.0.0.0/0
....
-----------

the above configuration, does NOT work (i thought it would ;-).

it only works when i open up protocol 47 (gre) on eth0 (both on INPUT
and OUTPUT chain). but that may cause naked GRE pkts to be sent out on
eth0 (due to some mis-configuration with IPsec or something else).

is there a way i can prevent this from happening via iptables?

and secondly, i am bit confused on the input+output path taken by GRE
packets. can someone please outline that path (w.r.t iptables). it
seems with GRE/IPsec config, the packet makes two passes over the
netdevice (as my packet counters tell me). i was expecting just one
pass (and hence my initial (above listed) config -- which did not work
:-)

thanks!
abhijit


ps: i am not subscribed to this list. please do Cc: me the replies -- thanks!
