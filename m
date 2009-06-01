From: Victor Safronov <vitek@vitek.tomsk.ru>
Subject: ipset nethash with cidr 32
Date: Mon, 01 Jun 2009 12:11:26 +0700
Message-ID: <4A2362FE.7040905@vitek.tomsk.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi.
What type of set should I use in ipset if i want to store in set both ip 
addresses and networks (with different prefixes)?
nethash could be useful for me, but there are no possibility to add /32 
network (single ip).
