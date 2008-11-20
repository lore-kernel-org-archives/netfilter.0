From: Mike <mikef1007@gmail.com>
Subject: Ports
Date: Wed, 19 Nov 2008 23:34:20 -0800
Message-ID: <d006ee070811192334o159d28b2mc48713998e423f13@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=XZXYZ+mZnw2sow/ECgVL5sKr+3Rx0FeHg4sNDU2rJlo=;
        b=tWv7bGt5cTbYd+hZ1hALfzOZiHwZ3zFLrD60+5ZfjoqMpdsH1iISpsV23NpCtga0mE
         Cyj93q3pP5m/r0h0CQVi7fjOPDihOd+IdfoQUyY6KpGLfXlnVQyP45dR+fm0Bhwsy5pg
         R6TqvZI2d+TBaMQHN5c5Rr7qx62HEdKfcR8uo=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I am trying to port forward ssh portX to portY on same box

I am listening on both ports using tcpdump.

On the same machine, I telnet "localhost portX" or "portY"  results:
NOTHING seen by tcpdump screen .
I do the same in respect to portY.  I also telnet "IP_number portX or
portY  results: NOTHING seen by tcpdump screen.

BTW, on the ssh-server side, I have portX and portY accepting connections.

This is what I have come up with after some google-search.

iptables -t nat -A PREROUTING -p tcp --dport portX -j DNAT --to :portY

No luck,
