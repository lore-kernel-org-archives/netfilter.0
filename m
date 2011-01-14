From: nn6eumtr <nn6eumtr@gmail.com>
Subject: How to round-robin UDP packets w/ iptables?
Date: Fri, 14 Jan 2011 03:41:18 -0500
Message-ID: <4D300C2E.3040803@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:content-type:content-transfer-encoding;
        bh=R/eMEU8xE4qKvOPwHoqoHumOlP+qpFtVxCpKyxxRtoY=;
        b=GSUCiiATUeGYWErFcrAG9jXPBtDE3yrl36uviOsbCkaqj5abpaRxgoCIKTkKH41njZ
         Gzbk/a6tImpe2UKPZN2p0M/oP99XQe5pFwQRZn67brXGQOe7Nfm5Xb4BpqXvJgeXGMDE
         R6mW+glf2DVWccLSOsfjkQMM7x6zioYFaBEpw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

My goal is to receive a UDP packet from a single port on a public 
interface and redirect it to multiple ports on 127.0.0.1 in a 
round-robin fashion. The messages are simple one-shot receive/reply 
messages, so I don't need a persistent mapping, but I will need to make 
the replies appear to have come from the port on the public interface.
I believe it will be much more efficient to do this translation in 
iptables then to have a user space process act as a proxy.

I haven't been able to find an example of anyone doing anything similar, 
and its not 100% clear if this is supported, or if I would want to use 
the REDIRECT or BALANCE targets or some other method. Could someone get 
me started in the right direction?
