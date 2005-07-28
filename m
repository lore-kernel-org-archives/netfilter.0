From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: RE: Problem downloading large files from Apache from far
Date: Thu, 28 Jul 2005 07:56:27 -0400
Message-ID: <1122551787.2667.1.camel@localhost>
References: <NJBBIPFCOLMFJFKBPLDMOEJPCCAA.andrewna@mymcsb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <NJBBIPFCOLMFJFKBPLDMOEJPCCAA.andrewna@mymcsb.com>
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
To: netfilter@lists.netfilter.org

I would suggest putting a protocol analyzer on the line to see what is
happening.  You can download a quite powerful open-source one from
http://www.ethereal.com - John

On Thu, 2005-07-28 at 08:47 +0800, Andrew wrote:
> Hi M.Eldesoky,
> 
> Not that I know of, the configuration in the firewall:
> 
> conduit permit icmp any any
> 
> Thanks,
> 
> Andrew
> 
> -----Original Message-----
> From: Mohamed Eldesoky [mailto:eldesoky.lists@gmail.com]
> Sent: Wednesday, July 27, 2005 7:04 PM
> To: Andrew
> Cc: netfilter@lists.netfilter.org
> Subject: Re: Problem downloading large files from Apache from far
> 
> 
> Is the Cisco PIX blocking ICMP
> 
> On 7/27/05, Andrew <andrewna@mymcsb.com> wrote:
> > Hi,
> >
> > I'm running Fedora Core 4 (Linux 2.6.11) with netfilter 1.30.
> > I've setup apache 2.54 to run at port 80.
> >
> > Basically when downloading large files(or pages) from apache, the download
> > stalls after the first few kilobytes or so.
> >
> > The configuration for the firewall in /etc/sysconfig/iptables is:
> > *filter
> > :INPUT ACCEPT [0:0]
> > :FORWARD ACCEPT [0:0]
> > :OUTPUT ACCEPT [0:0]
> > :RH-Firewall-1-INPUT - [0:0]
> > -A INPUT -j RH-Firewall-1-INPUT
> > -A FORWARD -j RH-Firewall-1-INPUT
> > -A OUTPUT -j ACCEPT
> > -A RH-Firewall-1-INPUT -i lo -j ACCEPT
> > -A RH-Firewall-1-INPUT -p icmp --icmp-type any -j ACCEPT
> > -A RH-Firewall-1-INPUT -p 50 -j ACCEPT
> > -A RH-Firewall-1-INPUT -p 51 -j ACCEPT
> > -A RH-Firewall-1-INPUT -p udp --dport 5353 -d 224.0.0.251 -j ACCEPT
> > -A RH-Firewall-1-INPUT -p udp -m udp --dport 631 -j ACCEPT
> > -A RH-Firewall-1-INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> > -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 21 -j
> > ACCEPT
> > -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j
> > ACCEPT
> > -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j
> > ACCEPT
> > -A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-port-unreachable
> > COMMIT
> >
> > The solution is to add set port 80 to allow INVALID packets:
> >
> > -A RH-Firewall-1-INPUT -m state --state NEW,ESTABLISHED,RELATED,INVALID -m
> > tcp -p tcp --dport 80 -j ACCEPT
> >
> > But the question is, why are subsequent packets coming from the remote
> > machine being identified as INVALID? Will allowing INVALID packets cause
> > other problems?
> >
> > The Linux machine is actually behind another Cisco PIX firewall. Could the
> > hardware firewall be translating the packets wrongly? Any ideas?
> >
> > Regards,
> >
> > Andrew
> >
> >
> >
> >
> 
> 
> --
> Mohamed Eldesoky
> www.eldesoky.net
> RHCE
> 
> 

-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


