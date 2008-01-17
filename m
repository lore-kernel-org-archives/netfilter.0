From: Mike Leahy <mgleahy@alumni.uwaterloo.ca>
Subject: Filtering bad http requests
Date: Fri, 18 Jan 2008 11:44:46 +1300
Message-ID: <478FDA5E.6050908@alumni.uwaterloo.ca>
Reply-To: mgleahy@alumni.uwaterloo.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:reply-to:user-agent:mime-version:to:subject:x-enigmail-version:content-type:content-transfer-encoding:sender;
        bh=hkXeHSslWCU+D/93rvBl83xw/Y8HaAmdpRG0JGEY2F8=;
        b=kyH2uo03ViIUPs49jcUvsVbpaBhgdb3EiazmRsDGSFBf06pGGKpcJ8o+Jai2EP+P1MEWAot4BuqOpxRmPNr/uR80pzHkTAZcLf/2LI0qXX0LB88H9VTk2/Cf4XJlMmGSXhg4FBi3Zp+9bF4xefUYodWD3KA8KMZtcBLjYfv4cEA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello list,

I'm wondering if anyone knows of a simple way to filter out bad HTTP
requests being sent to my server.  You'll find an example of my apache
log below.  What I would like to do is set this up so that if somebody
makes too many 404/403 requests within a short period of time (say 5
hits within 5 minutes), then the IP gets temporarily banned.  I've
iptables setup to do this sort of thing with brute force ssh login
attempts.  Below is a simple example of how I have accomplished this (I
adopted this method from sample I found posted online somewhere).  I'm
wondering how difficult it might be to do the same (i.e., identify
connections that get 404/403 responses from httpd, and temporarily ban
their IP).

Thanks in advance for any suggestions,
Mike

===================================================

My iptables script:

#!/bin/sh
#  Modprobe the extra modules we need
/sbin/modprobe ipt_recent
/sbin/modprobe ip_conntrack

#  Remove any old rules
/sbin/iptables -F
/sbin/iptables -X
/sbin/iptables -Z

#-----------------------------------------------------------------------
#  Kill ssh hackers - watch for more than 3 connection attempts in under
#  10 minutes and reject for 10 minutes
/sbin/iptables -N SSH-EVIL
/sbin/iptables -A SSH-EVIL -m recent --name badSSH --set -j LOG
--log-level DEBUG --log-prefix "evil SSH user: "
/sbin/iptables -A SSH-EVIL -j REJECT

/sbin/iptables -N SSH
/sbin/iptables -A SSH -p tcp ! --syn -m state --state
ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables -A SSH -p tcp --syn -m recent --name badSSH --rcheck
--seconds 600 -j REJECT
/sbin/iptables -A SSH -p tcp --syn -m recent --name sshconn --rcheck
--seconds 600 --hitcount 3 -j SSH-EVIL
/sbin/iptables -A SSH -p tcp --syn -m recent --name sshconn --set
/sbin/iptables -A SSH -p tcp --syn -j ACCEPT

#  Allow unlimited traffic on the loopback interface
/sbin/iptables -A INPUT  -i lo -j ACCEPT
/sbin/iptables -A OUTPUT -o lo -j ACCEPT

#  Send ssh down our user-defined chain, allow ftp ...
/sbin/iptables -A INPUT -p tcp --dport 22 -j SSH
#-----------------------------------------------------------------------

#  Add other rules as needed...

/sbin/iptables-save > /etc/sysconfig/iptables



=================================================


HTTPD logs:

Requests with error response codes
    403 Forbidden
       /: 4 Time(s)
    404 Not Found
       //Ads/adxmlrpc.php: 1 Time(s)
       //ads/adxmlrpc.php: 1 Time(s)
       //adserver/adxmlrpc.php: 1 Time(s)
       //adxmlrpc.php: 1 Time(s)
       //awstats.pl: 1 Time(s)
       //awstats/awstats.pl: 1 Time(s)
       //b2/xmlsrv/xmlrpc.php: 1 Time(s)
       //b2evo/xmlsrv/xmlrpc.php: 1 Time(s)
       //blog/xmlrpc.php: 1 Time(s)
       //blog/xmlsrv/xmlrpc.php: 1 Time(s)
       //blogs/xmlrpc.php: 1 Time(s)
       //blogs/xmlsrv/xmlrpc.php: 1 Time(s)
       //blogtest/xmlsrv/xmlrpc.php: 1 Time(s)
       //cgi-bin/awstats.pl: 1 Time(s)
       //cgi-bin/awstats/awstats.pl: 2 Time(s)
       //cgi-bin/stats/awstats.pl: 1 Time(s)
       //cgi/awstats/awstats.pl: 1 Time(s)
       //chat/messagesL.php3: 1 Time(s)
       //community/xmlrpc.php: 1 Time(s)
       //drupal/xmlrpc.php: 1 Time(s)
       //graph_image.php: 1 Time(s)
       //phpAdsNew/adxmlrpc.php: 1 Time(s)
       //phpads/adxmlrpc.php: 1 Time(s)
       //phpadsnew/adxmlrpc.php: 1 Time(s)
       //phpgroupware/xmlrpc.php: 1 Time(s)
       //scgi-bin/awstats.pl: 1 Time(s)
       //scgi-bin/awstats/awstats.pl: 2 Time(s)
       //scgi-bin/stats/awstats.pl: 1 Time(s)
       //scgi/awstats/awstats.pl: 1 Time(s)
       //scripts/awstats.pl: 1 Time(s)
       //stats/awstats.pl: 1 Time(s)
       //wordpress/xmlrpc.php: 1 Time(s)
       //xmlrpc.php: 1 Time(s)
       //xmlrpc/xmlrpc.php: 1 Time(s)
       //xmlsrv/xmlrpc.php: 1 Time(s)
       /PhpMyChat//chat/messagesL.php3: 1 Time(s)
       /cacti//graph_image.php: 1 Time(s)
       /chat//chat/messagesL.php3: 1 Time(s)
       /chat1//chat/messagesL.php3: 1 Time(s)
       /chat2//chat/messagesL.php3: 1 Time(s)
       /chat3//chat/messagesL.php3: 1 Time(s)
       /chatroom//chat/messagesL.php3: 1 Time(s)
       /chats//chat/messagesL.php3: 1 Time(s)
       /community//chat/messagesL.php3: 1 Time(s)
       /forum//chat/messagesL.php3: 1 Time(s)
       /forums//chat/messagesL.php3: 1 Time(s)
       /php/phpmychat//chat/messagesL.php3: 1 Time(s)
       /phpMyChat-0.14.2//chat/messagesL.php3: 1 Time(s)
       /phpMyChat-0.14.3//chat/messagesL.php3: 1 Time(s)
       /phpMyChat-0.14.4//chat/messagesL.php3: 1 Time(s)
       /phpMyChat-0.14.5//chat/messagesL.php3: 1 Time(s)
       /phpMyChat//chat/messagesL.php3: 1 Time(s)
       /phpchat//chat/messagesL.php3: 1 Time(s)
       /stats//graph_image.php: 1 Time(s)

