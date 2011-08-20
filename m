From: =?UTF-8?Q?Martin_Osmundsv=C3=A5g?= <martin.osmundsvaag@gmail.com>
Subject: Tagged bridge stops traffic to untagged interfaces.
Date: Sat, 20 Aug 2011 11:14:24 +0200
Message-ID: <CALOqM9An+7HpqzTx-HQ5a+W41CYXPcKq5AT_afWJTSaM77BW6Q@mail.gmail.com>
References: <CALOqM9DriK1_QdxAQgtNdae0CbJOz=nu4C-a4mki+RhTik=0XQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=+2xjm9RkzA/HVRCrmYPqFVzuPmcMHDJCdyICAXnui0k=;
        b=il19yqWBinGbaESZtQduqIi1umVKLerbgLc/zr2j69MZRu3dWKg0QRo3Ycs20puyD5
         2REWWiIfeK7Ni5eCWbU7WXe6JVjKoasAu6jxqNZrYEbPXAdYDm/VMNi77J4c88vcLqWM
         d4hFkLT0xYIighga+hElaLHdLS/+hjQNigWIQ=
In-Reply-To: <CALOqM9DriK1_QdxAQgtNdae0CbJOz=nu4C-a4mki+RhTik=0XQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi!

I'm configuring a setup for a KVM-server on a ubuntu-server 11.04. I
have an unnumbered bond0 interface with several bond0.X interfaces for
each VLAN connected to it's own brX bridge. Now I can make hostOSs and
connect them to their VLAN via the brX bridges. Everything works fine.
The problem is that I need a HostOS with an tagged interface. I make a
new bridge "taggedbr" and connect it to bond0 instead of bond0.X.
=C2=A0 # brctl addbr taggedbr
=C2=A0 # brctl addif taggedbr bond0

Then all traffic to the bond0.X interfaces stops and all the other
guestOS'es have no network. All the tagged traffic goes to the bridge
"taggedbr". I do a
=C2=A0 # brctl delif taggedbr bond0
=2E.. and everythings comes back.

i read that (in newer kernels > 2.6.34 or something) this is because
the bridge has presedence over VLAN_tagging and I need to drop all
VLAN-tagges
packages to get them passed the bridge and on to the bond0.X devices.
I tried:
=C2=A0# ebtables -t broute -A BROUTING -i bond0 -p 802_1Q -j DROP
=2E.. but this does not help.

I'm not sure how to debug this correctly, but I guess it's a minor
detail I'm missing. I have also tried to echo 0/1 to
/proc/sys/net/bridge/* but with no success.
I hope someone can point me in the right direction.... Thanks!

--
- Martin O.
