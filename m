From: "Hurley, Michael" <MHurley@law.uconn.edu>
Subject: RE: Re: Ports closed in spite of opening them?
Date: Fri, 2 Apr 2004 11:41:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <AD8D39C727CBD411BB2C0090273A727408F9F139@mortimer.law.uconn.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Thanks to all for your help--it does appear the daemons are the problem.
Into the conf files I go. Sorry for the false alarm.

-Mike

-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
Sent: Friday, April 02, 2004 11:17 AM
To: 'netfilter@lists.netfilter.org'
Subject: Re: Re: Ports closed in spite of opening them?


On Friday 02 April 2004 5:04 pm, Hurley, Michael wrote:

> Yes, sendmail is listening on port 25; apache on port 443. However, I am
> not able to connect to them. Here is what nmap reports:
> Interesting ports on x.x.x.x:
> (The 1597 ports scanned but not shown below are in state: filtered)
> Port       State       Service
> 22/tcp     open        ssh
> 25/tcp     closed      smtp
> 80/tcp     open        http
> 443/tcp    closed      https

Well, if you can't connect to them with a standard client, then nmap won't
be 
able to connect to them either, so it will report the port closed (for the 
reason Cedric gave).

As Cedric said, netfilter is doing its job correctly - your problem lies 
elsewhere.   You should find out why the daemons are not responding to a 
connection from the machine you are testing with.

Regards,

Antony,

-- 
The truth is rarely pure, and never simple.

 - Oscar Wilde

                                                     Please reply to the
list;
                                                           please don't CC
me.


