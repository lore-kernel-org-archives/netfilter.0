From: "Ing. Juan Cardoza" <ing.jcardoza@gmail.com>
Subject: RE: Quick IP Blocking question
Date: Fri, 14 Mar 2014 09:17:25 -0600
Message-ID: <003d01cf3f98$82ca0410$885e0c30$@gmail.com>
References: <20140314135851.GA32244@fever.havannah.local> <1394808599.4771.39.camel@bigboy.gregfolkert.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-type:content-transfer-encoding:thread-index
         :content-language;
        bh=DAOMwF28HfDCet3RpD1TOB0HTE3LlhY8roZWFXbvNFg=;
        b=IeGk78UhwQrl/UF2cMrjCohmSkIIph/o3L2jX0bpRwd3U6SwFWVOfIgxjb2o1xDdDH
         liaVKIjaNuhc91rnBvmK8QryCL0Wt205YZQ8YStOJt5lcm8+F8n3GCYEaG1aV55Oj7/B
         iYNRL7j0N8NwAx9elal6/mmsTLwITOZdKOwZBroOkUVPQwfAsdiUFNnKuFT1MQKNE3LR
         cPAHjGJf5NV8I3HVrETYSgmVIajM1OonAAoLQBAAwI/PIBxac5dBNswPmiITPOhSEFE/
         BNjvKzq/Q5tMc/NJ1x/Iz0ubnZ5nFKaoOBTXGOlCNfrje/QX/OlHMDloXZKUudbE5/Q9
         I6RA==
In-Reply-To: <1394808599.4771.39.camel@bigboy.gregfolkert.net>
Content-Language: es-mx
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Greg Folkert' <greg@donor.com>, 'Danny' <dannydebont@gmail.com>
Cc: netfilter@vger.kernel.org

You can use squid integrated with squidgard, that is the best option to manage youtube.

I redirect the requests to a warning webpage with they try to use it during HOO.

Regards

-----Original Message-----
From: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.kernel.org] On Behalf Of Greg Folkert
Sent: viernes 14 de marzo de 2014 08:50 a.m.
To: Danny
Cc: netfilter@vger.kernel.org
Subject: Re: Quick IP Blocking question

On Fri, 2014-03-14 at 15:58 +0200, Danny wrote:
> Hi,
> 
> Can you please check if the following rule is correct. The purpose of 
> this rule is to allow only access to youtube from 15:00 to 18:00
> 
> iptables -A OUTPUT -p tcp --dport 80 -d 208.65.153.238 -m time 
> --timestart 15:00 --timeend 18:00 -j ACCEPT iptables -A OUTPUT -p tcp 
> --dport 80 -d 208.65.153.238 -j REJECT
> 
> How can I modify the above rule to block a specific IP or MAC address 
> from my internal network to access youtube at specific times?
> 
> Thank you guys
> 
> Have a nice day
> 
> Danny
Danny,

I hate to break this to you... but Youtube is served by hundreds of IP Addresses. Depnding on time of day, the round robin DNS, the cname rotation and various other things like locations and source netowrk (your ISP). My current list shows a completely different set of IP Addresses that even is close your IP Address here at home (173.194.46.32-46), at Work I get a different set (74.125.225.192-206)

If you are going to do that properly, you'll need to use either transparent proxy or force the browsers to use something like squid and then use name based ACLs with the time restrictions.

Good Luck.
--
greg folkert - systems administration and support
web:    donor.com
email:  greg@donor.com
phone:  877-751-3300 x416
direct: 616-328-6449 (direct dial and fax) "There's something to be said in favor of working in isolation in the real world."
    -- A. R. Ammons

--
To unsubscribe from this list: send the line "unsubscribe netfilter" in the body of a message to majordomo@vger.kernel.org More majordomo info at  http://vger.kernel.org/majordomo-info.html

