From: Jimmy Thrasibule <thrasibule.jimmy@gmail.com>
Subject: Strange behavior with ipset not matching on public range
Date: Mon, 27 May 2013 15:42:15 +0200
Message-ID: <1369662135.4058.24.camel@BEWS005.euractiv.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:date:content-type:x-mailer:mime-version
         :content-transfer-encoding;
        bh=Fycp/KVjL3giq/mtykXu+P8ks4nvzAIz7L2kAdd57Rc=;
        b=yHSueu3JqTI8XiBs80/s1lcf9XPE/BuI/g6XIu7hfyd/3L0Zwdx2sFNoxof+NRAvT3
         oeKx2vJyNurpPuNRF+dFV3ciFU+gATQOxpDd2zf/pa/4txhhw0Z9zjvDaNTH2hzdmHRi
         DN57JVCeUcsQOVj0HgjbCLo4N3XIewsKNWjvYaZC86jplUxPXsRdhKHOpYxJiL/Y+cnq
         yRavCV6TERE+aLStsJhXTYOb1obGX7mwmY/PrSsvex4SWK4Ar1P44JLAMpsJAWd359s0
         V043NuYdlhsEIidIwCrS/q5+ncc2+hhEbk8M5cylKXlg3lKYI0VmjO9mspJAFWWJUHTG
         rPQw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I've got a very strange problem with ipset not matching on public IP
addresses.

Let's have a look at my firewall configuration.

# ip addr
2: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP
qlen 1000
    link/ether 00:e0:xx:xx:xx:9e brd ff:ff:ff:ff:ff:ff
    inet 217.x.x.122/29 brd 217.x.x.127 scope global eth1

# ipset list
Name: fw_iface_pub
Type: hash:net,iface
Header: family inet hashsize 64 maxelem 2 
Size in memory: 1552
References: 3
Members:
217.x.x.122,eth1

The entry has been entered in ipset using the following statement:

# ipset add fw_iface_pub 217.x.x.122/32,eth1

So from my point of view, every thing should be OK. Here is the
strangeness:

# iptables -nvL
[...]
Chain FW_OUT (2 references)
 pkts bytes target          prot opt in    out    source         destination
  297 45841 CTRLOUT         icmp --  *     *      0.0.0.0/0      0.0.0.0/0
   77  9731 FW_OUT_common   all  --  *     *      0.0.0.0/0      0.0.0.0/0      match-set fw_iface_all src,dst
    0     0 FW_OUT_pub      all  --  *     *      0.0.0.0/0      0.0.0.0/0      match-set fw_iface_pub src,dst
  126 22031 FW_OUT_pub      all  --  *     eth1   217.x.x.122    0.0.0.0/0

As you can see, no matches on the `fw_iface_pub` list while the
`fw_iface_all` one matches as well as if I'm directly specify the public
IP address.

And do you want to know what is the stranger part? If I reboot the host,
the rule matches as expected...

I'm running iptables v1.4.14 on Debian 7.0 and I have no idea why this
is happening.

--
Jimmy


