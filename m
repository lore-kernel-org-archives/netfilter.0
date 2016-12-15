From: zrm <zrm@trustiosity.com>
Subject: Attaching nfct timeout policy
Date: Thu, 15 Dec 2016 13:46:46 -0500
Message-ID: <a3a12638-9927-e514-f3f3-9ef28be31060@trustiosity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.trustiosity.com;
        s=mx; t=1481827614; bh=iLzCgROP7OlIXtGhu6GrZUjhb8ijBL8e3CQWFdz0bN8=;
        h=To:From:Subject:Date:From;
        b=2HFJvOO4U25pEI4n8nmGV2L2rl3UoOqisrUPfs9e8RGM8tx8/lCeAI0VA7mQgmBW5
         VAefj/SX67shEdJXGPgBdSl5O+gZkoeWFxJ2Nrk7S2ONW2J5UicYB/Rt7Tou7y9Vcj
         qembIgmRSGQ9VdFdK70VhTebx+fdJIv6rU+20T0k=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

The nfct command allows creating a custom timeout policy. The man page 
describes how to attach the timeout policy using iptables.

How do you attach it when the flow is created using the conntrack API 
with NFCT_Q_CREATE, or attach to a flow that already exists?
