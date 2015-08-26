From: Jeff <Jeff.Meyers@gmx.net>
Subject: Accept clients that were seen at least twice only
Date: Wed, 26 Aug 2015 14:21:38 +0200
Message-ID: <55DDAF52.3090507@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello everybody,

I am looking for a way to accept traffic from clients only if they were 
seen at least twice. This shall be part of a firewall concept which 
protects the target from random floods where source IPs are usually only 
seen once since they are random.
I cannot use the --state ESTABLISHED here because this requires a 
complete handshake (for TCP). I'm okay with the first packet not 
matching this rule as long as the 2nd one does. I'm looking forward to 
reading your ideas!


Best,
Jeff
