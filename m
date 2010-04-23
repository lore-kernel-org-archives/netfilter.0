From: Eric Bauman <baumane@livejournal.dk>
Subject: Problem with rdate and iptables
Date: Sat, 24 Apr 2010 05:54:35 +1000
Message-ID: <hqstu1$7hm$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi there,

I'm having an issue with getting rdate working over UDP.
I'm using the rule "--append INPUT --match state --state 
ESTABLISHED,RELATED --jump ACCEPT". It works fine over TCP, but times 
out when using UDP.

Any ideas?

Cheers,
Eric

