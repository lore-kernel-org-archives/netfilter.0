From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: Re: first time set up
Date: Thu, 30 Oct 2003 07:04:11 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067515451.27238.3.camel@tarkus>
References: <FDB52A0429DFD31196FB0008C7D972D50EA57901@OST_EXCH_USR5>
Reply-To: tedkaz@optonline.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <FDB52A0429DFD31196FB0008C7D972D50EA57901@OST_EXCH_USR5>
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
To: "Knight, Steve" <Steve.Knight@bskyb.com>
Cc: netfilter@lists.netfilter.org

Any particular reason you want default output drop?
That is a lot of overhead unless the box is only a dns server
than your train of thought is ok.

Also you need 

iptables -A INPUT -p udp -m udp --dport 53 -j ACCEPT

you could specify as well the interface like so
-A INPUT -i eth0 -p udp -m udp --dport 53 -j ACCEPT

Ted



On Thu, 2003-10-30 at 06:50, Knight, Steve wrote:
> Hi there ---
> 
> Once I've got the normal stuff in place on a test standalone box [default
> drop, accept related + established on tcp, loopback enabled]
> 
> iptables -A OUTPUT -p udp -s $LOCALIP -d $DNS1 --dport 53 -j ACCEPT
> 
> Shouldn't this be enough to allow standard dns resolution to take place?
> According to Ziegler, it should?
> 
> Or am I a complete plum.
> 
> Any pointers as to my plumness gratefully received.  Thanks :)
> 
> steve
> 
> 
> 
> -----------------------------------------------------------------------
> Information in this email may be privileged, confidential and is 
> intended exclusively for the addressee.  The views expressed may
> not be official policy, but the personal views of the originator.
> If you have received it in error, please notify the sender by return
> e-mail and delete it from your system.  You should not reproduce, 
> distribute, store, retransmit, use or disclose its contents to anyone.
>  
> Please note we reserve the right to monitor all e-mail
> communication through our internal and external networks.
> -----------------------------------------------------------------------
-- 
Ted Kaczmarek<tedkaz@optonline.net>
18 Packanack Lake Road
Wayne, NJ, 07470
973-633-6892

AIM-tedhurrah
Yahoo-oasysted


