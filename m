From: =?iso-8859-1?b?Sm9z6Q==?= Pablo =?iso-8859-1?b?UOlyZXo=?= 
	<josepablo@correo.co.cr>
Subject: Re: iptable rate limit challenge.. help please..!
Date: Fri, 08 Jun 2012 00:47:39 -0600
Message-ID: <20120608004739.p2ee3b6x4wwcskg0@correo.co.cr>
References: <20120607154038.bz3m3vzcqowsos4g@correo.co.cr>
	<alpine.LNX.2.01.1206080025540.5045@frira.zrqbmnf.qr>
	<20120607192847.cvyx1bimyo4g8g8o@correo.co.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120607192847.cvyx1bimyo4g8g8o@correo.co.cr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes	format=flowed"
To: netfilter@vger.kernel.org
Cc: Jan Engelhardt <jengelh@inai.de>

Jan,

Thanks to your examples I was able to get this far to what I want. My  
idea with this is try to mitigate the DoS attack first by blocking  
individual IPs that are misbehaving.. (STEP 2-6)

Also at the same time Iam putting the country in a "container" so that  
it doesnt consume more then the resources in STEP 7 AND 8 so I can  
continue to serve pages with the webserver

I have other defense mechanisms for DoS.. like fail2ban etc.. this is  
just one layer of defense.

Iam still a newbie so if you can help me complete the blanks it would  
be much appreciated.


####################################################################


#STEP 1 We create our chain that will hold the group
iptables -N limit_rated_group1;

#STEP 2 We create the ipset table
#Blah blah blah blah

#STEP 3 We REJECT ips in the ipset table
#Blah blah blah blah

#STEP 4 We define the countries in the chain
iptables -A INPUT -m geoip --src-cc AR -j limit_rated_group1

#STEP 5 We match _individual_ IPs that have exceeded more then 8  
requests/second and add them to the ipset list
iptables -A INPUT  -m limit --limit 10/second  -j <ADD TO IPSET LIST>;

#STEP 6 wE Match IPs _individual_ IPs that have exceeded conn_limit of  
50 and add them to the ipset list
iptables -A limit_rated_group1 -m connlimit --connlimit-above 50  
--connlimit-mask 32 -j  <ADD TO IPSET LIST>;

#STEP 7 Limit for all the country to 20 requests per second, the rest REJECT
iptables -A limit_rated_group1 -m limit --limit  10/min --limit-burst  
20 -j LOG --log-prefix "CR REQ/SEC LIMIT: "
iptables -A limit_rated_group1 -m limit --limit  10/min --limit-burst  
20 -j REJECT

#STEP 8 Limit for all the country to 100 concurrent connections, the  
rest REJECT
iptables -A limit_rated_group1 -m connlimit --connlimit-above 100  
--connlimit-mask 0 -j  REJECT;

########################### ALLOW HTTP
iptables -A INPUT -p tcp --dport 80 -j ACCEPT


Regards,
JP

