From: Ben Russo <ben@umialumni.com>
Subject: Re: IPTABLES vs Checkpoint
Date: 26 Nov 2002 17:32:50 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038349969.16931.16.camel@ben.mis.tnsi.com>
References: <3F5BAB933C75004690195047C4040A6D0535D4@tc-pdc.jhbA.techconcepts.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F5BAB933C75004690195047C4040A6D0535D4@tc-pdc.jhbA.techconcepts.co.za>
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
To: Wayne de Nobrega <wdenobre@techconcepts.co.za>
Cc: netfilter@lists.netfilter.org

For a company with many offices a Nokia CheckPoint solution is a good
choice *IF* the money spent on the management of the firewall is
reasonably proportional to the cost of the firewall software and
updates.

I used to run many Linux based iptables firewalls for data centers in 
many different cities and offices in many cities.  It was a management 
nightmare that led our company to decide to use Checkpoint.  Not because
it was technically superior to iptables when simply looking at
firewalls.  (although there are many viewpoints to that argument)
but because in terms of time and energy spent managing the firewalls
checkpoint's TCO was much lower.

I love Linux ( I am an RHCE and manage scores of Linux servers)
iptables makes a great SOHO firewall for the technically saavy
or a host based firewall with a distributions GUI tools for even 
newbies.  And if you are in a small organization with only a handfull
of firewalls you can even do *VERY* complex things with it.

However for an enterprise solution you need management tools and
you may need integration with VPN's, DNS, Authentication, IP-GRE
Accounting, performance management 
and other third party applications.  
CheckPoint has modules and tools that can do all of that.

You could probably glue together many great Open Source packages
to meet your needs, but it is a constant uphill battle to keep them
all updated with patches and integrated and scalability and management
becomes a big issue.  Also, when you start doing that then there is
the risk to the company of losing the employees who "know-how-it-works"

When sticking to a Commercial Off The Shelf system like CheckPoint
and using Commercial integration modules the costs may seem dramatic.
However you can hire Certified Consultants when your Sr. SysAdmin
quits who know CISCO, NOKIA, CheckPoint, MSCP, RHCE, etc. etc..
There is a value in that too.

What it comes down to (IMHO) is the variables in your TCO 
equation.  You need someone who both knows your business and what
its goals and growth are likely to be, and also has  experience
with enterprise WAN management to evaluate that TCO equation.


On Tue, 2002-11-26 at 14:28, Wayne de Nobrega wrote:
> Hello,
> 
> I have a customer who is part of an international group which has a
> policy of using the Nokia Checkpoint firewall.  Due to the signifcant
> cost differences, and our preference, the local branch and ourselves
> would like to install an IPTABLES based firewall.  I need some help in
> motivating this to head office and am looking for information comparing
> the two solutions.  I need to focus on the technical issues of the two
> products and ultimately the inherent security realised from the two
> products.
> 
> Can anyone offer some input or point me to a source of information.
> 
> Many thanks
> 
> Wayne


