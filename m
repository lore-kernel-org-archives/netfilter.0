From: Alberto Quattrini Li <alberto.quattrinili@gmail.com>
Subject: NAT with forwarding to multiple destinations
Date: Thu, 2 Dec 2010 13:38:29 +0100
Message-ID: <AANLkTinoWt8qNJKYhyjHbM5oOb-V6_aNAqTm=EJmU1Gn@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=g+xk88bss9zqCJEVtrFwrgclyLCnqyWl2VgZU83182g=;
        b=lDoX+Hflw7S4azNNfOTeTZYekAzj7JSHGXW0KKq4L/VZ3JIpaX9BY2vP1xfc46k9QQ
         mU/FKvQ5c9w+kEI3ifMcWOjON+8+iF3DFzpHOfpa5fd2/mTZhaz6hqadLmmRTzrqAbo+
         20iwYkf+g+P5Hig36sHIglGeO88TVNbDoR3EQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I would like to know if there is any way by using NAT feature to
forward a message to multiple destinations. I know that there is the
package TEE, but that works at IP level, and so you can duplicate the
packet to another host (i.e. specifying another address, but not the
port). Moreover I know that specifying a range of port in
to-destination just load-balances the traffic flow within that range,
so that solution doesn't work.

For example, let's say that I have a server that wants to broadcast a
message to different clients on the same machine (so identified by
localhost:port; each client has different port obviously).
So it would be very easy if the server can send the message to the
"broadcast port" and when netfilter intercepts it, by matching that
broadcast port as destination port, netfilter would forward it to
destinations specified by the rule.

Thanks
Alberto
