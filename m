From: Jason Opperisano <opie@817west.com>
Subject: Re: FTP Forwarding
Date: Tue, 18 Jan 2005 11:40:39 -0500
Message-ID: <1106066439.3725.2.camel@hubcap.ljm.dom>
References: <20041228171949.35308.qmail@web53109.mail.yahoo.com>
	<1104255053.7318.28.camel@hubcap.ljm.dom>
	<001301c4fa17$03de2b20$0200a8c0@etpi>
	<1105712624.3661.19.camel@hubcap.ljm.dom>
	<000701c4fc66$9a3d7840$0200a8c0@etpi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000701c4fc66$9a3d7840$0200a8c0@etpi>
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

On Mon, 2005-01-17 at 02:31, TestMail wrote:
> I'm sorry but i think this rule will not be the solution to my problem cause
> my ftp server is inside my internal network and automatically my gateway
> will "only" be the source from the -s $PublicIPAdd Forward rule parameter...
> i think???

either you or i misunderstands what $PublicIPAdd stands for.

> Below is my schematic on how i want it to be ..
>     1. only 202...1 ip address in my branch office should be allowed to use
> my ftp server in my head office
> 
>         so incoming ftp request should be filtered and only 202....1 ip
> address that is coming from my branch office should be allowed.
> 
> | Branch | eth0 202. .1       < external
>        |
>        |
> | WAN  |
>        |
>        |
> |gateway:firewall:FCore2|  eth0 192.168...  < internal <<<<<<
>        |                                 eth1 202........    <external
>        |
>        |
> |Ftp Server:FCore2| eth0 192.168.0.5 < Internal

now that you've provided some more details:

iptables -A FORWARD -i eth1 -o eth0 -p tcp --syn \
  -s 202.x.x.1 -d 192.168.0.5 --dport 21 -j ACCEPT

-j

--
"To alcohol: the cause of, and solution to, all of life's problems."
	--The Simpsons


