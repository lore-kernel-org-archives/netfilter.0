From: "Klemen Kecman" <klemen@sting.si>
Subject: Fw: ICMP Rule Problem
Date: Tue, 3 Feb 2004 09:02:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006c01c3ea2c$146686f0$6a02a8c0@klemen>
Reply-To: "Klemen Kecman" <klemen@sting.si>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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


----- Original Message ----- 
From: "Klemen Kecman" <klemen@sting.si>
To: <markee@bandwidthco.com>
Sent: Tuesday, February 03, 2004 9:01 AM
Subject: Re: ICMP Rule Problem


> Not allowing ICMP type 8 goes in to INPUT chain
> Not allowing ICMP type 0 goes in to the OUTPUT chain
> 
> First is sane .. but second is kinda not good .. unless it has specific
> purpose.
> 
> ----- Original Message -----
> From: "Mark E. Donaldson" <markee@bandwidthco.com>
> To: "'David C. Hart'" <dch@TQMcube.com>; "'Iptables Mailing List'"
> <netfilter@lists.netfilter.org>
> Sent: Tuesday, February 03, 2004 7:36 AM
> Subject: RE: ICMP Rule Problem
> 
> 
> > ICMP Type 0 is an echo reply.  Request (ping) is Type 8.
> >
> > -----Original Message-----
> > From: David C. Hart [mailto:dch@TQMcube.com]
> > Sent: Monday, February 02, 2004 9:03 AM
> > To: Iptables Mailing List
> > Subject: ICMP Rule Problem
> >
> > Should this not reject echo requests?
> >
> > -A INPUT -p icmp -m icmp --icmp-type 0 -j REJECT --reject-with
> > icmp-net-prohibited
> >
> > It doesn't seem to work.
> >
> >                                ---------
> >             Quality Management - A Commitment to Excellence
> >
> >
> >
> 


