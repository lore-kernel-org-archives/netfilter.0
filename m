From: Jason Opperisano <opie@817west.com>
Subject: Re: Port 21, 23, and 80 are open according to Shields Up at grc.com
Date: Mon, 13 Sep 2004 08:53:07 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095079786.1899.8.camel@wolfpack.ljm.dom>
References: <200409111150.50506.bulliver@badcomputer.no-ip.com>
	<8ca42282040911160952abec3b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8ca42282040911160952abec3b@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

On Sat, 2004-09-11 at 19:09, Mike wrote:
> Hi Group:
> 
> I've tested for open ports from all the LAN clients behind my linux
> box router/gateway/firewall and all of them come up with the same
> results: port 21, 23, and 80 are open according to the results of the
> Steve Gibson Shields Up test.
> 
> I can't figure out how this can be happening.
> I've run a full nmap -P0 (that's a zero) on all my local ip addresses
> - 192.168.169.*

you need to keep in mind that if your netfilter box is performing
MASQ/SNAT for your LAN machines--the IP being scanned by grc.com is the
public IP of the netfilter box.

unless your doing some DNATs to machines on your LAN--you should focus
your efforts on the netfilter machine itself.

"netstat -lntu" would be a good place to start.

i've always questioned the output of web-based scanners like grc.com;
however, i just went to grc.com and tried it out, and achieved a
*perfect* "TruStealth" rating...which must mean i'm super l33t like
stevie...  :-P

-j

-- 
Jason Opperisano <opie@817west.com>


