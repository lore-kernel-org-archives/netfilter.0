From: Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming.com>
Subject: How to Unblock IP Address of Email Client in Linux iptables Firewall
 in Linux Mail Server
Date: Fri, 27 Nov 2020 16:25:31 +0800
Message-ID: <506d31d3d8f03a2ab00ad7739942dc2e@teo-en-ming.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: ceo@teo-en-ming-corp.com

Subject: How to Unblock IP Address of Email Client in Linux iptables 
Firewall in Linux Mail Server

Good day from Singapore,

I am an IT consultant in Singapore. Today, Black Friday 27 November 
2020, my client Donald Trump (fictitious name used) informed me that he 
cannot send and receive emails using his home Wi-Fi connection. But he 
could send and receive emails using his mobile phone 4G connection.

Apparently, the public IP address of his home internet connection was 
blocked. The IP address is 666.666.666.666 (fictitious IP address used).

I checked the Fortigate 100D firewall but it was not blocked there.

Then I proceed to check the Linux iptables firewall on my client's Linux 
mail server. I login/putty/ssh into mail.teo-en-ming-corp.com.sg, which 
is my client's Linux mail server.

I executed the following command:

# iptables -S | grep 666.666.666.666

The output is:

-A DENYIN -s 666.666.666.666/32 ! -i lo -j DROP
-A DENYOUT -d 666.666.666.666/32 ! -o lo -j LOGDROPOUT

I proceeded to delete the above 2 Linux iptables firewall rules which 
blocked the IP address 666.666.666.666, using the following commands:

# iptables -D DENYIN -s 666.666.666.666/32 ! -i lo -j DROP
# iptables -D DENYOUT -d 666.666.666.666/32 ! -o lo -j LOGDROPOUT

Then I run the following command again to make sure the IP address has 
been unblocked.

# iptables -S | grep 666.666.666.666

There should be no output, confirming that the IP address has been 
unblocked.

Now my client Donald Trump is able to send and receive emails using his 
home Wi-fi connection successfully.

The author, Mr. Turritopsis Dohrnii Teo En Ming, 42 years as of 27 Nov 
2020 Friday, is a TARGETED INDIVIDUAL (TI) living in Singapore.

Reference Guide: How To List and Delete Iptables Firewall Rules
Link: 
https://www.digitalocean.com/community/tutorials/how-to-list-and-delete-iptables-firewall-rules






-- 
-----BEGIN EMAIL SIGNATURE-----

The Gospel for all Targeted Individuals (TIs):

[The New York Times] Microwave Weapons Are Prime Suspect in Ills of
U.S. Embassy Workers

Link: 
https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-microwave.html

********************************************************************************************

Singaporean Targeted Individual Mr. Turritopsis Dohrnii Teo En Ming's 
Academic
Qualifications as at 14 Feb 2019 and refugee seeking attempts at the 
United Nations Refugee Agency Bangkok (21 Mar 2017), in Taiwan (5 Aug 
2019) and Australia (25 Dec 2019 to 9 Jan 2020):

[1] https://tdtemcerts.wordpress.com/

[2] https://tdtemcerts.blogspot.sg/

[3] https://www.scribd.com/user/270125049/Teo-En-Ming

-----END EMAIL SIGNATURE-----
