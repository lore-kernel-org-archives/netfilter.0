From: "Bradley Kite" <bradley.kite@gmail.com>
Subject: NAT for multiple non-directly connected subnets
Date: Thu, 8 Nov 2007 21:53:07 +0000
Message-ID: <e97f32c10711081353t5602912fr560386581cd39c7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=TUJz4CYaDBuLT8NHfcGRxdGa3i+V2SgPZMtrCYtboEY=;
        b=oc+LuWnRHdfwUWPzZvFtL0AFWpXtiClBZGnNwNHTy6t20843EOhHwCGoNnwrBjDWCaDzCAtkvngUv3dABF8lnW06DGMhpeXMZgXfkF0/8hdP6m0tJ04BpJliyhWENSU3lSWYmWJzN6uAoO+FEHfvY3Eg6dZg2Zq59fBGCNt73pc=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

I've been using NAT for my home network (a single /24 RFC1918 address
range) and it has been working well, however I've recently tried
NATing a more complex environment environment as follows:

 Linux Machine:
Internal Interface: 192.168.1.50/30 -> 192.168.1.49/30
External Interface: 81.179.30.111/24

Now, connected off the internal interface is a whole network
consisting of several subnets all linked off each other - ie they are
not directly connected to the linux machine.

The problem I have is that the NAT on the linux box is only actually
nating traffic that comes directly from  192.168.1.49 - the first
upstream router. Any traffic from, for example, 192.168.2.0/24 wont
get natted to  81.179.30.111  as expected. I can see this with tcpdump
- traffic from the directly connected router gets natted, other
traffic is seen (so its not a routing issue) its just not being
natted.

I am using kernel 2.6.18 and this is the rule I'm using for iptables:

iptables --table nat -A POSTROUTING -o eth0 -j SNAT --to-source 81.179.30.111

Is there any thing I am missing with this configuration? Is there some
limitation with doing NAT that only allows directly connected subnets
to be natted?

Any help or suggestions will be much appreciated as I've tried all
configurations that I can think of and I'm at my limit now.

--
Brad.
