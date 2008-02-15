From: "Salatiel Filho" <salatiel.filho@gmail.com>
Subject: Little help
Date: Fri, 15 Feb 2008 12:39:46 -0300
Message-ID: <beb91d720802150739p210cd688l73b3b1ce555685a8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=Ny33YoEIXmWxAASxwXsjcQTwnpF1rCQmCkF/XQHfxLA=;
        b=JVAGxON/MNuzWOuOVO6rVg4quS4zfLZtNCC8n++5NHj0JDnw4ZsnJgrvr27zuehDKwVMjEStvKmJtBCVi5uCxyytTWJ/pv3QoXTVFoXYqg5POof3wnBgHmGrIpf7WtrAk4XhTOGjoM6H67jBxKXYdWm8zstpMo8tu2RTgkEllKM=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi guys , maybe someone could help me to understand one problem i am
facing with my setup.
I don`t know exactly if it is related to iptables itself, but any help
is welcome.

I have one server doing NAT/Firewall/SAMBA to my local LAN, the setup
is like this:

eth0 connected to the dsl modem. Connection using pppoe.
eth1 connected to the LAN.

i have the following rules in mangle postrouting...

# iptables  -t mangle -v -L POSTROUTING
Chain POSTROUTING (policy ACCEPT 24M packets, 14G bytes)
 pkts bytes target     prot opt in     out     source
destination
 202K   38M Default    all  --  any    ppp0    anywhere
anywhere
 202K   38M IMQ        all  --  any    ppp0    anywhere
anywhere            IMQ: todev 1

If that rule is right the traffic will go to IMQ1 device ONLY if it
will go out through ppp0 , right ?

The problem is : When machines from the local lan try to access the
SAMBA sharing on this machine, the traffic is being shaped inside imq1
device and i can not understand why. The traffic is going out through
eth1[lan interface] , so why is it entering that rule ? [that is the
only rule that targets imq1 device].

You can ignore the "Default" target on the first rule , it is used
just to mark a few packets to be identified by iproute2.

I am using kernel 2.6.21.5 and iptables 1.3.8.

Thanks in advance.

--=20
[]'s
Salatiel

"O maior prazer do inteligente =E9 bancar o  idiota
   diante de um  idiota que banca o inteligente".
