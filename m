From: "Ranjeet Shetye" <ranjeet.shetye@zultys.com>
Subject: RE: HELP: Conntrack table filling up !!!
Date: Tue, 31 Dec 2002 12:54:57 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c2b10e$e13376a0$0100a8c0@zultys.com>
References: <3E075D48.70801@interplus.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E075D48.70801@interplus.ro>
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
To: netfilter@lists.netfilter.org


There are ways in which pings (ICMP packets) can fill up conntrack
tables quickly. Are you running into problems with ICMP traffic only or
with any traffic ? e.g. look at /proc/net/ip_conntrack . Is it filled up
with ICMP traffic connections only ? If so, you might want to protect
your linux box from malformed ICMP packets, by DROPping all such packets
in the "filter" table.

Ranjeet Shetye
Senior Software Engineer
Zultys Technologies
771 Vaqueros Avenue
Sunnyvale  CA  94085
USA
Ranjeet.Shetye@Zultys.com
http://www.zultys.com/

 


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> Mircea Ciocan
> Sent: Monday, December 23, 2002 11:00 AM
> To: netfilter@lists.netfilter.org
> Cc: netfilter-devel@lists.netfilter.org
> Subject: HELP: Conntrack table filling up !!!
> 
> 
> 	Hi everybody,
> 
> 	I have this problem with connexion tracking table 
> filling to the max 
> and then it remains in a state "near the edge" that will allow only a 
> small number of new conexions and will cause a large packet 
> loss, even 
> "sendto: operation not permited" sometimes when I ping the neighboor 
> routers and so on.
> 	Everything got cleared up if I delete the ip tables 
> rules that deal 
> with contrack and remove and reinsert ip_conntrack module.
> 	Now if there is some method of avoiding this ( I only 
> see a discution 
> from 2001 that was not conclusive) or if there is is an method to 
> time-out faster those conexions in conntrack table or even a 
> method of 
> globaly quick-flush that table ( could be a even an 
> experimental patch, 
> I'm willing to try it and report) I'd very muck like to hear about it.
> 	Anyhow, thank you for your good work and have a happy new year.
> 		
> 		Regards,
> 
> 		Mircea Ciocan
> 
> P.S. kernel is 2.4.18 and machine have enough ram ( 512 MB) and 
> processing power ( P-III 800MHZ), traffic is something like 
> 50 Mb/s top 
> ans 25-30 medium.
> 
> 


