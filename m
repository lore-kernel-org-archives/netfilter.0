From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: netmeeting ?
Date: Sun, 16 Jun 2002 19:07:12 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206161807.g5GI7DA29086@Networker.rockstone.co.uk>
References: <17729088316.20020616195415@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <17729088316.20020616195415@gmx.de>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: IP-Tables Maillingliste <netfilter@lists.samba.org>

On Sunday 16 June 2002 6:54 pm, Corin Langosch wrote:

> Hi all,
>
> im behind a iptables firewall and want to be able to accept incomming
> netmeeting calls. To make things simple I added the following rules:

[snip]

> unluckily, no incomming calls are detected and the other party gets an
> error. other programms like my local ftp server etc. work fine, this means
> the rules are correct.

It means the rules are correct for ftp, yes, but that's not necessarily true 
for every other protocol you might want to put through your firewall...

Netmeeting is one of those protocols which buries IP addresses & port numbers 
inside the messages, therefore it needs a helper on the firewall to NAT it 
properly.

You should look at the h323 patch in a *very* recent version of netfilter 
(1.2.6a or 1.2.7 from CVS), and also look back through some of the recent 
messages on this mailing list, because there have been a number of posts from 
people trying to get it working / failing to get it working / reporting 
success in getting it working.....

Sorry I can't offer you any direct advice, but I don't use netmeeting - I've 
just seen all the posts on the mailing list from other people who've done the 
same thing you want to.

 

Antony.

