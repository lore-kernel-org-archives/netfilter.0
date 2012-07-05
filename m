From: Mauricio Tavares <raubvogel@gmail.com>
Subject: What is localnet?
Date: Thu, 5 Jul 2012 14:03:17 -0400
Message-ID: <CAHEKYV6iST2_rFqaEUibAZqGG2jwUhMHUP3ve7xro-UgjrtTNw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=gKnVOF/n3h/moJEQd+l87bMgAbEXMs1tQ2BiFeW8KVU=;
        b=z9qvE7MaOkfyiRy/aAPQxOq/ueqZJg9Zc8WcsyH+5TjTq7pqleu2tYYC5PuU3DvDew
         RjFQFXmmdk1w8ilRAqkYnZT9H5jBXGl4pfhnMMzzfwAXfbbShbILA75ToV+0HfPSM3ki
         HqLQEqWA2txtCRlV/gDsKFicJ6ahJjrlv6c/DqWWHvOToc+EZ7RvXu9sV05cKbUE/vGV
         kSAWkrP6PkhpqCnHvMayYd0rhKC5tdkGXJ1eka477Tq62/HI2DbFSxVSPiGKcPRes/+g
         P1kZ/9quflQ5stYovyoUElnUK4Cbyf83QpEKalieAsjo1xdcLkQxruERjeDOxK5kOk7l
         pzIA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter <netfilter@vger.kernel.org>

        I know probably the best workaround is just to avoid using
10.0.0.0/24, but it just do not make sense to me.

My test firewall has "external" FQDN firewall.fake.domain.com
(192.168.42.90) and internal firewall.test.domain.com (10.0.0.1).
fake's network is 192.168.42.0/24 while test is 10.0.0.0/24 since I
kinda like 10.0.0.0/24. I have the following stuff setup in its
firewall.

So I first create the following variables:

EXTIF='eth0'
EXTIP='192.168.42.90'
EXTNET='192.168.42.0/24'

INTIF='eth1'
INTIP='10.0.0.1'
INTNET='10.0.0.0/24'
MONKEYNET='192.168.22.0/24'

LOCALNET='127.0.0.0/8'

And then use them to create a chain called subnetfwd as follows:

iptables -t nat -N FORWARDS
iptables -t nat -N SUBNETFWD
iptables -t nat -A PREROUTING -d $EXTIP              -j FORWARDS
iptables -t nat -A PREROUTING -d $EXTIP -s $EXTNET   -j SUBNETFWD
# iptables -t nat -A PREROUTING -d $EXTIP -s $INTNET   -j SUBNETFWD
iptables -t nat -A PREROUTING -d $EXTIP -s 10.0.0.0/24   -j SUBNETFWD
iptables -t nat -A PREROUTING -d $EXTIP -s $MONKEYNET   -j SUBNETFWD

When I check my deed, instead of having 10.0.0.0/24 or even intnet, I
get localnet:

iptables -L -t nat
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
FORWARDS   all  --  anywhere             firewall.fake.domain.com
SUBNETFWD  all  --  192.168.42.0/24      firewall.fake.domain.com
SUBNETFWD  all  --  localnet/24          firewall.fake.domain.com
SUBNETFWD  all  --  192.168.22.0/24      firewall.fake.domain.com

and yet the other two subnets are fine. Why does it want to make
10.0.0.0/24 localnet? To add insult to injury,

iptables -L -v -n -t nat
Chain PREROUTING (policy ACCEPT 27 packets, 1220 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 FORWARDS   all  --  *      *       0.0.0.0/0
192.168.42.90
    0     0 SUBNETFWD  all  --  *      *       192.168.42.0/24
192.168.42.90
    0     0 SUBNETFWD  all  --  *      *       10.0.0.0/24
192.168.42.90
    0     0 SUBNETFWD  all  --  *      *       192.168.22.0/24
192.168.42.90

So, what is this localnet? Where is it coming from?
