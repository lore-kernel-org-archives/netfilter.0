From: Justin Friel <capn_shoe@yahoo.com>
Subject: Re: DNAT: Unable to Forward Ports, Why?
Date: Mon, 31 May 2004 10:46:50 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040531174650.78590.qmail@web60006.mail.yahoo.com>
References: <20040531073952.83957.qmail@web41705.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040531073952.83957.qmail@web41705.mail.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Thanks for the reply.


--- "Kevin D. White" <web_crawlz@yahoo.com> wrote:
> 
> This rule would allow traffic going to the www port
> (80) to be forwarded on.
> /sbin/iptables -A FORWARD -p tcp --dport 80 -j
> ACCEPT 
> 

Originally that is the way I had it in my script, to
be sure I tried it again with no luck.  I changed it
to the following hoping that if I was more specific it
would work.  It didn't.
  
$IPT -A FORWARD -d $EXT_IP -p tcp --dport 80 -j ACCEPT
$IPT -t nat -A PREROUTING -p tcp --dport 80 \
 -d $EXT_IP -j DNAT --to-destination 192.168.1.2:80
 
> I think the PREROUTING chain is before the FORWARD
> chain so your condition for the external IP may
> never
> happen because you changed it, but I don't know that
> for sure.

This is more my worry right now.  I'm wondering if the
order of the rules in my script is jacked or there is
some rule in my script that is killing the packet
before it reaches the PREROUTING or FORWARD chains.

I was reading the recent posts and noticed someone
who's ISP was blocking port 80.  I don't believe this
is the case for me, as I was able to run a ftp server
before using my SpeedStream DSL router.  The problem
was it couldn't do passive ftp, which is why I tried
this solution.

I'm getting pretty frustrated.  I have been checking
the logs for dropped packets from the outside and the
only ones I have been seeing are random scans of port
153, probably a virus.

What's going on here?

Thanks,
Justin


	
		
__________________________________
Do you Yahoo!?
Friends.  Fun.  Try the all-new Yahoo! Messenger.
http://messenger.yahoo.com/ 

