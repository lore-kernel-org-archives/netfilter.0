From: mourik jan c heupink <heupink@intech.unu.edu>
Subject: RE: howto only allow outgoing mail from certain hosts
Date: 01 Oct 2002 21:20:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1033500050.1134.7.camel@suse8>
References: <0EB90DD25728C04CBD401CDCD72D2A655A8E@homer.no.laasby.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <0EB90DD25728C04CBD401CDCD72D2A655A8E@homer.no.laasby.com>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Thank you all very much...!
You are a bunch of very helpful people here!

Never had so many replies to a single question (and so fast also!)

Thanks, and things are running just as i want them to, now.

Yours,
Mourik Jan

On Tue, 2002-10-01 at 18:03, Kjetil Laasby wrote:
> Hi.
> 
> Try to put your "excluding" networks first - like
> 
> iptables -A FORWARD -s mailserver1 -p tcp --dport 25 -j ACCEPT // That's
> OK
> iptables -A FORWARD -s mailserver2 -p tcp --dport 25 -j ACCEPT // That's
> OK
> iptables -A FORWARD -s 0.0.0.0/0 -p tcp --dport 25 -j DROP // Anything
> else 
> 
> Syntax may not be right here, just working from my head.. 
> 
> Regards,
> Kjetil
> 
> -----Original Message-----
> From: Heupink, Mourik Jan C. [mailto:Heupink@INTECH.UNU.EDU] 
> Sent: 1. oktober 2002 16:09
> To: 'netfilter@lists.netfilter.org'
> Subject: howto only allow outgoing mail from certain hosts
> 
> Hello all.
> 
> The subject says it all, really. I want to (of course) allow OUTGOING
> mail
> from our domain, from only two designated servers. So, drop outgoing
> mail
> from any other host.
> 
> I can't seem to produce the iptables command to get this to work...
> (using
> forward chain, because using transp. bridging firewall...)
> 
> I guess this: iptables -A FORWARD -s x.x.x.0/24 -p tcp --dport 25
> -REJECT
> would drop all outgoing mail, right? (i guess the way to select outgoing
> mail traffic would be to use --dport..?)
> 
> Now i have to find a way to make an exclusion in that rule. something
> like
> -s x.x.x.0/24 EXCEPT x.x.x.y
> 
> Could anyone shed some light onto this..?
> 
> Thanks very much in advance,
> Yours,
> Mourik Jan
> 



