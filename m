From: "Ranjeet Shetye" <ranjeet.shetye@zultys.com>
Subject: RE: Does IPTables have a 1:1 port-forwarding capability for a DNAT port-range ?
Date: Fri, 13 Dec 2002 09:45:58 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000901c2a2cf$7f2730c0$0100a8c0@zultys.com>
References: <3DF9CC70.3080603@istitutocolli.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DF9CC70.3080603@istitutocolli.org>
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


Hi Andrea,

I was hoping that the answer would be "Yes, IPTables can do it", but I
think you are right. As a matter of fact, I have been looking into the
NetFilter code for the last couple of days and I was hoping that I
didn't need to hack the kernel code (cos its not documented). But it
looks like I will have to.

Anyways, I will take my query to the developer-mailing list and post a
reply here once everything is sorted out. In the meantime if anyone has
an architectural overview of Netfilter, one that maps out the
interactions between the various components and layers, I'd really
really like to get my hands on it!

Thanks for your help, Andrea.

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
> Andrea Rossato
> Sent: Friday, December 13, 2002 4:03 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: Does IPTables have a 1:1 port-forwarding 
> capability for a DNAT port-range ?
> 
> 
> Ranjeet Shetye wrote:
> > The reason for wanting a 1:1 rule is for X windows and 
> other fat port 
> > ranges. Dont want hundreds of rules in there if one can do the job. 
> > Can IPTables do it ? If so how ? If not, I guess I'll have 
> to get in 
> > touch with the developers for tips on a good starting point.
> 
> I believe that the only way is to hack nat code.
> I will start looking in
> net/ipv4/netfilter/ip_nat_core.c
> and the function manip_pkt that, as far as I understand, is 
> actually writing the NATed packet andrea
> 
> 



