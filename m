From: Jason Opperisano <opie@817west.com>
Subject: Re: port 113 ?
Date: Thu, 13 Jan 2005 08:39:07 -0500
Message-ID: <1105623547.8185.16.camel@hubcap.ljm.dom>
References: <41E62A5A.9000106@eccotours.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41E62A5A.9000106@eccotours.biz>
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
To: netfilter@lists.netfilter.org

On Thu, 2005-01-13 at 02:59, Brent Clark wrote:
> Soo I would like to know, if it is advisable to stop identd. I have
> googled abit and from what I gather, its considered as dangerous and
> basically pointless to run. By removing / stopping this service, will it
> hamper hinder my users, other servers in any other way. I only run a
> mail and ftp server.

there are still mail servers out there configured to do an ident lookup
prior to sending mail to you.  i normally disable identd, but i always
add a rule like this to speed up services that still request it:

  iptables -N ident
  iptables -A ident -p tcp --syn --dport 113 \
    -j REJECT --reject-with tcp-reset

  iptables -A INPUT -j ident
  iptables -A FORWARD -j ident

-j

--
"Ahh the Luftwaffe--the Washington Generals of the History Channel."
	--The Simpsons


