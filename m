From: Mike <1100100@gmail.com>
Subject: Re: Port 21, 23, and 80 are open according to Shields Up at grc.com
Date: Mon, 13 Sep 2004 11:18:12 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <8ca4228204091308186fc50d59@mail.gmail.com>
References: <200409111150.50506.bulliver@badcomputer.no-ip.com>
	<8ca42282040911160952abec3b@mail.gmail.com>
	<1095079786.1899.8.camel@wolfpack.ljm.dom>
Reply-To: Mike <1100100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095079786.1899.8.camel@wolfpack.ljm.dom>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

Hi J,

Thanks for the guidance.
There's definitely no DNATing/PREROUTING currently set up in the
iptables firewall.  So, I guess the only thing that could explain port
21 and/or 23 is there must be an ftp daemon using those ports.

As for port 80, I wonder if it's got anything to do with Apache
running the intranet webserver inside the LAN.  I don't believe I've
got apache even installed on the routerbox.

Well, enough guessing.  I'll try some netstat research and see what
percolates to the surface.

Best regards.

Mike


On Mon, 13 Sep 2004 08:53:07 -0400, Jason Opperisano <opie@817west.com> wrote:
> 
> you need to keep in mind that if your netfilter box is performing
> MASQ/SNAT for your LAN machines--the IP being scanned by grc.com is the
> public IP of the netfilter box.
> 
> unless your doing some DNATs to machines on your LAN--you should focus
> your efforts on the netfilter machine itself.
> 
> "netstat -lntu" would be a good place to start.
> 
> i've always questioned the output of web-based scanners like grc.com;
> however, i just went to grc.com and tried it out, and achieved a
> *perfect* "TruStealth" rating...which must mean i'm super l33t like
> stevie...  :-P
> 
> -j
> 
> --
> Jason Opperisano <opie@817west.com>
> 
>

