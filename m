From: Travis Crook <houseofcrooks@juno.com>
Subject: Email troubles behind iptables firewall
Date: Thu, 12 Sep 2002 09:07:47 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020912.090747.-556191.0.houseofcrooks@juno.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi all,
    Sorry to post from an email address not on the 
list but my other address never gets to the list 
(travis @ visionsbeyond.com ).
    I have an iptables firewall setup to route web, ftp 
and email traffic to internal servers.  My internal 
servers have ip addresses in the 192.168.2. range.  
The problem I am having is that my email server is 
being used as a spam box (not by me but by someone 
else on the internet - not with my approval either).

My question is this:  Qmail is my mail server.  It is 
supposed to only allow relaying by certain clients.  
As far as I know it is set up this way.  I think the 
problem occurs because I allow 192.168.2. ip 
addresses to relay mail (i.e. everyone behind the 
firewall).  But every email coming in to the mail 
server gets a 192.168.2. ip address.  Is this 
correct?  Is there any way to pass their real ip 
address through the firewall to the mail server?

Any help would be greatly appreciated.  I can 
post the firewall script, etc. if needed.

Thanks

Travis Crook
Visions Beyond

________________________________________________________________
GET INTERNET ACCESS FROM JUNO!
Juno offers FREE or PREMIUM Internet access for less!
Join Juno today!  For your FREE software, visit:
http://dl.www.juno.com/get/web/.

