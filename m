From: Tom Eastep <teastep@shorewall.net>
Subject: Re: Yet another FTP connection problem
Date: Thu, 6 Jun 2002 09:56:50 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.44.0206060953560.15592-100000@wookie.shorewall.net>
References: <200206061650.g56GoQA32044@vulcan.rissington.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206061650.g56GoQA32044@vulcan.rissington.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: "netfilter@lists.samba.org" <netfilter@lists.samba.org>

On Thu, 6 Jun 2002, Antony Stone wrote:

> On Thursday 06 June 2002 5:30 pm, Erik Pagel wrote:
> 
> > > Please can you tell us whether you are trying to ftp from this machine
> > > with  the netfilter rules on, or is the netfilter machine acting as a
> > > router  between the ftp client and server ?
> >
> > Both, I want so send files from this machine and this machine also act as
> > router for my internal network.
> > That the reason why I apply the rules to all three chains.
> 
> Okay.   Let's deal with those two requirements one at a time.
> 
> First, to use this machine as an ftp client to a machine on the Internet:
> 
> # standard policy on all chains
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
> 
> # allow ftp control connections outbound
> iptables -A OUTPUT -p tcp --dport 21 -j ACCEPT
> # allow replies back from ftp servers
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> # if you want to use names your firewall must be able to do DNS lookups
> iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
> iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
>

Some FTP sites use auth which can cause connection timeouts with that 
ruleset. For safety, I recommend adding

iptables -A INPUT -p tcp --dport 113 -j REJECT

-Tom
-- 
Tom Eastep    \ Shorewall - iptables made easy
AIM: tmeastep  \ http://www.shorewall.net
ICQ: #60745924  \ teastep@shorewall.net


