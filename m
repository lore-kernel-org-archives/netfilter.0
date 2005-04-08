From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Iptables vs. Cisco PIX
Date: Fri, 08 Apr 2005 14:59:11 -0400
Message-ID: <1112986751.5144.61.camel@jasiiitosh.nexusmgmt.com>
References: <038201c53c4c$6e94e540$0200a8c0@ale>
	<561dc326050408102860ab8b4b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <561dc326050408102860ab8b4b@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Jiann-Ming Su <sujiannming@gmail.com>, "Netfilter lista (iptables)" <netfilter@lists.netfilter.org>

On Fri, 2005-04-08 at 13:28 -0400, Jiann-Ming Su wrote:
> On Apr 8, 2005 11:05 AM, Alejandro Cabrera Obed <sisdis@tournet.com.ar> wrote:
<snip>
> We have a quad PIII Dell PowerEdge 6450 running iptables protecting
> the residence halls on a college campus.  It gets syn flooded
> constantly, handles 90k peak connections, load average of 1.0, all on
> 1GB of RAM.  The only short coming of iptables is the lack distributed
> management and lack of a high availability solution.  Distributed
> management is only a problem if you're managing more than several
> firewalls.  And, lack of HA makes it harder to deploy iptables fully
> on the enterprise.
Distributed management for iptables (and other firewalls) is exactly the
goal of the ISCS project (http://iscs.sourceforge.net).  The project
provides a more efficient administration tool than the most expensive
management frameworks like Solsoft, SmartPipes or Provider1 and is
entirely open source.

As my hours available for the project have reduced dramatically over the
last eight months, we (the seven other volunteers plus myself) could use
as much help as anyone can give.  If you are in need of distributed
management capability for iptables (as well as *swan, kernel IPSec,
iproute2, network level user authentication and some PKI management) or
have an academic interest and some time available, please contact me via
e-mail or phone.  Thanks - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


