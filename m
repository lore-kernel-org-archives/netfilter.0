From: thingstocome@gmx.net
Subject: Re: Re: unexpected problem with DNAT
Date: Wed, 10 Jul 2002 16:03:51 +0200 (MEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <514.1026309831@www1.gmx.net>
References: <02071014505504.04513@Lms>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: jan.humme@xs4all.nl
Cc: netfilter@lists.samba.org

> I believe it can only be fixed in the filter module somehow, as all
> packets 
> travel through the filter module. You may insert a rule to the FORWARD
> chain, 
> to block the FTP-traffic from this IP-address; this should take immediate 
> effect.
> 
> Jan Humme.
> 

thx for your reply.

hmm if i would attempt to block the packets of the ftp session inside the
FORWARD chain,
the destination address would already have changed to an address of LAN_1 (
because of prerouting).

I think i can't block these packets in the FORWARD chain by checking their
destination address because as you might remember, SNAT ( masquerading) is
also used by LAN_1_ADDR,
so some packets of the masquerading sessions do also have destination
address LAN_1_ADDR when they pass the forward chain ( because NAT is
bidirectional), so they would be blocked as well.

do you know what I mean ? 

i could filter the packets by checking the src address as you suggested,
but this isnt a good idea in my opinion because the src address varies every
time and there can also be several hosts from LAN_2 that had accessed
LAN_1_ADDR at the same time,i would have to manually determinate the addresses of
all these lan_2 hosts every time, and set the filter rules, 
or is there another possibility? 
Am i thinking in the wrong direction ?

It would be great if there were a possibility to simply wipe the entries of
connections
that have been tracked by be conntrack module. 
I think this would be the best solution but i dont know how to do it.  

please tell me if i miss the point somewhere.


-- 
GMX - Die Kommunikationsplattform im Internet.
http://www.gmx.net


