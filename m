From: "bldrnorth@gmail.com" <bldrnorth@gmail.com>
Subject: Transparent bridge and proxy - with only lo?
Date: Mon, 6 Apr 2009 13:49:37 -0600
Message-ID: <127d8b5e0904061249h4426b860n14cfcb6f3299a0ee@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=e+7bJHecQxmBEuTTNo07MdPxECJFbYE9cil/z+OwVi0=;
        b=Q87+eaWn8S9SFMOiAZuB2PKWJ3uXaHFugyCl1Ky2oQn53o2sMcQpH8CD9zytX0K4TD
         wkyJx4mcn6WMIkP0bOJJT8UjLmxmhQ2oqj7WM/fhAqawlMMy7CWyebiOi91zyg9TxcqJ
         GV5z7O98peRchRwjyIb/63aMNZ7Mgrah9xVJY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi:

While there is no shortage of documentation on setting up a
transparent bridge with Squid proxy, I have only seen examples that
assign an IP address to the bridge interface.  In my circumstances,
the bridge is between the ISP's bridge and our own router, such as:
(ISP Bridge) <--->(Our Bridge)<--->(Our router).  Typical I'm sure,
but Our router is assigned only 1 IP address so I really don't have an
IP address to assign the bridge interface.  Here's how I'm setup:

brctl addbr br0
brctl addif br0 eth0
brctl addif br0 eth1
ip link set br0 up
# Normally, would assign an IP address to br0 and a default route

I was thinking I should be able to re-direct to the localhost
interface 127.0.0.1, or perhaps assign an address like 127.0.0.2 to
br0, but then could not figure out the appropriate iptables and route
command.  I'm sure I could assign br0 a private ip address, but then
wouldn't be sure how to tell it to route.  Here's all I have so far...

ebtables -t broute -A BROUTING -p IPv4 --ip-protocol 6 \
       --ip-destination-port 80 -j redirect --redirect-target ACCEPT

If I've completely missed where this has been addressed somewhere else
I'd appreciate a link or some advice here.

Thanks!
