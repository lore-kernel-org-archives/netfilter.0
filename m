From: Michele De Candia <mdecandia@gmail.com>
Subject: Clusterip and NAT rules.
Date: Mon, 14 May 2012 18:09:04 +0200
Message-ID: <CAAPDZK9k44dgBrvi6V6ohbSdgg=AHRrBDKRCCFM88+mxE1SxAQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=V5sD6G8Ixvu5zcISQ7dspSIgqFZD1t6b2CicdTrp1z0=;
        b=Tgk4DWTjMIMe0dzXmqwyZWPHs9IR8wvTHG786Q3SoKgJI8moyhaX1bQdauRnBh8My2
         ozfO82k6qCDi0N4piLOpO4zZsaJ3ZEmFePGeJ6hgB5eAeieJSk6Q1HdikbIhkgTcMWuK
         0u/UQPgikST3X8YN+UJRF/qczb+h4dYyLfHtQ+TtYoS0g0KtneFm4EiKZlT+APq4dCYh
         aXuSMYu+k/IKT0ulR8Acy04xWDCehi7dTjJ4m2HcPggG6OeFg/fppCfI1c1j8Kcm5Mkt
         rW4v3OabYc4xT9N+9FRC8Xg4yT4aQ/VKtqW2q97ecdx/GlpfcvdlxGel8ZaiLSOGSpBp
         Y3WA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,
I need to set rules for port forwarding/NAT on a clusterip-enabled node.

I have this configuration:

internal machine (A) -> CLUSTER -> external machine (B)

I need to reach an UDP/TCP service on the external machine from an
internal one (A).

Is this feasible? Considering that clusterip nodes share a multicast
mac address,
seems that port forwarding can't be enabled due to impossibile
multicast packet forwarding.

I'm testing that setting one of the real IP of the cluster as gateway
for node A, I'm able to reach node B;
otherwise, using the clusterip address (associated with the multicast
MAC) as gateway for the node A, node B is unreachable.

Is there a way to to NAT through clusterip?

Thank you,
Michele De Candia
