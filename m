From: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>
Subject: firewall and squid running on the same box
Date: Mon, 2 Aug 2010 10:00:38 +0000
Message-ID: <AANLkTimOQQqE1jrNLGKZW3T-dCmAAJzYu8cUyRTR4bMY@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=18f8wvP4szNJkZVH1VjP4fVOML3AbZGrNqsU2ZlMD34=;
        b=nz9ZXE68EAdjZrLA6pvQujBEPPBYq06SVWE1tHYQfmEmrLV143cfX0kAY9XZkzhqJc
         jE9FSCyjKR60PqkB0BJMZwqjrJ9QT/qNwf1ES97kNhY3mvEniZOrILj1n3zXW6KTXAd7
         lDmjN34g+Nc3Yw4v6OK2V10TF7xXbr/Bt7A84=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,
On my firewall box i also run squid in transparent mode.
when users access http, they are redirect to the proxy. but the source
ip address is change to the box ip address.
This is normal because the request is made by the proxy.
The problem is that any iptables rules matching the src ip address of
the user will never match. And that corrupt my firewall.
Is there a mean to tell squid not  to change the source ip address ?
I need your help.
regards.
