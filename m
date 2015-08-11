From: Madhan <madhan.mepco@gmail.com>
Subject: REDIRECT and UDP in client
Date: Wed, 12 Aug 2015 00:03:47 +0530
Message-ID: <CA+BD1JHnZ7FtbX=NOH95NQtaonWxzLM7cg1eBF33RVVH1fFdzA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=/Gkgypan2SHREsspOShPtg1PU+YsQ+h3gRpT78Xc2VY=;
        b=xibhwo+cDwaRCxO/tk7tkidwDeAQlKmjMSM9mqys+uRaTBXpSXOKdB9RgVbBdWSg7U
         LEohLl1jbd170D/wsKUgFUmNnuTWohtEVU5hsVVvj5w3Zu+tjjBwe04x9F/DkMooMar5
         MfMcYjoq8JLGcBtHHXecOUSYysTsD8uflNmSx3PAq385T4X/bWrAFA993k6CYgG0FlSa
         qYRKa/HgPXJ5SPZ5/Lh3wFF6Gu4lR6n8zI+w9gVcP9hnj8VtpEzUjZdsRApmyvTFCDTD
         TnxyD/Ed/2eUPgZNXmnSOs2WLOoa6iSTSI2E/sMcmny0sKH09P3zCCepKWZivHty6bwK
         sY9g==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi All ,
I am trying to redirect the udp packet to particular port where I run
my proxy (SOCKS) . I am supposed to obtain the original destination
ipaddress of the client to add to the data field of socks message as
per the RFC .

However , when I use REDIRECT chain as it sets the dest addr to the LO
address i get the LO address 127.0.0.1 and the port where socks proxy
client runs .

I tried patching SO_ORIGINAL_DST to obtain for UDP protocol also . In
this case it would work if I use single FD for single dest . However
when I use single FD for multiple connection it might not work .


I cannot add as part of rsvmsg , as I have to send to the proxy server
in advance .

TPROXY works in prerouting , I am not sure how we use in the client
side to send the first packet with the dest address . (I am not sure
about the TPROXYing though)


Can you please suggest the method to overcome the problem . Thanks in advance.

Regards,
Madhan Raj K ,
Senior Software Engineer - Android R&D ,
Samsung Research Institute - Bangalore .
