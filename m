From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: Loose Packets
Date: Fri, 31 May 2002 01:11:26 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020531011126.L27307@funkyjesus.org>
References: <002301c207df$9486aa30$1700a8c0@asm.org.uk>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <002301c207df$9486aa30$1700a8c0@asm.org.uk>; from starkeyr@asm.org.uk on Thu, May 30, 2002 at 02:40:36PM +0100
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

On Thu, May 30, 2002 at 02:40:36PM +0100, Ross Starkey wrote:

> I have recently built a firewall for my home office. All seems well, it's
> fairly secure. One problem though, every time my Windows client sends a
> packet destined for my Linux box that is not destined for the Internet
> (say for example when I use PUTTY over SSH) PPPD dials up. I am pretty
> sure I need to set up a firewall rule to stop this, but I have tried
> several iptables rules all to no avail.

I'd guess that your Linux box is checking the DNS entries related to the
connecting host, and the DNS servers its trying to contact are out on the
Internet.

Not sure how you solve this, depends on the exact details of your setup.

-- 
FunkyJesus System Administration Team


