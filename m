From: Edmond Cukalla <ecukalla@gmail.com>
Subject: Block traffic for specific http header and connection speed > 10 conn/sec
Date: Tue, 16 Jul 2013 01:22:44 +0200
Message-ID: <CALkB_0DzCO+WXVYXTrccGoYzTPSWdXPHpUE4p-bh2FCBO3Bi5Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=K/9D2wQDEOg6So4X1P6zIhbZvuRK7OR/EWePnKnsXH0=;
        b=NO2RHtVL01ftTrgLoFHrdE+V4CsxY1CpRoDjKm8NZhYZ17ylmXqT3AAx6mor5j3lO0
         m5gsznIympISvDZ6N+3m5Vy3M/EZ8pnXQHkV9YhRe9ZYE1TDI0G4hkXyjicJT7eTuwz7
         xkJpKg4l8XYJ1po2KzTTVZUeV7pLgp3W4Ph9s2Thnk/MfS7DJeXhIpvgX2jzsqBOnq89
         6XKbo5jcvEMOcVajXBp9e9yEscbBiAReCkGgXV19F6ViWaoBX65wIH7y2o7HYUf8h8L+
         vfrUS9LHty94lbO2E8qVCvu1YxRKae4YTL+djG9C2la8ChXePSrgg5qm1Qq06b81IqOr
         B3/Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

I need to block/reject traffic with the following criteria:
for e specific http header for example "User-Agent: Wget" (I can
manage this with --string pattern) AND when there are more than 10
connections/seconds.

So iptables would be blocking connections from user-agent: wget where
traffic speed is >10 connection/second.

My problem is that my webserver is behind a NAT, so I will see only
one IP source.
Hashmode options uses IP so I can't use this option.

Can you please tell if this can be performed with iptables?

Thanks,
Edmond
