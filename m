From: "Steven Kath" <steven.kath@vyatta.com>
Subject: RE: does -p udp --dport 5060 not work with -j LOG?
Date: Thu, 1 May 2008 18:40:49 -0700 (PDT)
Message-ID: <05f401c8abf5$73fb5ed0$5000040a@skathlaptop>
References: <fvarov$iq2$1@ger.gmane.org>	 <cc86d0010804302023n2b2dbbeu9b7c5f7d80a308cb@mail.gmail.com>	 <fvdk6f$j6a$1@ger.gmane.org>  <05dd01c8abe6$7a65aa50$5000040a@skathlaptop> <1209689109.6381.20.camel@localhost.localdomain> <fvdpme$vrl$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <fvdpme$vrl$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'sean darcy' <seandarcy2@gmail.com>, netfilter@vger.kernel.org



Sean darcy wrote:
 
> Wow. That worked.
> 
> I always thought iptables -F flushed all the tables. Is there a command
> that does flush all the tables? Cleans the slate completely?
> 

The 'filter' table is the default if no -t argument is specified, so only
the filter table gets flushed with iptables -F. 

The closest thing I can imagine to a clean slate is flushing all the
built-in tables by name, restoring the default policy for each table to
ACCEPT,  and running iptables -X to delete all user-generated tables:

iptables -t nat -F
iptables -t nat -P ACCEPT
iptables -t raw -F
iptables -t raw -P ACCEPT
iptables -t mangle -F
iptables -t mangle -P ACCEPT
iptables -t filter -F
iptables -t filter -P ACCEPT
iptables -X

'-t filter' is redundant as it's the default but I showed it here for
clarity.  

Maybe there's an argument that's shorthand for some or all of this, but
I'm not aware of one. 


