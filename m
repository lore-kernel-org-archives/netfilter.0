From: "Garrett ." <orthostatic@gmail.com>
Subject: nftables: Anonymous vs. Named Set (ipv4_addr with netmask)
Date: Sun, 20 Mar 2016 20:44:43 -0700
Message-ID: <CAAcp+HDRi5yGqJ=vkcKm0OzQq+f1T0vepWb8rcdiVrTGBXJ1ZA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to;
        bh=2DDWByrgDWq8mubBMDmKX1MXiTvTdi2liuanHLmG1DA=;
        b=ALcN0yNUJg1QzUsp3YB501I7U3ILu7bxwWnMuSJYRFM6qBr7WEPjplSRh7so0T4e34
         clI0Ymk1iuKWyKWnSDM5e5Jd1YDuinsKmfAfIhV0nAdI5/EBGU6O1pHMDnO0FAj9g3iR
         w1qvNpYr6y3qKBIcv5yOqWsitbmZ7657BnN/be9lW9ngpMKIzTaIlM44TTBcW9DzfH53
         4GMwdrDnOITMz6fAYXajoXF13aDYMt1tqV/Zk8Rtw7nJ2qWoZM0Aaa15pKYw4zvBRS8g
         kEiCtOaS8DMTsuM6o2FfJVm0gd6X6x0aHPlh5ri+l1S0cYDK4NBMCuVDZctyjBuEXXq6
         MlAg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello, Netfilter list. I'll start by thanking the Netfilter team for
nftables; this is a fascinating project, and I'm enjoying my studies
of it. I write because I believe I have found a discrepancy between
anonymous sets and named sets, and I wish to inquire further.

It seems that anonymous sets having IP/mask notation are classified as
type ipv4_addr, shown in example one below. It also seems that named
sets of type ipv4_addr cannot leverage the same notation, shown in
example two below. Is this intended?

I included some rudimentary version data for my Gentoo host. Please
advise if more information is needed, and thank you.

Regards,
Garrett


Version Info
-----------------
bash# nft --version
nftables v0.5 (Support Edward Snowden)
bash# uname -srp
Linux 4.4.4 AMD GX-420CA SOC with Radeon(tm) HD Graphics
*monolithic kernel
*NFtables enabled and built-in
*iptables and xtables disabled
*libnftnl 1.0.5
*libmnl 1.0.3


Example One - Anonymous Set with Subnet
-------------------
nft -i
nft> add rule filter input meta iifname "eth1" ip saddr {
10.0.0.0/8,192.168.0.0/16 } counter log drop
nft> list sets

set set0 {
    type ipv4_addr
    flags constant,interval
    elements = { 10.0.0.0/8, 192.168.0.0/16}
}


Example Two - Named Set, type ipv4_addr, Subnet Add Fails
-------------------
nft -i
nft> add set filter rfc1918 { type ipv4_addr;}
nft> add element filter rfc1918 { 172.16.0.0/12 }
*** nft: netlink.c:326: netlink_gen_data: Assertion '0' failed. ***
nft -i
nft> list sets

set rfc1918 {
    type ipv4_addr
}
