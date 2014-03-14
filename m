From: Greg Folkert <greg@donor.com>
Subject: Re: Quick IP Blocking question
Date: Fri, 14 Mar 2014 10:49:59 -0400
Message-ID: <1394808599.4771.39.camel@bigboy.gregfolkert.net>
References: <20140314135851.GA32244@fever.havannah.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=donor.com; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :organization:content-type:mime-version:content-transfer-encoding;
        bh=CeXhld7NlN4UGEXPMd76WiQImhKsEflmfX2szNNMor0=;
        b=fmH4QllQb7cM2bSFYHr2Ug77hmrJ083K+wrD6ICQIBKZQv3uVj8eKkZi42cOap+nic
         Q5KCbv5OjYcSbFHEE5ymuchxQUI+NTHW57Ibp1IVe4ab2ND9D351qNI/WaHvELFsGyVL
         q3j6qY4WKejD3z3FTqSsopgP2GPZCf7OTf9xI=
In-Reply-To: <20140314135851.GA32244@fever.havannah.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Danny <dannydebont@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, 2014-03-14 at 15:58 +0200, Danny wrote:
> Hi,
> 
> Can you please check if the following rule is correct. The purpose of this rule
> is to allow only access to youtube from 15:00 to 18:00
> 
> iptables -A OUTPUT -p tcp --dport 80 -d 208.65.153.238 -m time --timestart 15:00 --timeend 18:00 -j ACCEPT 
> iptables -A OUTPUT -p tcp --dport 80 -d 208.65.153.238 -j REJECT
> 
> How can I modify the above rule to block a specific IP or MAC address from my
> internal network to access youtube at specific times?
> 
> Thank you guys
> 
> Have a nice day
> 
> Danny
Danny,

I hate to break this to you... but Youtube is served by hundreds of IP
Addresses. Depnding on time of day, the round robin DNS, the cname
rotation and various other things like locations and source netowrk
(your ISP). My current list shows a completely different set of IP
Addresses that even is close your IP Address here at home
(173.194.46.32-46), at Work I get a different set (74.125.225.192-206)

If you are going to do that properly, you'll need to use either
transparent proxy or force the browsers to use something like squid and
then use name based ACLs with the time restrictions.

Good Luck.
-- 
greg folkert - systems administration and support
web:    donor.com
email:  greg@donor.com
phone:  877-751-3300 x416
direct: 616-328-6449 (direct dial and fax)
"There's something to be said in favor of working in isolation in the
real world."
    -- A. R. Ammons

