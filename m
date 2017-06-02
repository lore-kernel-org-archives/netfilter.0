From: Ran Shalit <ranshalit@gmail.com>
Subject: Server for reordering of NAT packets
Date: Fri, 2 Jun 2017 11:40:18 +0300
Message-ID: <CAJ2oMhLFrqz0kUvTXK=uXJjhJbyq3W-CBzqFZZHa2fJivhnRfg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=ANjc+ruSNVRUQV8UflDLWQ2VNkPyUvPNPedxdyVJUR8=;
        b=SzQhGqO3GD8w2eeucRzMcTacQYAMixK1wWDd2PwxmKYpKjucstkQGhcBnUVmGJBN9C
         zsgdgC3cksBW7NUjQg0Yt2CvCXiGaPF6t0mjwFkeclT1dIgljhU2mv8qr70A8wyn3aIM
         OcwY1xeq75o7jkcxkIuDRNLHBzFnmD0VBGox+aTLLQVrAb9Q6HnFx8kOsfgfksuHoIeV
         agPo/0vy8ciPuXZBvemkstVMIocq6l4Q9NJ3PovJTQ0A3eSJPEicjZYzWLa9mzqmUyjA
         uf6f9K66h85RT5XOhW2T8I/WVpBT3rZrI7sflFsEv41aU/taNi4i8+lEsStC3nIPhFxE
         IObA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I intend to work on a server which connects to cellular load balacing
router on the other side.
The server is connected to internet and recieve NAT messeges which
contain distributed packets (from 4 channels, so that we exploit the 4
channels bandwidth).

Now, in the PC side, running Linux, I need to queue/fifo  the NAT
packets, extract the internal packet in NAT and reorder them , and
reassemble the internal packets from 4 NAT channels into a combined
stream which goes up to PC web server.
There is also a need to do the other direction (from PC server, to
distribute into 4 channels NAT).
Handling this both direction shall require some layer for this
distribution/aggregation in the IP layer , and using queues for packet
reordering.

Is the best way to handle this layer is by using netfilter mechanism
with user defined chain ?
Should I use this mechanism is both direction (one extract and reorder
the internal packets within NAT, the other direction create a NAT from
the internal packet ) ?

Best Regards,
Ran
