From: Jason Opperisano <opie@817west.com>
Subject: Re: FTP Connection State Tracking Issue
Date: Mon, 29 Nov 2004 09:39:07 -0500
Message-ID: <1101739147.10064.47.camel@hubcap.ljm.dom>
References: <1101748780.12476.3083.camel@ashutosh.teneoris.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1101748780.12476.3083.camel@ashutosh.teneoris.com>
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

On Mon, 2004-11-29 at 12:19, Ashutosh wrote:
> Hi Everyone,
> 
> My question is, that if I have already loaded the ftp connection
> tracking and nat modules, do i still need to write scripts like the
> following on my firewall, to enable FTP Access from inside to outside ( 
> 
> My Default Rules are -
> 
> Allow Outgoing connection tcp on port 21
> Deny all other outgoing connections
> 
> Scripts
> (For Active FTP)
> iptables -A INPUT     -p tcp --sport 20 -m state --state
> ESTABLISHED,RELATED-j ACCEPT
> iptables -A OUTPUT-p tcp --dport 20 -m state --state ESTABLISHED-j
> ACCEPT
> 
> (For Passive FTP)
> iptables -A INPUT     -p tcp --sport 1024: --dport 1024:  -m state
> --state ESTABLISHED-j ACCEPT
> iptables -A OUTPUT-p tcp --sport 1024: --dport 1024:  -m state --state
> ESTABLISHED,RELATED-j ACCEPT

no--but you need to write scripts like this:

  iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
  iptables -A FORWARD -p tcp --syn --dport 21 -j ACCEPT

-j

--
"I saw weird stuff in that place last night. Weird, strange, sick,
 twisted, eerie, godless, evil stuff. And I want in."
	--The Simpsons


