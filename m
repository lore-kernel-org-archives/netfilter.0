From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: Logging
Date: 17 Jan 2003 09:56:44 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042777609.1003.2.camel@india>
References: <20030114182310.GA23089@cablespeed.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030114182310.GA23089@cablespeed.com>
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
To: Subba Rao <subba9@cablespeed.com>
Cc: Netfilter/Iptables Users <netfilter@lists.netfilter.org>

On Tue, 2003-01-14 at 23:53, Subba Rao wrote:
> Hi
> 
> I have the following rules to allow traffic on SMTP port.
> 
> --------------------
> iptables -A INPUT -i $EXTERNAL_IF -p tcp --destination-port 25 -j LOG \
>                 --log-level 4 --log-prefix "Incoming Mail Traffic "
> iptables -A INPUT -i $EXTERNAL_IF -p tcp --destination-port 25 -j ACCEPT
> --------------------
> 
> The default policy is on the INPUT chain is to drop the packets.  How do I capture
> what is being dropped?
> 
> My goal is to log the inbound traffic and my syslog has the following
> configuration:
> 
> --------------------
> *.=info;*.=notice;mail.none                     /usr/adm/messages
> *.=alert                                        /usr/adm/messages
> *.=crit                                         /usr/adm/debug
> mail.*                                          /var/log/mail-log
> kern.*                                          /var/log/messages
> user.*                                          /var/log/messages
> syslog.*                                        /var/log/messages
> auth.*                                          /var/log/messages
> authpriv.*                                      /var/log/messages
> --------------------
> 
> Is this configuration sufficient to capture the inbound connections?
> 
> -- 
> 
> Subba Rao
> subba9@cablespeed.com
> 

Hi Rao,

 Just add a rule after the default policy. This should give you all the
packets which are dropped.

iptables -A INPUT -j LOG
iptables -A OUTPUT -j LOG
iptables -A FORWARD -j LOG
-- 
Dharmendra.T
Linux Enthu


