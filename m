From: Joel Solanki <zealous@bonbon.net>
Subject: Re: Ip accounting Help--> Urgent
Date: Sat, 26 Jun 2004 15:25:30 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088243730.2121.3.camel@joel.d2visp.com>
References: <1087962571.2041.10.camel@joel.d2visp.com>
	 <200406260922.14221.Antony@Soft-Solutions.co.uk>
	 <1088241658.2283.35.camel@joel.d2visp.com>
	 <200406261029.36368.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406261029.36368.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

I am working on what you have suggested...in 7 mins.I will be back with
an email.
Some clarification.

192.168.0.2 is windows 98 machine
From win98 machine i upload a file on my other ftp server which has a
public ip address.
I am only using win98 machine as client. i am downloading squid.tar.gz
from my ftp server and that file i m again uploading to my ftp server.
So this is the right things ........
On my linux server i m doing nothing except the iptables rule. 

I will be back in 7 mins.:)
Regards,


On Sat, 2004-06-26 at 14:59, Antony Stone wrote:
> On Saturday 26 June 2004 10:20 am, Joel Solanki wrote:
> 
> > Good morning Antone and all.
> >
> > 	LINUX SERVER eth0 200.200.200.200 (public ip) --> switch
> > 		     eth1 192.168.0.1/24   -------------> switch
> >
> > Yes 192.168.0.2 is the ip of windows 98 machine.
> 
> Windows 98?   And it's running an FTP server???
> 
> I'm surprised...
> 
> > Chain FORWARD (policy ACCEPT 5299 packets, 1571K bytes)
> >  pkts bytes target     prot opt in     out     source        destination
> >  2672 1461K            all  --  eth1   *       192.168.0.2   0.0.0.0/0
> >  2627  110K            all  --  eth0   *       0.0.0.0/0     192.168.0.2
> >
> > I have tested again this rules
> > I just upload squid.tar.gz which is of 1.3M. and i found the above
> > results. Its only showing the 110K bytes ...file is of 1.3M and traffic
> > bytes are more in other rule ..its showing 1461K. so i cant get what is
> > exactly going on with this chains...
> 
> Please let's clarify which machine is doing exactly what...
> 
> You say you have a Windows 98 machine on IP 192.168.0.2
> 
> Your rules have recorded 1461kbytes *sent from* that machine to somewhere 
> else, and 110kbytes *received by* that machine from somewhere.
> 
> That to me is entirely consistent with you saying you have uploaded (by which 
> I assume you mean "sent to somewhere else") 1.3Mbytes of data by FTP.
> 
> My suggestion is:
> 1. Clear the counters to zero with "iptables -Z FORWARD -t mangle"
> 2. Download (receive) a file on machine 192.168.0.2 of some known size.
> 3. Check the counters with "iptables -L FORWARD -t mangle -nvx"
> 4. Upload (send) some *other* file of a different size from machine 
> 192.168.0.2
> 5. Check the counters again.
> 6. Let us know if the first rule shows a byte count noticeably different from 
> what you sent, or the second rule shows a byte count noticeably different 
> from what you received.
> 
> Hope this helps,
> 
> Antony.
-- 
Joel n.solanki
Systems Administrator
(M) 91-9825500258
D2V ISP PVT LTD
http://www.d2visp.com




