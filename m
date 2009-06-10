From: Mark Ryden <markryde@gmail.com>
Subject: Why doesn't the UDP source port change?
Date: Wed, 10 Jun 2009 14:09:41 +0300
Message-ID: <dac45060906100409m9614b66if48f11eb5d425a3d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=nu1VK+imGWwOg+n7gZJfjGK5v9NcgrlfyjbvhF2nzlk=;
        b=M4xJoQYqJXdWyNmrIQec8y0V/LD9tCQEa4LMtEqlQiJkpun7JPSq++iEFxlKVuyiFA
         uhODgcImV+0OGCycc6oqQGLP/szdnXZnZR2K57x4ebOEQdlMFEOQD+IuGnc3ERag2Ygs
         Pv0yd2SYmmiVpKFKrINydR2+jNVuJYdtJtZQ8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,
I am trying and having success to build a NAT using MASQUERADE target;

I have a machine with two interfaces. eth0 is an internal IP of
192.168.0.45 (internal)
network. eth1 is 10.0.0.1 (also intenal network)

On this machine I run this:

iptables -A POSTROUTING -t nat -o eth0 -s 10.0.0.0/24 -d 0/0 -j MASQUERADE
iptables -A FORWARD -i eth1 -j ACCEPT

I have a second machine, 10.0.0.189. This machine is connected directly to
10.0.0.1. (I can ping 10.0.0.1). It has only one nic.
On this machine, the default gw is 10.0.0.1

Now, when I send from 10.0.0.189 a UDP packet to a different machine
on 192.168.0 network (for example,
192.168.0.10) , it goes through the NAT on 10.0.0.1. I see that the
source and destination UDP ports stay the same
in the sender **and** in the receiver. When dealing with real NAT (when one
side has external IP address), than the UDP **source** is changed by the NAT,
and it is not the same on the receiver and the sender.

My question is: how should I configure the rules so that the UDP
source port will
be changed by the NAT so it will not be the same on the receiver and the sender?
rgs,
Mark
