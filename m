From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Iptables and gateway help me! Please ...
Date: Tue, 26 Oct 2004 05:56:14 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200410260556.14819.Alistair@nerdnet.ca>
References: <20041025045209.85167.qmail@web54204.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041025045209.85167.qmail@web54204.mail.yahoo.com>
Content-Disposition: inline
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
Cc: Nguyen Dinh Tuan <dinhtuan39@yahoo.com>

On October 25, 2004 12:52 am, Nguyen Dinh Tuan wrote:
> Hi!
>
> I am Nguyen dinh tuan, live in VietNam, an administrator beginer. I had
> found some information of iptables on website
> http://www.linuxguruz.com/iptables/ but i cannot find information, i need.
> Please help me
>
> my problem is, i have a dial server run in dial on demand mode, used wvdial
> and pppd. The dial server have 2 network interface: eth0 and ppp0. If one
> PC of LAN connect to the dial-server (through eth0 as gateway) the
> dial-server dial up to ISP automaticlly. I donot know what happenning with
> ppp0 and eth0. I can't control my dial-server. . Pls help me solve


	Unfortunately your issue is not very clear to those of us reading the list.

	What is it about your dial-server that you wish to control?  By default, if a 
client connected from your 'lan' you would normally want to connect to the 
internet (your isp). 
	How do you expect iptables to assist in controlling this?  Normally this 
would be the responsibility of the pppd configuration and wvdial ...

	I suspect that what you are looking for is some way to manage your firewall 
given that you dial up a connection each time your clients connect, and this 
results in you having differing IP addresses on ppp0 constantly, and possibly 
differing IP addresses to handle on eth0.  For information regarding this we 
need to know more about what you want.  

	A clue about what distribution, and kernel version and iptables versions 
wouldn't hurt the list either.

	Good luck

	Alistair Tonner 
>
>
>
>
> ---------------------------------
> Do you Yahoo!?
> vote.yahoo.com - Register online to vote today!

