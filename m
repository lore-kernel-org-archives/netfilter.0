From: =?iso-8859-1?b?Sm9z6Q==?= Pablo =?iso-8859-1?b?UOlyZXo=?= 
	<josepablo@correo.co.cr>
Subject: Re: iptable rate limit challenge.. help please..!
Date: Thu, 07 Jun 2012 19:28:47 -0600
Message-ID: <20120607192847.cvyx1bimyo4g8g8o@correo.co.cr>
References: <20120607154038.bz3m3vzcqowsos4g@correo.co.cr>
	<alpine.LNX.2.01.1206080025540.5045@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1206080025540.5045@frira.zrqbmnf.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter@vger.kernel.org

Jan thank you so much..

I have been exploring severla options. Yes iam aware the risk of  
blocking a country but one only serves a select group of countries as  
the end user so...

Finally can you please help me understand why this rule alone does not  
drop packets from an IP that is sending more then 3 requests per  
minute to port 80?


iptables -A INPUT -p tcp --dport 80 -m state --state NEW -m limit  
--limit 3/min --limit-burst 3 -j DROP

Regards,
JP

