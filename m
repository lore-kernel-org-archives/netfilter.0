From: Kevin McConnell <kevymac@yahoo.com>
Subject: Re: iptables on Red Hat Linux 8.0 installation requires frequent iptables restart
Date: Sun, 22 Dec 2002 09:01:08 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021222170108.6054.qmail@web40301.mail.yahoo.com>
References: <F635E25A78F69C41B85DC6CB18972A9A4746FA@kepler.blueshiftinc.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F635E25A78F69C41B85DC6CB18972A9A4746FA@kepler.blueshiftinc.com>
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
To: "John A. Novak" <jnovak@blueshiftinc.com>, netfilter@lists.netfilter.org


--- "John A. Novak" <jnovak@blueshiftinc.com> wrote:
> The system iptables is running on is used only as a
> firewall, has 512MB of RAM and three network
> adapters.  The symptom I'm seeing is that every day
> or so I need to restart the iptables service to get
> packets moving through the firewall again.  The
> system appears to have plenty of available RAM and
> plenty of free disk space when the firewall is
> dysfunctional.  
> 
> I am using NAT and have it configured to remap
> internal addresses to two ranges of external ip
> addresses, one for each of the two internal
> networks.
> 
> The periodic failure and resurrection after restart
> is suggestive of a resource leak, but I'm at a loss
> as to how to proceed to further debug this problem.

When you say resource leak, are you referring to a
memory leak? I don't think that's the case. I'm only
using 64 MB of RAM on my FW and it works without
restart every day. Coincidentally, does doing this
change and make the firewall start allowing packets
through again... try checking out the arp entries on
the FW itself and see if an arp problem exists.


=====
Kevin C. McConnell --RHCE-- <Red Hat Certified Engineer>

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com

