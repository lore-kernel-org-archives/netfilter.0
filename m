From: Mike Wright <mike.wright@mailinator.com>
Subject: a dos?
Date: Mon, 26 Aug 2013 17:17:11 -0700
Message-ID: <521BF007.4040907@mailinator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,

Don't know if this is the appropriate place to ask so if not please just 
ignore.

There is some unexplained, non-stop traffic that won't go away.

27.50.2.191:80 keeps calling me at 63.192.15.229:4460.

tcpdump shows 2 types of Flags: [S.] and [.], each one's packet numbers 
never change.  Almost all of the packets are type 1.

1)
16:27:05.947510 IP 27.50.2.191.80 > 63.192.15.229.4460: Flags [S.], seq 
777598812, ack 3826171711, win 65535, length 0

2)
16:27:06.100035 IP 27.50.2.191.80 > 63.192.15.229.4460: Flags [.], ack 
1246380345, win 0, length 0

There is nothing listening at 63.192.15.229.

Would any network gurus be willing to explain to me what may be going on 
or provide me insight?

Something puzzling was that the source IP may be related to the DEBOGON 
Project?

I know I can't stop incomers.  Do I just put up with this until it a) 
gets fixed; b) goes away?


Thanks
