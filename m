From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Microsoft VPN and iptables
Date: Sat, 9 Nov 2002 13:32:44 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021109133247.IWMO20191.mta03-svc.ntlworld.com@there>
References: <1653.10.254.2.5.1036822899.squirrel@www.nobarrier.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1653.10.254.2.5.1036822899.squirrel@www.nobarrier.co.za>
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
To: netfilter@lists.netfilter.org

On Saturday 09 November 2002 6:21 am, Jonathan wrote:

> Hi all
>
> Could some help me with this or point me in the right direction.
>
> I have a few microsoft machine in side my linux firewall and I need to use
> microsoft VPN to connect to a microsoft machine on the internet
> when I double click on the icon is says " Connecting to ???.???.???.???"
> and then says "Verifing Usernamd & Password" and then times out. If I dial
> into the net and bypass the firewall I can connect.

Are you using NAT, and is the VPN system using PPTP (I think this is common 
with M$ things...) ?

If the answer to both of these is yes, then I think you need to investigate 
the PPTP connection tracking module patch for netfilter, because otherwise 
this protocol gets upset by the address translation.

Sorry to be a bit vague about this, but I don't use PPTP or M$ VPNs - I am 
simply reporting on stuff I have seen on this mailing list in the past from 
other people apparently trying to do the same thing.

If anyone knows that M$ VPNs can be made to work without doing this, please 
jump in and help...

Antony.

-- 

Normal people think "if it ain't broke, don't fix it".
Engineers think "if it ain't broke, it doesn't have enough features yet".

