From: Kiernan George <kbg98@vt.edu>
Subject: Creating a map with libnftnl
Date: Thu, 30 Jun 2022 13:19:13 +0000
Message-ID: <fbaccc73-c98c-4a21-bc12-0c89b041ae32@vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject:content-transfer-encoding;
        bh=qK0kRLNdq368dCXm35tLIbQf05Lsvjpx6r8lUZCQQjY=;
        b=wH6xIrJnMgSpyfZGLfVMDkYmN828geOVEUiEWv337V7FGEjOX6M5c5dUpawE2hnQs0
         yLolx9s0GNbi2/YCkuoyYdGbv/EqnI9DpglA+9iAQzJdzD9XNDZ8SfVsczMyOo7M80vI
         FcOqJp9UXOk4GYSr5EEr+y3EGtlHyD2QX4qgU6RD7wFdQ0BqQhvMFiBGUfHpOPZjyvyv
         QskLeBS6uUA3NCgEUqXkyjQKwVyKQDutmvTU3q2NPjslHocPgWaNNQy3s2SLArE+CxFy
         RTwaZuA4lrjzQ3Dv4UtX6aRh0nnztsWHGjmIp4v22HgdLLO2Hs6du+/qLb0e8SS5L/O8
         mN6A==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

Is there an example for creating a map using libnftnl in the form of:

map name {
                 type ipv4_addr . inet_service : ipv4_addr

}


I see the example for creating a map in the form of:

map name {
                 type inet_service : inet_service
                 flags constant
         }

I'm not sure how to extend this example to my use case. I thought I had 
it working, but when I try to add an element manually, it gives me this 
error:

invalid data type, expected concatenation of (IPv4 address)
add element ip testtable testmap {1.1.1.1 . 20 : _2.2.2.2_}


Any tips would be appreciated.


Thank you,

Kiernan

