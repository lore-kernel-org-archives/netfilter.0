From: Paolo Tezza <paolo.tezza@gmail.com>
Subject: SNAT problem with alias IP
Date: Fri, 1 Aug 2014 10:00:32 +0200
Message-ID: <CAKvhcF8_D8tC=qSUUb2Xa-Astu76KiDqakULYpk25uS6U1S8Vg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=t4NLZG/mThip/wtyUTKQ3RWrvQRSNW1Mn29yIr8GDtU=;
        b=ab9p2KhA3SqIBSXOaTi+2OgYL2WSmnsyx6JehYYmwt08rtTv32NvDTiSjviKn9NsW4
         K3RAu+cHPyDoc8I5pEj23dO/rUOj8I6YvJSrAMkAGhlpgmA3QnOBc+PkeYXrFJ/esbVX
         H5D89zJowsOjvHK5pph41Z4k0D+pBh+KU2BbyPNCQ++IGUjFZqPb6FNOr3AIF8mHMD74
         cqRJjE4jT4zvQzVgxotKcjvG/x4B1JBTjQj0HOxVuhOpSqbn5mLDSmbFEdPXmP0lRHA0
         aLWPcB8t2Nq27n1R1c1RFBlZ4Z3N1d2oVn3ATqgB/RBC2ZvUsWKwwYPUJepekSs8/8ux
         UFgw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all

I have a a firewall with 3 phisical nic (LAN, WAN, DMZ)
I have 8 public IP I can use on WAN's nic (eth0)

so I configured some alias on eth0:
eth0  x.x.x.234 Mask:255.255.255.248
eth0:0 x.x.x.235  Mask:255.255.255.248
eth0:1 x.x.x.237  Mask:255.255.255.248
eth0:2 x.x.x.238 Mask:255.255.255.248

eth1  10.0.0.254  Bcast:10.0.0.255  Mask:255.255.255.0

eth2  192.168.1.254  Bcast:192.168.1.255  Mask:255.255.255.0


I have added this iptables rule that work like a charm
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source x.x.x.234

both my LAN (eth2) and my DMZ (eth1) surf internet with phisical IP


Now I need that one host 192.168.1.201 will be "masqueraded" with x.x.x.238
so I add the rule ABOVE the first one
iptables -t nat -A POSTROUTING -s 192.168.1.201 -o eth0 -j SNAT
--to-source x.x.x.238



The issue is that 192.168.1.201 keep to use physical IP x.x.x.234 and
not x.x.x.238

Some hint?

thanks


Paolo
