From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: Reject on a Bridge
Date: Wed, 3 Sep 2008 15:41:13 -0700
Message-ID: <d95317090809031541n396f4ddao29dbbfa196801f64@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=3Hp30jhOXfIhypCQbJzMPd7OFC7zh6lgSZDh3U4eIlA=;
        b=RNKvt/fSGJXNbvv4BVV2KYcNSPgJiG49+5PE/Zgs2GtsIUS1h2/BAK5aVSj5TolD+N
         FCrFDkIfpxofELZlCOy4ylGamW4dntNA9R4vV+FbomTfqALhnXLv5++7VbHf6l7L4782
         CXI9i8MBW3hF9EIe2+DPsw6DHCpjTsLWcB10o=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I am using iptables to run a firewall on a bridge.
The bridge consists of eth1 and eth2. Neither interface, nor the
bridge itself, have an IP address.
eth0, which is not on the bridge, does have an IP address.

Trying to use the REJECT target with --tcp-reset doesn't work.
If I understand the code correctly, the route for the RST packet is
determined through ip_route_me_harder in the send_reset function,
implying in my case that the RST packet will leave through eth0, which
is not the desired behavior. Theoretically, eth0 might be even
physically disconnected from the bridged network.

Am I missing something, or is this a real problem ?
