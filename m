From: J Webster <jw.jwebster@gmail.com>
Subject: only direct port 80 traffic from client
Date: Thu, 21 Apr 2011 09:56:51 +0200
Message-ID: <4DAFE343.3070603@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:content-type:content-transfer-encoding;
        bh=HFMYy7CYYU9opMZ9X7TfC7Uoyr48l3eKO/GZolpeBc4=;
        b=Se+lileKcVar02NiBSFO/OFUu2MtHUD/oxPzhyQW8BZPALkhT4LG5Lufy1lgaKsQYh
         bK8b0Gc8jZNVg4mXQYGQtNGDyz0qq6dtDq8J1LtyjM8tgzzHXaF9HlQXiAWudqBgYYxA
         WoN/razzTB+IOU5tY7Udk8fuWPPuZrZE+FfOo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have a public OpenVPN service on my server authenticated by certificates.
I only want to route port 80 and 1935 traffic from the client. All other 
client traffic should go to the normal ISP.
How can I make sure that clients do not send normal traffic through to 
the VPN server? As far as I understoof iptables rules would only act on 
the server so if I blocked email traffic it would just be dropped.
