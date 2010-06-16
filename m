From: Ajay Lele <ajay.lele@gmail.com>
Subject: Fwd: Can Netfilter "mark" be used with setkey spdadd?
Date: Wed, 16 Jun 2010 09:21:39 -0700
Message-ID: <AANLkTikXfO5TnvTN946kVtdkO5rs6vwVx0DkOP5uIcRY@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=sQ6p4gn0NxZGTfzqiQeJhA4DeAJ/RymY6/lCqI8K8TI=;
        b=Jfz5MTURus7l1olTCskw44amneIoREIASbLow3txrbGbm/h6nWsX+wEQ1GyF5A9VCS
         faE4sNgsxPLyWO3vD7WLKxZXsVUrkm6Hsnv16AtKX01nbb2doc3Gl1FOUboh4+rasu64
         eeCyuxqRXp3X9Vvx3gtHHsESPJm/8WGBzMeBs=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Had posted this question to ipsec-tools mailing lists but no reply..
so sending on Netfilter list in case someone has a clue. Thx

-------

Hi,

I am working on a VPN solution where packets entering Linux box are
manipulated using IPTables rules (SNAT, DNAT etc.). The nature of this
manipulation is such that packets destined for different sites end up
getting the same src/dst IP address when they reach the Netfilter
POSTROUTING chain. However a different "mark" is set using the
IPTables mark target by which packets destined for different sites can
be distinguished from one another. Is there a way I can use this mark
value while creating security policy using setkey spdadd so that
packets are sent over respective tunnels (tunnels are created
manually)

Thanks in advance

Regards
Ajay
