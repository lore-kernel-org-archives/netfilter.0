From: Tim Evans <tkevans@tkevans.com>
Subject: Re: Resend: MASQUERADE: Route sent us somewhere else.
Date: Tue, 5 Apr 2005 06:35:49 -0400 (EDT)
Message-ID: <200504051035.j35AZn2H025714@osprey.tkevans.com>
Reply-To: Tim Evans <tkevans@tkevans.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-MD5: fLQC+us9typbYPlK21ggFA==
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
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org, opie@817west.com

Thanks for your reply.

>the error message you refer to in your subject is normally encountered
>when using MASQUERADE in conjunction with policy routing, which normally
>implies multiple ISP connections.

Just one connection.

>i cannot find information referencing any of the above in the details of
>your post; which could be a possible explanation for the silence.

Might it be some sort of conflict between my immediate ISP (Comcast) assigning a 
my firewall a domain name via DHCP and my using my "real" domain name on the 
inside?  Again, however, this problem didn't happen with RHEL 3.

I've also noted that if I run a traceroute to my main domain and let it 
finish--it may take a minute or two, but it eventually connects--other 
connections then work.  Immediate workaround is to insert the traceroute into my 
fetchmail cron job. 
--
Tim Evans, TKEvans.com, Inc.	|    5 Chestnut Court
tkevans@tkevans.com		|    Owings Mills, MD 21117
http://www.tkevans.com/		|    443-394-3864
http://www.come-here.com/News/	|    


