From: "Wessel Louwris" <wessel.louwris@gmail.com>
Subject: pptpd on multiple wan connections
Date: Tue, 1 Jul 2008 02:29:53 +0200
Message-ID: <d97749ef0806301729n209f8e93ra70497688f135851@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=tVzsw+0HZ5KKK44NtE3FowB1bX//aYJ3PC9tvLgfe+8=;
        b=tZbeR+I4KxsOW0iIAeJDdvxyAxH5OAhBkTPMVB2jkJbvqDxdTI3s9z8xa5HOHGUgKt
         FJ1R/oGUvylhR1LANLhbZIl20kkjUSYu8n9U5hWI+UslPNdGqMqGVjaGrCSyFYedfGCs
         i+Wos9WcZvG3Ayr5ynwyG8tm1nqu+34g3WfLw=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I have a pptpd running on a router (ubuntu 8.04) with two WAN
connections and does some traffic balancing on these connections
(configured with ebox-platform btw)

The pptp is configured to listen on the first (eth0) WAN connection,
but sometimes the GRE traffic is going via the second WAN (eth1)
connection, which results in a 619 error in the microsoft pptp client
after a while (makes sense I guess).

I tried adding a rule in my mangle table, which seems to work for tcp
port 1723 but not for GRE. What am I doing wrong?

The correspondig rules are:

-A PREROUTING -m mark --mark 0x0/0xff -m mac --mac-source
00:19:CB:3E:2A:0F -j MARK --set-mark 0x1
-A PREROUTING -m mark --mark 0x0/0xff -m mac --mac-source
00:1B:54:CB:7E:05 -j MARK --set-mark 0x2
-A PREROUTING  -p tcp -m tcp --sport 1723 -m mark --mark 0x0/0xff -j
MARK --set-mark 0x1
-A PREROUTING  -p gre -m mark --mark 0x0/0xff -j MARK --set-mark 0x1


Thanks for your help!
Wessel
-
