From: Jason Opperisano <opie@817west.com>
Subject: Re: managing LOG files
Date: Fri, 22 Oct 2004 14:15:38 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041022181537.GA15333@bender.817west.com>
References: <20041022164033.12322.qmail@web21523.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041022164033.12322.qmail@web21523.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On Fri, Oct 22, 2004 at 09:40:33AM -0700, kate wrote:
> I have a firewall script that only allows
> pre-determined Ip addresses to attempt logon.
> Allowable access gets logged in /var/log/secure while
> TCP rules dump all other traffic, and get LOGGED in
> /var/log/messages. - This is a Home LAN, and that's a
> lotta data !
> 
> Is there a way of redirecting all this to a separate
> file? Is there a better way to deal with all this?
> 
> my rules include-
> 
> # LOG rules go to /var/log/messages
> iptables -A INPUT -m limit --limit 1/sec --limit-burst
> 3 -j \
> 	LOG --log-level 4 --log-prefix "FW DROP INPUT: "
> 
> thanks in advance
> kate

the most complete way to do this is to use syslog-ng as your system
logger and use its filter capabilities to send all the netfilter
messages to a dedicated file; i use something along the lines of:

source src {
        internal();
};
filter f_iptables {
	facility(kern) and match("IN=") and match("OUT=");
};
destination firewall { file("/var/log/firewall"); };
log { source(src); filter(f_iptables); destination(firewall); };

and yes--this is all completely stolen from SuSE's config files...

-j

-- 
Jason Opperisano <opie@817west.com>

