From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: iptables 1.4.21, 'recent' bug?
Date: Sat, 7 May 2016 23:26:52 -0400
Message-ID: <20160507232652.6110bc9d@playground>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU u483QtZA017437
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
	t=1462678015; i=@wpi.edu;
	bh=hRQu3D11L7sHCeLcs3+IsTrrsce99mNXcA3DCtmJvdQ=;
	h=Date:From:To:Subject;
	b=lDcrKcH8UJCWwuYaTWJVEAq+RLfP6D/rdtOqIK7lqlT83DWxJ3zXCGtM/61bwMzRC
	 etgOv0UDeVfD7Oj7kBUsKtWwGe7P0XG2d9gHYnQYuFoe0DbKI5qZvUMnnPWu9gEM7Q
	 KbPHb2n9Ay08sksXHBFlZnoAMQhMGhZ7y7+qYF6Q=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

  iptables -A INPUT -p tcp -m tcp --dport 22 -m state --state NEW -m recent --mask 255.255.255.0

results in 

  iptables v1.4.21: unknown option "--mask"
  Try `iptables -h' or 'iptables --help' for more information.

Yet iptables -m recent --help includes:

    --mask netmask              Netmask that will be applied to this recent list.

Looking at the source, the only oddity I see is that struct xt_recent_mtinfo does not contain mask, while struct xt_recent_mtinfo_v1 does contain mask. Is this telling me that --mask used to be, but is no longer, supported? Or is it a bug where a simple patch can fix it?

FWIW, v1.6.0's libxt_recent.c is unchanged.

Thanks,
Neal
