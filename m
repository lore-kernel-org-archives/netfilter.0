From: Alessandro Fachin <alessandro.fachin@gmail.com>
Subject: iptables vlan and 802.1p marking is possible?
Date: Thu, 8 Apr 2010 12:30:46 +0200
Message-ID: <v2y624cd18a1004080330z1d60613dv7050c31ab573b42e@mail.gmail.com>
References: <j2j624cd18a1004080256ic9aca654k14babd170dcfce40@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=aEp2TujHSnKvGQRgAwHmg+0JFPCL0QE71SwFEbk1F7E=;
        b=lFA7ZPojuSfbvc4+k1vDYOSWGpDW37a0B3uOTMgRWrCSbeoF5+q6An/AnT4Qjgk2qU
         O7ufxDbWjNdUjqh/lczK2SQBUfo6XxA8BbYHbrBxdyG/CSRTeJYRkQSSmkymeEJydjfx
         Y3WmdEx/ZDFJnDXec3lLjL2dlmyIlutUAN8Gc=
In-Reply-To: <j2j624cd18a1004080256ic9aca654k14babd170dcfce40@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,
is it possibile marking=A0 with iptables the traffic coming from tagged
port (802.1Q vlan)
that is using PCP, the 3-bit field which refers to the IEEE 802.1p prio=
rity?
I'm trying to do this for keep the correct priority until traffic arriv=
eto tc.
Thanks for reply.
Regards.
