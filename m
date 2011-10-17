From: Michael Robinson <mike@robinsonhome.org>
Subject: Removing VLAN tag from outgoing broadcasts
Date: Mon, 17 Oct 2011 15:16:25 -0400
Message-ID: <CA+JOZmMvZQ2eSPh=V+QeX9APg3qXsTmnzOrne5CbyT3dr1Xo5A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:sender:date:x-google-sender-auth:message-id:subject
         :from:to:content-type;
        bh=9Ee1EY+he5/1zfcWdB1APAhqFEbSrW0DYj+QAdGB8U4=;
        b=hK2fHZXBskLN2EDnB0FaOGp2ObpywL5iC7rUxmf/kT7UJmHCnLdqjZgt2wRssC0fuz
         H9mrWHehE7eNKgh9GvDQ3I6bkNGtLVqGLzjyeFRKsdSAONd6xN3xAgrd0hOMPS1Jxzz9
         vGzF/c4HaZjUdsGIJBu08G3Bo9lYXw4LrsfpM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I've set up a Linux (Ubuntu 10.04) server with multiple VLANs.
Routing is enabled for all interfaces.  The 'eth2' interface is
basically used as a VLAN trunk:

eth2      Link encap:Ethernet  HWaddr xx:xx:xx:xx:xx:xx
          inet addr:192.168.190.2  Bcast:192.168.190.255  Mask:255.255.255.0
          inet6 addr: fe80::210:18ff:fe0a:ac42/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:9247 errors:0 dropped:0 overruns:0 frame:0
          TX packets:10952 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:955923 (955.9 KB)  TX bytes:1535021 (1.5 MB)
          Interrupt:17

eth2.2049 Link encap:Ethernet  HWaddr xx:xx:xx:xx:xx:xx
          inet addr:192.168.101.1  Bcast:192.168.101.255  Mask:255.255.255.0
          inet6 addr: fe80::210:18ff:fe0a:ac42/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:3853 errors:0 dropped:0 overruns:0 frame:0
          TX packets:4721 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:246915 (246.9 KB)  TX bytes:504861 (504.8 KB)

eth2.2050 Link encap:Ethernet  HWaddr xx:xx:xx:xx:xx:xx
          inet addr:192.168.102.1  Bcast:192.168.102.255  Mask:255.255.255.0
          inet6 addr: fe80::210:18ff:fe0a:ac42/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:4437 errors:0 dropped:0 overruns:0 frame:0
          TX packets:5311 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:463381 (463.3 KB)  TX bytes:730316 (730.3 KB)


The setup appears to work fine.  Now, for reasons beyond my control, I
must change the behavior so all outgoing broadcast/multicast packets
are sent untagged (regardless of their source).  I'm hoping that this
would be possible with ebtables, but not being very familiar with it
yet I was hoping for some guidance.  Is this possible?

Thanks,
-Mike
