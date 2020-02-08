From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [firewall context] packet presentation for dual WAN interfaces on the
 same link - eth <> pppoe?
Date: Sat, 8 Feb 2020 16:03:53 +0000
Message-ID: <e825da29-8a00-972d-40a7-f2588f4229d9@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1581177835;
        bh=pCqS3K9p9Q0XIHe0gBG0QKs8iU19pW1oQCnU1HPMMsY=;
        h=X-UI-Sender-Class:Reply-To:To:From:Subject:Date;
        b=ebMpPUb3Ikl/+/erxj24g8sQ+cn+yeuD4YacCIARnZny0LURxISREURJs5a4iIGyi
         BLljFb/pMIw45EhZb8pALcp9ekcic4tb46ZdtRP7W7RlZXSmFndpCAD4NYIzJOTHB2
         MQEZuyzcWFKVUB8NsNGJzibBlwALX3QUKCaGx+L0=
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

With a subscriber line where the ISP has implemented PPPoE there are two =

WAN interfaces present in the CPE's network stack:

* ethX
* PPPoE-X

It seems that each interface is treated separately (netdev), as opposed=20
to collaboratively, and require in firewall context separate rules=20
(duplicated) for each interface - is that a correct assumption?
Asking because noticed that with a global drop rule and certain packet=20
types specifically accepted on ethX the same packets are then being=20
dropped on PPPoE-X.

In which interface order are the packets presented for inspection to=20
netfilter - fist on ethX and then again on PPPoE-x or vice versa?
And whatever the order - is it the same on egress as it is on ingress or =

is the order inverted with opposite flow direction?

