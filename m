From: =?iso-8859-1?b?Sm9z6Q==?= Pablo =?iso-8859-1?b?UOlyZXo=?= 
	<josepablo@correo.co.cr>
Subject: iptable rate limit challenge.. help please..!
Date: Thu, 07 Jun 2012 15:40:38 -0600
Message-ID: <20120607154038.bz3m3vzcqowsos4g@correo.co.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: netfilter@vger.kernel.org

I have CentOS and iptables with GeoIP module enabled,

So far I have this rule working which works perfect:

iptables -I INPUT -m geoip --src-cc GB -j DROP;

But i need to make it more complex:

Before dropping traffic I need to:

allow up to a connection limit of 50 for the entire country.
allow up to 30 requests/second to the entire country.
drop the particular IPs with -m recent and a timeout of 3800 for those  
IPs from that country that violated that limit.
And finally log whatever has been dropped with excessive logging protection.


A plus.. if I can get to DROP the entire class C (/24) of the  
offending IP that violated the limits instead of just the /32


My idea is to get a working example so that I can apply it to other  
countriesor groups of contries  based on my traffic.


Guys an example of this is much appreciated!!

Regards,
Joseph

