From: Kevin Peterson <qh.resu01@gmail.com>
Subject: OpenSuse blocks outgoing connections to 3260 port. IPTABLES is not configured
Date: Sat, 17 Aug 2013 17:15:38 +0000
Message-ID: <abcd1234abc123ab12a0000010803000010000006401@gmail.com>
Reply-To: Kevin Peterson <qh.resu01@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:to:from:reply-to:subject:message-id:mime-version
         :content-transfer-encoding:content-type;
        bh=51xhnmrxoJRIeUjcUjirvqt20lBzVB1uCkb5Vkj4I+8=;
        b=maJ8Uz+Z2dhU8QDCv3IlB1pICZRXDm8WU0YmdBR/Mco08OGChJIaE6Tc6RRb0FElPN
         NbQgp5c3NpZ3dL3zF33j95Z/dUot1Gj6ZuRqPbUK1zmU6i/lbmWamA08XFiQCtmp30Wm
         /rcP/C8Kh8KknGTeCSfsEDCy3+ZUwxNL7LdXdtPJd02mRCoxeaLctIky3MpFkRo+ks2B
         dHR3KgWvem7Scsg3D6Ss1JrYxdxDpJp1uYMhFLzVDatpvta36DYgjfAGt+gXR1WsL6J1
         tmfBeQY4ZHv9bb8sKDZMXlUM8Oe5IOppYosEgPbpjcKM7c9coV2kabf3eWLjRufpOxKk
         8MKw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi, 

I use OpenSuse 12.2. IPTABLES is not configured. I could connect to any port from the server except 3260. What could be the problem?

The server is a qemu guest. From the guest, I cannot make outgoing connections to port 3260. Connections to other ports are working fine.

Thanks,
Kevin Peterson


