From: Rob Hutton <justlikeef@gmail.com>
Subject: dst NETMAP
Date: Mon, 22 May 2023 14:11:36 -0400
Message-ID: <CAGWgwrPXvZ-eVbsYp-zi0thV4=vz=nfj0jQ-_oEZo3e8TdOzeA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684779109; x=1687371109;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vto7tmTrRWhHdPYPQylgMub4A4iV2Po+Mh/tEwvvqRU=;
        b=aGYQOZeyBWIDI/BzDZY8DVaBewTUFQeGuMJvExJF39SVod6qPLawJkp/lF/iuLNvCA
         GaeeHknGqSZNnY90JGw6YrL5jfrUHCV9dSCwef2m+UaEu4nayzZqRgE1DBmjCLtj+FjT
         /x1q/OF+k3UDnOW7fa7wNPo86rpmbHyAd8NcjciGhexUQdagF5fMmuMREf4fM8scTTYl
         e2uR4OvuRK3yW2l6Bjj52mUmC0ocuNo08a0hsxFikW09TnMruQBtp7JybrHLGPonf/bK
         dbvfSvJAkJ0E6tIXRAD1Jmibf+KYKBUNpM6evEGMJfrta3LPFeNGPWBZD5u2As2vbT14
         Ljgg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am trying to set up a NAT gateway between two businesses where one
initiates the connection outbound to the other, so therefore have dst
nat entries in the following form:

ip daddr 10.192.3.0/24 dnat ip to ip daddr map { 10.192.3.0/24 : 10.12.3.0/24 }

and masquerade is enabled on the external interface.

The netmap is translating the network portion correctly, but the host
portion is not being preserved and is simply being chosen as if from a
NAT pool.  So pinging 10.192.3.254 should be translated to 10.12.3.254
and instead it is translated to 10.12.3.64 (for example).  How do I
preserve the host portion during the NETMAP translation?

Thanks,
Rob
