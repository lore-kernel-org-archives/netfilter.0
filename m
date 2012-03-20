From: =?ISO-8859-1?Q?Fr=E9d=E9ric_Dreier?= <frederic.dreier@gmail.com>
Subject: first packet lost by iptables
Date: Tue, 20 Mar 2012 23:36:59 +0100
Message-ID: <CAA5b1EuW=hiBpxxR124TepS=bZwt4MTFnEG_5U4r_MM-dO5hSA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=u7S/w1urR8KlTW9eT42BKhJ4u7iTmE+YuPH+f6zxtxM=;
        b=lIkKy8ydvMku6oGRp7veVSzUb0+3dpG5gzFHn/PIGBBtEazbbfK8+sx6qf53daIiUl
         4OE4YOXKI70EBdcnAJc3mWYxrEGOlr5/hzM5DmoMh9tUWGJxl9xHoBcvH3LyQ+vGf9oa
         /peUsgWdONc30q9VduQiFliIbILpsAuAPogRdfPCQ/RtLwkXk3VCaQ4NUwEIwkhRYrO9
         eB1ctwq8MxODMNZ0hGQLzUMO1JzuyX9eREJIzmBPhFdotuzuWl835spa7jX6Dh1yU8rT
         TsVXyf5eE17fWKyJe1YjR1h6yEjB5fwhkQjPsp4nv6DpWOyr0gCEG2L1V1trNOzvt8ui
         U+Pw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have several machines hosting kvm VMs. VMs are connected to bridges
which are connected to VLANs.

When I try to ping VM2 on hostB from VM1 on hostA, the first ping
request is silently dropped. Following pings goes through.

I see the ping request on the bridge of the hostB. But the packet is
not copied on the vnet interface (which is directly connected to the
bridge).

setting net.bridge.bridge-nf-call-iptables = 0, solve the problem but
totally disable iptable (I will need iptables later). Therefor I think
that the problem is iptables.

iptables are empty and policies are set to ACCEPT.

There is nothing in syslog (martian packets)

It is Ubuntu 11.04.

How may I debug this issue?

Regards,

Frederic
