From: Michael Gale <mgale@utilitran.com>
Subject: Re: iptable_nat module slows/hoses my Redhat 9.0 box
Date: Fri, 12 Dec 2003 09:11:31 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031212091131.08087ae5.mgale@utilitran.com>
References: <EFBADA8C200C2B418DA39734FD15475B0B20EF@skat.sky.com>
	<20031212071301.GP15606@sunbeam.de.gnumonks.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031212071301.GP15606@sunbeam.de.gnumonks.org>
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

Hello,

	Am I missing something here, I have dual 2.X Ghz processor box with 4GB of RAM. 

The box only has 2 interfaces but it has 22 "floating IP address" because it runs in a master / slave cluster using linux-ha. 

The master box has a complex Iptables scripts -- that consists of 25 user defined chains, one for each IP. Plus each IP has it's own NAT rule for inbound and outbound traffic.

I have not really notice any performance problems. I am using a custom 2.4.23 kernel with all the Iptables options built in.

Between the standard just forward with NO NAT and the complex iptables script. There is basicly no performance change ... sure the initial FTP command channel connection is a little slower. But besides that all other performance issues have gone unnoticed by any users.

Michael.


On Fri, 12 Dec 2003 08:13:01 +0100
Harald Welte <laforge@netfilter.org> wrote:

> On Thu, Dec 11, 2003 at 09:47:25PM -0800, Kishore Dharmavaram wrote:
> > Hi All,
> > 
> > I find that after inserting "iptable_nat" module on my RH9.0(2.4.20-19.9)
> > box, session-setup(ip_conntrack)  performance gets very bad. 
> 
> yes, that's true.  I think we cannot state often enogh: DO NOT load
> iptable_nat if you don't need nat.  
> 
> > I am wondering why "iptable_nat" is slowing doing the box so much when I
> > don't have any NAT rules defined.
> 
> NAT is inherently complex.  and in order to support any kind of nat,
> every connection (even the non-nat'ed ones) need to be placed in two
> additional hash tables.  
> 
> If you just use conntrack, a single hash table is sufficient.. 
> 
> > Do you guys know of any netfilter patches made to address/fix this issue?.
> 
> There is no way to 'address' this issue other than not using NAT.
> 
> > Thanks,
> > Kishore
> 
> -- 
> - Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
> ============================================================================
>   "Fragmentation is like classful addressing -- an interesting early
>    architectural error that shows how much experimentation was going
>    on while IP was being designed."                    -- Paul Vixie
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

