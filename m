From: Raviv <raviv.haim@gmail.com>
Subject: Performance issues when enabling netfilter configuration
Date: Thu, 27 Jan 2011 14:28:07 +0200
Message-ID: <4D4164D7.8050208@trego.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:content-type:content-transfer-encoding;
        bh=agEYZ0zhco1zkIq/YaYQ1boaYlnKm/GOJyzxS/Znzvs=;
        b=h2dNslj5ceIvsghlbspUEu2rMZxj4hWKzHtGu5b9pSV0AGTa+JwteuQWgMgWG8wDi3
         omIg8VL3gibJ4vW+Klf2AvDpNJyOQAfTAo0E5nsoHShvL2/8HACHAOLfaDaYFcx+0MR6
         BciBUkSDL9/odsTFBDeZXpuSCCZ+vknCKkqu0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I'm developing a bridge application (Ethernet <--> wireless) for both AP 
and Station.
I would like to keep a single kernel image for both AP and station. 
However the netfilter capabilities (conntrack) are only required at the 
Station.
I have configured the required netfilter capabilities to be loaded as 
modules. still there are some basic configurations i can't set as 
modules but only as built-ins.
So even-though i don't really need the netfilter in the AP these basic 
configuration exists and causes performance issue for network traffic 
(15% desegregation).
After a brief debug session i found out that when running the system 
without netfilter the packet (travailing : Eth-->Bridge-->Wireless) is 
passed with the same skb (all the way), while when netfilter is on the 
packet has a different skb while in Eth driver then the skb in the 
wireless driver. I suspect the skb switch/copy has happened in the 
bridge code.

1. Is there a way to maintain a single kernel image without hurting the 
performance so bad?
2. Why is the packet copied from one skb to another?

Regards,
Raviv
