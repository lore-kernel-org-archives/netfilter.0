From: SBlaze <dagent.geo@yahoo.com>
Subject: RE: a sort of n00b question here but I'ld like to know.
Date: Mon, 20 Oct 2003 17:41:01 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031021004101.65971.qmail@web40203.mail.yahoo.com>
References: <7C9884991ADAE0479C14F10C858BCDF5122E71@alderaan.smgtec.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122E71@alderaan.smgtec.com>
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
To: Daniel Chemko <dchemko@smgtec.com>, Eric Marchionni <mailing-lists@gmx.ch>, netfilter@lists.netfilter.org

That's really nice information. Thanks for sharing it with me. However, this
still leaves the question I asked yet to be answered. Since it's not an
"official" process(I knew that already)does it show up in the CPU usage
statistics?

ie

root@nixn00b:~# uptime
 20:32:26 up 11 days, 19:56,  4 users,  load average: 0.00, 0.00, 0.00


The reason I ask is that I have what I think is an unusual amount of inbound
unsolicited udp traffic(which is dropped by iptables/netfilter). I also have
really bad ping times to games alot of the times. In trying to track down the
culprut for this I am looking first at my own setup. If iptables/netfilter does
not show up in the load adverage....then perhaps my hardware is to blame? I
really hate to believe the problem is with my Linux box...but I want to rule it
out and move onto the next idea as to the problem.

Thanks Alot for any info in advance. Perhaps this is one for the netfilter FAQ?
SBlaze



--- Daniel Chemko <dchemko@smgtec.com> wrote:
> Iptables is just a program that loads your rules into the kernel. The
> kernel modules running to support the firewall system is commonly known
> as 'Netfilter'.
> 
> These modules run under the networking sub-system in the kernel, so it
> doesn't need to spawn a kernel process. Kernel processes are the
> programs with [ ] around them when running ps.
> 
> I think you can have non-kernel processes with the [], but I don't know
> when that is the case.
> 
> -----Original Message-----
> From: Eric Marchionni [mailto:mailing-lists@gmx.ch] 
> Sent: Monday, October 20, 2003 4:37 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: a sort of n00b question here but I'ld like to know.
> 
> SBlaze wrote:
> 
> >As I said this is probably a n00bish question but i'm curious. Since
> iptables
> >is hooked into the kernel; would it show up as usage in the top or
> uptime statistics?
> >
> i'd like to know that as well ;-D
> 
> cheers,
> eric
> 
> 
> 
> 
> 


=====
In the absence of order there will be chaos.

__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com

