From: Kevin McConnell <kevymac@yahoo.com>
Subject: Re: Doing Bridge with firewalling
Date: Tue, 31 Dec 2002 08:08:53 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021231160853.7071.qmail@web40303.mail.yahoo.com>
References: <F154kB47qXLFfJNwPmx00000ffb@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F154kB47qXLFfJNwPmx00000ffb@hotmail.com>
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
Cc: Afshin Lamei <linux_st@hotmail.com>


--- Afshin Lamei <linux_st@hotmail.com> wrote:

> 1- Is it necessary to disable ip address of both
> eth0 and eth1? if yes, how 
> to do that?

how could you do NAT'ing if you removed the IP
addresses?

> 2- When I try to add eth0 as an interface to the
> bridge (using brctl addif), 
> It says : "eth0:Setting promiscuous mode." what does
> it mean?
> thanks,

It means that the interface will take all frames that
are traversing the network it's attached to, even if
they aren't supposed to be destined for the device.


=====
Kevin C. McConnell --RHCE-- <Red Hat Certified Engineer>

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com

