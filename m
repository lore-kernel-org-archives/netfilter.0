From: Peteris Krumins <newsgroups@lf.lv>
Subject: Re[2]: Possible huge iptables memory leakage
Date: Thu, 31 Jul 2003 23:37:08 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <10268906076.20030731233708@lf.lv>
References: <7C9884991ADAE0479C14F10C858BCDF5122E14@alderaan.smgtec.com>
Reply-To: Peteris Krumins <newsgroups@lf.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122E14@alderaan.smgtec.com>
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

Thursday, July 31, 2003, 11:14:51 PM, you wrote:

DC> I am not sure what everyone else's environments are like, but I am
DC> definitely getting memory infinitely swallowed into Netfilter somewhere.
DC> I have userspace programs, but put together they take less than 5% of
DC> the system memory.

I am getting only on this particular 2.4.22-pre6 and ipt1.2.8
w/patch-o-matic-20030714

As Aldo S. Lagana noted it might be conntracking but it does not seem
logical - conntracking entries shrinking, ram usage growing.
I hope it hold the peak hours tomorrow.

DC> I forced myself to reboot once the ACTIVE memory takes 95% of the CPU,
DC> which was every 3 weeks with 196mb of RAM. This server averaged 200 -
DC> 250 connection tracks during office hours. The ramping active memory
DC> usage went up in a very linear pattern until it took all the system, at
DC> which point I would have to reboot due to performance degradation.

I hope i dont have to reboot tomorrow..

DC> The last reboot, I decided to play with the machine's settings and add
DC> some memory totaling 256MB. I also disabled my SWAP partition because I
DC> have a few database servers that perform fantastically when kswapd isn't
DC> used much. 

I am not swapping at all, since the machine loads everything from 16MB
ide flash.

DC> The result: Active memory 'seems' to have stabilized around 75MB at
DC> least for the few days that it has been stable. I cannot tell if this
DC> was totally kswap's fault, or even if the problem has been fixed at all.
DC> It does look promising though.

We'll see, thanks.


P.Krumins


