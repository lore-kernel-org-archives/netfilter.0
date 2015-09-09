From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: nflog : We are losing events. Increasing buffer size to 1736704
Date: Wed, 9 Sep 2015 18:54:00 +0530
Message-ID: <CAA5aLPi5sdeEQTX0ss8DEQGNYd2SuNgt45tGHfWeO9t0uqvZxw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=Z8t+sKWb4PXlLY9NbSiy12aTo/+d7SovC59foDxuZDo=;
        b=Dm/Kgt6e7FS0PKxP9mvz+2asVr8w0vYnUkWDihcsruEGF+4H0Q3kDnBDpmaurJA9Oi
         ahwANZJ/6b5g92w/7hsbbt7/oZT0uLeWYJXqvR33BMvEHOBEIgmCEASg3G22eisnq3E3
         u5KFwKzCPmpLOfiCwmwTwzZeBgVUkJOMd14X5zNLLjUdo7ArzaA8QyhOcqkz9eX77uqd
         vPX6yPkCQiRRXd3R8bxlK95p6pIaNDWdVeIscep/3qqTYlQKJHF4zNm1ZcYEDswLSUWJ
         kfutgrievEsZHsgcNbJasCd/wKGWYbO/wlgvOXGHUGR0x/HHXjrCJ85b/1G8lx9o3iok
         L99A==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi!

I am using nflog for logging iptables traffic. When traffic rate is
increased, I see message like
We are losing events. Increasing buffer size to 12000

We are losing events. Increasing buffer size to 16000
...

We are losing events. Increasing buffer size to 1736704

It doesnt get increased more than 1736704.
Even if I set 1736704 as the default buffer size, then also I get the
same message
We are losing events. Increasing buffer size to 1736704

Why is that so? What makes the buffer size having ceiling at 1736704
(= 212KBytes)
