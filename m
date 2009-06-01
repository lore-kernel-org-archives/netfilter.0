From: =?ISO-8859-1?Q?Fl=E1vio_Costa?= <fcosta75@gmail.com>
Subject: UDP filter with 2 public interfaces
Date: Mon, 1 Jun 2009 13:52:01 -0300
Message-ID: <9b7febdd0906010952ofa86bc4uf5217f01b433e844@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=Gey8jnN9at2/ke4R+gcftFBQGV7P/czhrTRI31XLsYU=;
        b=g0gs1huVQMuxyd09ootkzTEXazqHZU2rfLfyuewY8hBnCDFThkGM41zwOgAl6ot3Ng
         oabmo7FKc6H1P0+lR0f10e6Kv/fyTJZR6rgGhwg3Y2PpBqZhw4xn81eBvXM7mnp6C6QK
         RzkqJkLBWb2BGIoCZIUiaZN0ycaaUl5bXy9EM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all.

I want to host a OpenVPN server in a machine with 2 public interfaces.
It uses UDP as transport layer.

1st interface is a Cable with dynamic IP, and other is frame relay
fixed IP. The default route go through dynamic IP, and selectivity
traffic goes through frame relay.

OpenVPN runs on the same machine that runs iptables, and I want to
host VPN over frame relay, but it only works on dynamic interface. I
try to filter packets, try to mark packets with "mangle", but nothing
works.

I have other services that work over frame relay, but all uses TCP.
Only UDP does not work. I also have an internal terminal services
machine that work over the frame relay, but it uses TCP also.

Any suggestions?

Thanks
