From: Alessandro Vesely <vesely@tana.it>
Subject: OT: tracking default route
Date: Fri, 29 Dec 2017 15:57:29 +0100
Message-ID: <5a49f62c-0797-798e-c28a-214ae6e056d1@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=beta;
        t=1514559449; bh=GY0eWhzX/crxPEEiYJs1UR/zuA2BqMQEK6UxxmvVBNw=;
        l=649; h=To:From:Date;
        b=IiKooiW8OMMLYmt8YJDUAKnUSeIfflvHWK6OLVREgxGVh8bbhtmAu0kMz6vHSPy6m
         O9atgME+yGNz+Z4wTYC76xqCaI7r/AWrH9jlHDzDQo68XpZA9qq4FEe35IrUcQJ3EE
         LuFBuA7ZQrIQMaHIql3khhs3Ay4bHFedmMXss578=
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi all!

I've been calling a script based on tcptraceroute every few minutes to monitor
interfaces.  It is not reliable, because it only checks the next few hops,
which may turn out to be disconnected, and then I should run it more often.
Would someone please suggest a pointer to a better tool?

The idea is to log fault start/end, issue ip route replace default adequately,
and keep track of current status.  Google tells me nagios and similar packages,
but they seem to me to be overkill.  I'd write my own utility, possibly hacking
tcptraceroute source, but perhaps someone did it already...

Apologies for the OT and best wishes
Ale


