From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: nat bypass
Date: Mon, 28 Jun 2010 15:43:46 +0530
Message-ID: <AANLkTil_H1QeaCHQYhMjVRFiLwtqF9yLAJZ9BWecOIDW@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=ZfDBcpRz+r+XBCYi2SjYdg42U43rsmCQG0BjSStRHO4=;
        b=m6vey+Zw+KGqtDBv6uBTp0RiEjxVpims1ySq0+e3VJ0if8GNEImKoUeDi52Jf1c+EX
         Lzo/9DS2zEpfFTqYm5j/fvlA4xVkFinz7glg3BQc7ViwQfO+IPTd3A7u8bWgaHdnXttB
         A1WXwE/YtQrm4XDHfPuXH+iskc5tog8r8+EjQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter mailing list <netfilter@vger.kernel.org>, netdev@vger.kernel.org

Hi,

  A -------> R ------->S

I have a linux machine A is connected to Linux machine R . Machine R
is having two network interfaces and acting as a router .
It has a dhcp server running  . It will assign ip in 192.168.1.0/24
subnet to all machine connected on lan side ( A is connected also in
lan side ) . Wan side of R is connected to HTTP server S . There is
also a DHCP server running on S to assign ip in 10.232.18.0/24 subnet
.  Is there any way , in which NAT should be bypassed to get ip from
DHCP server running  on S . My question is : How can A will get  an ip
from 10.232.18.0/24 pool ip .?
ebtables is an option ? How can we make it ?
Is there any other optimal way ?


Thanks,
Ratheesh
