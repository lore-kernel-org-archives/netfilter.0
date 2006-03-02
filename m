From: kelly <kelly@cliffhanger.com>
Subject: Re: IPTABLES AND MONITOR
Date: Thu, 02 Mar 2006 09:54:26 -0600
Message-ID: <29315.170113887$1141317903@news.gmane.org>
References: <20060302161939.40940.qmail@web54711.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <20060302161939.40940.qmail@web54711.mail.yahoo.com>
Content-disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Davis Sylvester <dsylvesteriii@yahoo.com>
Cc: netfilter@lists.netfilter.org

Are you using a static NAT or Masquerade (PAT)?

In order for the hosts on the outside (the
Internet), to be able to initiate a connection to
the inside server, the inside server needs to be
STATICALY NAT'd.

If you're Masquerading the inside host, the NAT is
only in affect for a finite period of time.  In
addition, only the reply packets to the inside
host are permitted to pass through the firewall
and connect to the inside host.  The reply packets
must match the ports that were used during the
initial connection from the inside host.  Unless
it's ftp or some other protocol that works similar
to ftp.

-- 
kelly
http://home1.gte.net/res0psau/index.html#Hang-Gliding-Stuff

	   --    -- 
	     \  /
	      \/
	      /\
	     /  \
	   --    --



Quoting Davis Sylvester <dsylvesteriii@yahoo.com>:
        We're running iptables/Netfilter 1.3.5.  We have our
        mail server nat'ed.  Every so often our firewall stops
        preforming the nat translation from public IP address
        --> private IP Address.
        
        What is the best way to troubleshoot this problem? If
        you have reference to a simple quide or how to shoot
        it my way.
        
        
        Thanks in advance!
        
        __________________________________________________
        Do You Yahoo!?
        Tired of spam?  Yahoo! Mail has the best spam protection around 
        http://mail.yahoo.com 
        

