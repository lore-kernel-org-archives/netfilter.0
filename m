From: Tom Eastep <teastep@shorewall.net>
Subject: Re: ftp forward to internal machine
Date: Tue, 4 Jun 2002 15:32:08 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.44.0206041531190.30454-100000@wookie.shorewall.net>
References: <200206042229.g54MTuA10411@Networker.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206042229.g54MTuA10411@Networker.rockstone.co.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: "netfilter@lists.samba.org" <netfilter@lists.samba.org>

On Tue, 4 Jun 2002, Antony Stone wrote:

> On Tuesday 04 June 2002 11:24 pm, Omar Castaneda Acosta wrote:
> 
> > I've never included port 20 on my firewall rules and both passive and
> > active ftp work fine.
> 
> Yeah, but I'll bet you're not translating the service to run on a weird port 
> number, are you ?
> 
> You're almost certainly using "-m state --state RELATED" to handle port 20 
> for you.   Isn't stateful inspection wonderful :-)
> 

And also loading ip_conntrack_ftp.o and ip_nat_ftp.o.

-Tom
-- 
Tom Eastep    \ Shorewall - iptables made easy
AIM: tmeastep  \ http://www.shorewall.net
ICQ: #60745924  \ teastep@shorewall.net


