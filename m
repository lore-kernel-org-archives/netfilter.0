From: Kfir Lavi <lavi.kfir@gmail.com>
Subject: Testing bridge setup with packet generator and qemu
Date: Sun, 14 Nov 2010 19:30:25 +0200
Message-ID: <AANLkTi=uyEveZf7+XLo0+mV48CFjsuzrTmkTi5Xbn_Dr@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=C+DA+657T5guUnPZ0NXSbvAgMrHxQHNAPKh2VY6rmW8=;
        b=X2xsd/NeYmWPmITxoaKnxMHbaUjAIo/QtmXp/ycWF1y7gAtkPS185wwV1B3GceXAu6
         jw3p2sJY5JmnYGTDO5e5S36O2NgASu2VOqpj+l9t2xIiB0APYbH2Ap9AVpX3CeEz9QES
         wCZUvcBMVbcsu4zT9T6i9MktPrJNiDyWDxjN4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, bridge@vger.kernel.org

Hi,
I would like to test a simple bridge setup.
br0 have eth0 and eth1
I want to create a fake traffic and see it crossing the bridge.
Lets say i'm generating arp packet with nemesis:
nemesis arp -v -d eth0 -S $SRC -D $DST -h $SRC_MAC -m $DST_MAC
nemesis arp -v -r -d eth0 -S $DST -D $SRC -h $DST_MAC -m $SRC_MAC

This shows on eth0 tcpdump but not on eth1 tcpdump
Why is that?

I have a gentoo rootfs.
qemu nics are define like this:
  -net nic,model=rtl8139,vlan=0 -net user,vlan=0 \
  -net nic,model=rtl8139,vlan=1

Regards,
Kfir
