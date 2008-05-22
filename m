From: "=?ISO-8859-1?Q?Fl=E1vio_Costa?=" <fcosta75@gmail.com>
Subject: Router with 2 public interfaces
Date: Wed, 21 May 2008 16:36:25 -0800
Message-ID: <9b7febdd0805211736k3f34b85i659d4aa761e09bda@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=M0grmqzv1p0Li3SF3dLDTEQ5BFhA+j2I58r67u6c+PA=;
        b=jzNpQeiJgOwJ7scSqUIkOwACsDxjf0hkVUmpXr22jFNX61d1SA38S2/+URuK2xUiQBhsYBWTFQGV9pzAkxOEVd0UX8thTaIw5uBXBQOjTl4IB1Wvjh71OoXLlBDOYy5KwlHpd4+/fj3qEs9NyuGNXBLtU+BKeaCZPsMMQ18jV6U=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi.

I have a router with 3 interfaces. One is connected to an internal
LAN. The other 2 are connected to internet.

I have the following interfaces:

eth0 -> (internal ex. 192.168.0.1)
eth1 -> (fixed ex. 200.213.105.108)
eth2 -> (dynamic ex. 201.10.10.11)

The default route is configured for interface eth2.

Inside LAN I have a webserver listening on 192.168.0.10:80

People reaching my webserver by interface eth2 is all working fine.

When someone connect to webserver by interface eth1 I doesn't work,
because packets go back by default route (eth2), which is not the same
they arrive (eth1).

I tried marking packets and forcing transverse by original interface,
but it does not worked.

Can someone give me an example of "iptable" and "ip" commands to
configure this? I do not want balanced traffic, because in future I
may block incoming requests to eth2 and keep it default route to
people in LAN connect to webservers by that interface, which is less
expensive.

Thanks in advance

Flavio Costa
