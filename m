From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Problem setting up nftables dnat : dport set to 0 instead of
 requested value (22)
Date: Wed, 10 Dec 2014 19:22:44 +0100
Message-ID: <20141210182244.GA5622@salvia>
References: <54885B08.1010700@c-s.fr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54885B08.1010700@c-s.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: leroy christophe <christophe.leroy@c-s.fr>
Cc: netfilter@vger.kernel.org, GUITTON Alex <alex.guitton@c-s.fr>, arturo.borrero.glez@gmail.com

On Wed, Dec 10, 2014 at 03:39:04PM +0100, leroy christophe wrote:
> Hi,
> 
> I'm trying to redirect incoming tcp connections for port 222 to
> local port 22 (because I will dnat incoming connections for port 22
> to another destination).

Then you have to use "redirect" instead of "dnat". "redirect" will be
available since the upcoming 3.19-rc.

Cc'ing Arturo, he has worked on the redirect support.

@Arturo: Could you add documentation for your 'redirect' support to ?

http://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Address_Translation_%28NAT%29

Thanks.
