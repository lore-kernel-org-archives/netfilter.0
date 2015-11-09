From: Mark Carey <mark.carey@gmail.com>
Subject: iptables: ipv4 masquerade between class c subnets
Date: Mon, 9 Nov 2015 19:58:23 +1300
Message-ID: <CA+ffBu4DfB4g4SjheLgwT33u+zJ87M2XPNGayJ6n6SD=i1QBVQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=00wL7wjIFxNRHdmFsHwiHGixW6XZ+Cef73mimFCfMbc=;
        b=U0Xckuk75XVNO2Iw+UITbp4ulJ9EWQJoZvOwNaA3rRtOVQxf5utkrGImDr8E9vaAYo
         PxWEV1owMB3PIz+BCHP0DHK38CP8+vdj2pOVMn/jhatu8CpkVKHO0Rh4we9px5gxt8ya
         WwQ8tmqs2Pk4S19QW+bMZU9cdCzv8a/InmdUUQuRydL527JsbyYQLUNMByTOZ7qpQbeT
         YVuJE5G+BubYMLsw+fy5Dv6A3AnhPgMMV6f/AiBGHK+1g9xzEEqmb3L2pcoladqJ6eA0
         K7qbd2b/NnUlf3dCilENWu8cllEHnTSPdWbU0vcQAkkGf1eCSY2ilKXjkN2m+/GJdqLE
         8lVQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am new around here and on reading "iptables: masquerade between
class c subnets" you may probably be wondering why I would want to do
that when I can use the forward mechanisms of iptables.

One of our team wants to use masquerade and for the reasonable reason
that it means we don't have to tell the "destination" class c subnet
about the "sending" class c subnet. Meaning we don't have to set
static routes/gateways on a whole lot of machines.

I've done some looking and I've been unable to find any on topic
information so please point me to a FAQ (and/or enjoy chanting RTFD if
necessary) if I have missed something....

We have

1.  Network A 192.168.100.0/24 connected to the internet via a router
(rAI) (everything on network A works well)

2. Network B 192.168.150.0/24 connected to Network A via a router
(rAB) with two NICs 192.168.100.1 (eth0) and 192.168.150.1 (eth1), all
machines on network B have rAB set as their gateway and DNS.  rAB is
running a relatively modern version of Mint, with dnsmasq.

The config on rAB is pretty standard, all policies are ACCEPT and the
POSTROUTING chain of the nat table contains a single rule that grabs
everything going out eth0 uses the MASQUERADE target.

3. Machines on network B can see and access the internet just fine,
and can see rAB and rAI but not other machines on Network A.

Is this by design i.e iptables/MASQUERADE isnt intended to be (ab)used
this way?  Or should this work and I need to work harder on my config?

Suggestions/helpful pointers please?

Thank you.

Regards,

Mark Carey
