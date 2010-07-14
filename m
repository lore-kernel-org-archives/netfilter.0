From: Shirley Ong <soap6gal@gmail.com>
Subject: Traffic accounting in iptables
Date: Wed, 14 Jul 2010 18:00:02 +0100
Message-ID: <AANLkTilT4RX2sRQc7vjtWdbP3UxSqqVFAwGc2mGZk0iC@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:from:date
         :message-id:subject:to:content-type;
        bh=4Z8NTPak7vgIRn9P9DxQ3/5ir8q7dyLry/FHVwNQbyc=;
        b=GUNezoofrb31QqnB2r6AM9geucGO0CKpwuzqJAjdRsjY1UiK8RT7pS2WMNbSBCr8/G
         M+zZtYU3FjBFcI7qXblMNu2VIt2J2uS1QX8v6BM+DHBZXAOBJ2TGbp5Jst30UAES0Dy5
         9pGlNE76E8c+PRFrCxDR+kHx0CvcP/sMSjOYo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm trying to understand traffic bytes reported in iptables. What I
did was, I downloaded a 5MB file from a server, then checked the bytes
via command "iptables -nvx -L ...". At the same time, I have captured
the traffic using tcpdump, which I then viewed in Wireshark. With
wireshark, I added up all the bytes (with and without header) at all
the different layers. The closest I can get wireshark to show the same
data bytes as iptables is at the IP Layer (data + header). What
puzzles me is that, wireshark shows 12 bytes (incoming traffic) more
than iptables, but the number of incoming packets are the same as
reported by iptables. Outgoing bytes and packets are exactly the same
as iptables. I have repeated this test many times, by downloading 5MB
and 100MB files and the results are the same - always 12 bytes of
incoming traffic in extra. Does anyone have an explanation for this?
This is done in a controlled environment, i.e., only the http packet
goes through iptables.

Thanks.

Shirley
