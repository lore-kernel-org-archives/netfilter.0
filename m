From: "Jeremy Pullicino" <pullicino@gmail.com>
Subject: routing all HTTP requests to my own web server
Date: Fri, 17 Oct 2008 19:40:58 +0200
Message-ID: <a0a0d59c0810171040s3646c212g150d7691e6d92f4b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=z806obkrEyCgfaBaWrzJlSCwPIexTZPamVc4tB9DJ2s=;
        b=INhvxO+wWz73lyHGkgWgvR5N4W2ivKwfPhP8x3C+3FZQXcYNIdY1fym87Bp83fxpC6
         W4g2DSxeaSAcKlzL/3q847iWXj6eIiDA3hOqvaYnFTRvva/fDjwp9g2dUy8PlSVpR8os
         AsF36hfznoIOfVQF69i0WxhQy0rnl0XaT0P5Q=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I would like to route all outbound HTTP requests to my own HTTP server.

After consulting with the docs and online tutorials I came up with the
command below:

iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT 192.168.11.100

Is this the correct way to do it?

Any advice will be really appreciated.

Thanks,
Jeremy Pullicino
