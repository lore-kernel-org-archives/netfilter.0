From: Ranjeet Shetye <ranjeet.shetye2@zultys.com>
Subject: RE: Re: Ports closed in spite of opening them?
Date: Fri, 02 Apr 2004 12:00:39 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080936038.22816.3.camel@ranjeet-pc2.zultys.com>
References: <AD8D39C727CBD411BB2C0090273A727408F9F139@mortimer.law.uconn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <AD8D39C727CBD411BB2C0090273A727408F9F139@mortimer.law.uconn.edu>
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
To: "Hurley, Michael" <MHurley@law.uconn.edu>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>


you might have "/etc/hosts.allow" and "/etc/hosts.deny" files lying
around that WILL interfere, without you being aware of what's happening.
Happened to me while trying out ArchLinux (very nice distro BTW). I
would look for these files, and IF present, I would comment all entries
(while keeping the machine secure)

Ranjeet.

On Fri, 2004-04-02 at 08:41, Hurley, Michael wrote:
> Thanks to all for your help--it does appear the daemons are the problem.
> Into the conf files I go. Sorry for the false alarm.
> 
> -Mike
> 
> -----Original Message-----
> From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
> Sent: Friday, April 02, 2004 11:17 AM
> To: 'netfilter@lists.netfilter.org'
> Subject: Re: Re: Ports closed in spite of opening them?
> 
> 
> On Friday 02 April 2004 5:04 pm, Hurley, Michael wrote:
> 
> > Yes, sendmail is listening on port 25; apache on port 443. However, I am
> > not able to connect to them. Here is what nmap reports:
> > Interesting ports on x.x.x.x:
> > (The 1597 ports scanned but not shown below are in state: filtered)
> > Port       State       Service
> > 22/tcp     open        ssh
> > 25/tcp     closed      smtp
> > 80/tcp     open        http
> > 443/tcp    closed      https
> 
> Well, if you can't connect to them with a standard client, then nmap won't
> be 
> able to connect to them either, so it will report the port closed (for the 
> reason Cedric gave).
> 
> As Cedric said, netfilter is doing its job correctly - your problem lies 
> elsewhere.   You should find out why the daemons are not responding to a 
> connection from the machine you are testing with.
> 
> Regards,
> 
> Antony,
-- 

Ranjeet Shetye
Senior Software Engineer
Zultys Technologies
Ranjeet dot Shetye2 at Zultys dot com
http://www.zultys.com/
 
The views, opinions, and judgements expressed in this message are solely
those of the author. The message contents have not been reviewed or
approved by Zultys.



