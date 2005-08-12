From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: ftp issue
Date: Fri, 12 Aug 2005 12:46:46 -0500
Message-ID: <200508121246.46606.rob0@gmx.co.uk>
References: <6a127306a118cb.6a118cb6a12730@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6a127306a118cb.6a118cb6a12730@vsnl.net>
Content-Disposition: inline
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

On Friday 2005-August-12 05:30, varun_saa@vsnl.net wrote:
>       My server FC4
> eth0 is wan with static IP.
> eth1 lan
>
> My iptables rules are as follows :
[snip]
> *nat
> -A POSTROUTING -s 192.168.0.0/24 -o eth0 -j SNAT --to 6x.xxx.xxx.xx
[snip]
> *mangle
>
> :PREROUTING ACCEPT [93:9058]
> :INPUT ACCEPT [85:8650]
> :FORWARD ACCEPT [8:408]
> :OUTPUT ACCEPT [88:8886]
> :POSTROUTING ACCEPT [95:9218]

With policies at the default and no rules, why are you loading the 
mangle table?

> *filter
>
> :INPUT ACCEPT [85:8650]

And no rules. Any services are open to the outside (if listening on 
eth0, of course.) Fine if you know what you're doing. But the kind of 
questions you're asking lead me to think you might not.

> :FORWARD ACCEPT [8:408]
> :OUTPUT ACCEPT [87:8810]
>
> -P FORWARD DROP

Hmmmm. I have never seen this syntax. Above it says the policy is 
ACCEPT, whereas I presume this is resetting it to DROP. Surely this 
isn't output from iptables-save(8)? Does iptables-restore(8) use "-P" 
lines to set policies? (I might test it later, myself.)

> -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -i eth1 -o eth0 -p tcp --dport 25 -j ACCEPT

So if there are any Windows machines in the LAN they can get out with 
their zombie spew.

> -A FORWARD -i eth1 -o eth0 -p tcp --dport 110 -j ACCEPT
> -A FORWARD -p udp --dport 53 -j ACCEPT

And *most* DNS would work for LAN clients. Of course as above I'm not 
sure that the DROP policy is working, so maybe they can do anything.

> -A OUTPUT -p udp --dport 53 --sport 1024: -j ACCEPT

This rule does nothing substantive, except as a packet counter.

> I am having problems with ftp uploads/downloads for :
>
>   ftp.sriaurobindoashram.com
>
> Using gftp from the server :

There are no limits in filter INPUT nor OUTPUT. There's no iptables 
issue here. Am I correct in thinking that "using gftp from the server" 
means that you are running the FTP client on the machine with the 
iptables rules listed above?

> 1. gftp -> ftp->options->ftp->passive all transfer - checked
>
>    Gets connected but gets stuck at recieves files names
>
> What could the problem ?

Something else is blocking you? The remote FTP server doesn't support 
passive FTP?
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

