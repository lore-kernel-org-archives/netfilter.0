From: Mike <1100100@gmail.com>
Subject: Re: Port 21, 23, and 80 are open according to Shields Up at grc.com
Date: Mon, 13 Sep 2004 11:39:13 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <8ca4228204091308394b0fbc3e@mail.gmail.com>
References: <C8DE82BEF24D0146862937D2A9DD0E92254489@qlmail2.qlogitek.com>
Reply-To: Mike <1100100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <C8DE82BEF24D0146862937D2A9DD0E92254489@qlmail2.qlogitek.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Miguel Laborde <miguel.laborde@qlogitek.com>
Cc: netfilter@lists.netfilter.org

I like that too. Will do.
Thanks Miguel.

Best regards.

Mike


On Mon, 13 Sep 2004 11:21:13 -0400, Miguel Laborde
<miguel.laborde@qlogitek.com> wrote:
> Something else you can try is using the lsof command.
> 
> Give lsof -i tcp:21 a try and see what it returns. If you have something running on that port it will tell you its name and PID.
> 
> Regards,
> 
>         Miguel
> 
> 
> 
> 
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Mike
> Sent: Monday, September 13, 2004 11:18 AM
> To: Jason Opperisano
> Cc: netfilter@lists.netfilter.org
> Subject: Re: Port 21, 23, and 80 are open according to Shields Up at
> grc.com
> 
> Hi J,
> 
> Thanks for the guidance.
> There's definitely no DNATing/PREROUTING currently set up in the
> iptables firewall.  So, I guess the only thing that could explain port
> 21 and/or 23 is there must be an ftp daemon using those ports.
> 
> As for port 80, I wonder if it's got anything to do with Apache
> running the intranet webserver inside the LAN.  I don't believe I've
> got apache even installed on the routerbox.
> 
> Well, enough guessing.  I'll try some netstat research and see what
> percolates to the surface.
> 
> Best regards.
> 
> Mike
> 
> On Mon, 13 Sep 2004 08:53:07 -0400, Jason Opperisano <opie@817west.com> wrote:
> >
> > you need to keep in mind that if your netfilter box is performing
> > MASQ/SNAT for your LAN machines--the IP being scanned by grc.com is the
> > public IP of the netfilter box.
> >
> > unless your doing some DNATs to machines on your LAN--you should focus
> > your efforts on the netfilter machine itself.
> >
> > "netstat -lntu" would be a good place to start.
> >
> > i've always questioned the output of web-based scanners like grc.com;
> > however, i just went to grc.com and tried it out, and achieved a
> > *perfect* "TruStealth" rating...which must mean i'm super l33t like
> > stevie...  :-P
> >
> > -j
> >
> > --
> > Jason Opperisano <opie@817west.com>
> >
> >
> 
>

