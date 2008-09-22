From: Aleksej <aleksej05@googlemail.com>
Subject: monitoring with iptables question
Date: Mon, 22 Sep 2008 20:25:20 +0200
Message-ID: <16d377d70809221125l5e3195cage4035a92352577d8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=DOY6cuLVARQo+PldvzqHYAAanKRX9XJIC2y3kyLELRE=;
        b=rS1MwSY05THMkorwg/3HQDAA5cMh/ZUstVO3Wed6ZpXjDZfIpwq4wWUEUT9t97Dclq
         gM6bAPXAzhqfcQ8iHwFj1J5Pw9gw5CBxB3oV1mE67ScjxUMKbGqNh9wwlw23geXNfDkw
         t0zUaHxj8Iblr1KpuhQTqyK2XSOUrn68yLoZ4=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I know that iptables can be used for some monitoring tasks. Is it
possible to solve the following task with iptables?

Let's say I have an application that generates 20 Mbps data for
transmission, but due to high network load only 10Mbps is actually
transmitted. So, the output transmission queue is always loaded with
packets waiting for transmission. Is it possible to see somehow with
iptables that the output transmission queue is always busy? Or maybe
it is possible to count how many packets were generated for
transmission and how many packets have been actually transmitted?

I need this for monitoring the queue load. The main task is to monitor
what portion of time the output transmission queue is empty/busy.

Thanks for any hints!!

Aleksej.
