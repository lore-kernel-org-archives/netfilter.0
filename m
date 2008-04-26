From: "Yakov Lerner" <iler.ml@gmail.com>
Subject: Re: allowing packets from dynamic-dns IP
Date: Sat, 26 Apr 2008 23:02:42 +0300
Message-ID: <f36b08ee0804261302ubcc568fyab0d42e5645e3eab@mail.gmail.com>
References: <f36b08ee0804260934r3dc8be71hbd453dfc11e377f9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=9E9sKS1XKaucAGFKzzx4F/17VgibTovbS/l02CpjdSI=;
        b=GqPPzAZRaD4G1gzqW5Wz+HMX14K1xzSNI4QtkBM93XYJEgDZ093axGmJHbvAzvFErGmXUwBH8k2XfJ/uO/3U3yeXT0hSHE3F98WJA2Wh17JtpT3bhBFnRDeaVq7KUTySxuhJNDwwoXiFwps7b+ENKXpqEINN7haSt0q8NMb6EF4=
In-Reply-To: <f36b08ee0804260934r3dc8be71hbd453dfc11e377f9@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Allow me rewrite and clarify my question, I was not clear:

I need to setup iptables on system A to drop packets
from all IPs except packets coming from system B.
System B has dynamic IP (dynip.sh).  B's DNS name
is known but B's IP is not fixed. What are my options to setup iptables on A ?

Y.L.
