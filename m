From: Susant Sahani <ssahani@gmail.com>
Subject: NF_STOLEN and re-insert in to IP stack
Date: Sat, 30 Jan 2010 14:28:47 +0530
Message-ID: <d81115a61001300058o65e0c079nf4d8469da024b53c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:from:date:message-id
         :subject:to:content-type:content-transfer-encoding;
        bh=IcIvST+TfjVmWs3etkXuDn0JtHo3zS4RDzaCceb6a94=;
        b=mcxE4HJ3w4atrgpJ8jIH4EY+5Pmo+0fBu3CabxKA2vr57ivc/sbcSkuPEDd8vYJz0K
         QQ9P+1k0Wco4FHwf15fitmsbKkIAaclhDq28aMYfyOYaEEGSFaINDw1a1DPjckJuq6L0
         Eq3uZlt36CJMtvgKKvnVSJNdm+m1w0l+x67l0=
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter-devel@lists.netfilter.org, netfilter@vger.kernel.org, netdev@vger.kernel.org

 Hi,

 I have yet to find any resource that answers this question. =A0If I
have  a kernel module that registers a callback with netfilter and
steals a  packet during the NF_IP_PRE_ROUTING stage, How can I
re-insert this  packet on the network stack, (before the ip routing
stage) .

 susant
