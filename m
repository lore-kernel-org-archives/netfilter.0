From: emacsuser emacs <emacsuser123@gmail.com>
Subject: Unable to broute packets containing VLAN tag
Date: Mon, 7 Nov 2016 12:42:01 +0100
Message-ID: <CALR9CgcPK9QMVVGDuokAdfe0-DY09T+vCm6W6J6FA=sn_1E62Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=XafNsP1YIJSSr/YzQuZZlPeGzzoavTRgsikFshIKHXo=;
        b=PyYDNGV801ilG4ILkAYw3V3msztjaHL/12cVegED44w0V5LIKeAD9kYaXrFpD1r5f+
         +vwafuNioeju+WhfYXznyG1HqLGr2DTpas0alywxQUEHNJeX5cY2b2bkSGMoHmjo+1Te
         JRBjdg83t/0TPUCAN89AEgXqBQ3Gt/lKNG4Fl3j8O5fcZttM/H1q+Z55WSlHDSl8Mss/
         NN5nw7nfADaEefgoLVtJC4laZb3kWluUleJmKa+JQCHfsA/RjgilClSo77hga1OVrdqe
         3v9JLyjjy9i1IX40E6VGOmfzYEk6IIHI3dgQm8NbucxtyLt3yXoMZ/LT40m0ioPu7roU
         vYrA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: emacsuser emacs <emacsuser123@gmail.com>

Hello.

I made some progress on my broute issue...

Now, I am able to see in syslog file incoming packets with VLAN info included.

The ebtable rule I'm using is:

# ebtables -t broute -A BROUTING -i eth0 -p 802_1Q --vlan-encap IPV4
-j redirect --redirect-target DROP --log-level DEBUG

(eth0 interface is added to bridge br0)

The problem that I have now is that packets with VLAN_ID other than 0
are not brouted to the iptables layer.
Instead, any incoming packet with VLAN_ID = 0 is brouted to the
iptables layer successfully.

Somehow, ebtables is dropping  those packets, I do not know why. They
are logged to the syslog fiel successfully, but they are not sent to
the iptables layer.

Do you have any idea why packets not having VLAN_ID = 0 are dropped by ebtables?

Is there any way to enable additional logging on ebtables so that the
reason for dropping packets is dumped out?

Thanks.
-Bob
