From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Is this possible?
Date: Thu, 22 Apr 2004 14:03:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404221403.05058.Antony@Soft-Solutions.co.uk>
References: <4087BC5F.5010806@uk.thalesgroup.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4087BC5F.5010806@uk.thalesgroup.com>
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

On Thursday 22 April 2004 1:36 pm, Fisher Alex wrote:

> > However, if someone is adamant that you need to set up network
>
> connectivity
>
> > between machines with such an unfriendly combination of IP addresses, I
> > suggest you simply set up multiple host-specific routes on the netflter
> > machine, telling it where to find each different 192.168.0.* destination
> > address, and don't have a standard 192.168.0.0/24 route on that system.
>
> Unfortunately, this is exactly what I can't do :(  This is because there
> are two of each 192.168.0.* IP address.  The original destination IP
> address has to taken into account when determining whether packets route
> through eth1 or eth2.

Have you considered using two netfilter boxes, one DNATting from 
172.26.158.1-30 to 192.168.0.1-30 (network A), and the other DNATting from 
172.26.158.31-60 to 192.168.0.1-30 (network B)?

Regards,

Antony

-- 
What is this talk of "software release"?
Our software evolves and matures until it is capable of escape, leaving a 
bloody trail of designers and quality assurance people in its wake.

                                                     Please reply to the list;
                                                           please don't CC me.


