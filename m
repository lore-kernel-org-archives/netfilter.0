From: Gianni Pucciani <gp.puccio@tin.it>
Subject: Re: vpn under linux
Date: Sat, 10 Apr 2004 11:41:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4077C15E.9080701@tin.it>
References: <4077B7EF.5070805@tin.it> <200404101018.38664.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404101018.38664.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter <netfilter@lists.netfilter.org>

Hi,
I forget one things, waht about the CIPE solution. I read that in the 
rh9 sec guide about VPN.

And then, I see this  news:  the FreeS/WAN project is no longer in 
active development, it could be a problem?

thanks

Antony Stone wrote:

>On Saturday 10 April 2004 10:01 am, Gianni Pucciani wrote:
>
>  
>
>>Hi all,
>>some of you can give me some input about the best way to set up a vpn
>>under two Linux RH9 systems?
>>I heared there are different solution (PPP and SSH, PPTP...) and I'd
>>like to know your opinion about that.
>>    
>>
>
>PPP is Point-to-Point Protocol, and has almost nothing to do with VPNs :)
>
>SSH is Secure Shell, and at least it contains some encryption, but again, is 
>almost nothing to do with VPNs (but more on that later).
>
>PPTP is Pretty Poor Tunneling Protocol (oh, no, sorry, it's a Point to Point 
>Tunneling Protocol...), and is the way Microsoft systems do VPN.
>
>The "standard" way to do VPN (in other words, the method which is supported by 
>most vendors, uses open standards, and also has the best security) is IPsec.
>
>The usual way to do IPsec under Linux is to use FreeS/WAN under kernel 2.4, or 
>the built-in IPsec under kernel 2.6.
>
>I use FreeS/WAN, I like it, it works well with netfilter (once you've got used 
>to the path the packets take at each end), and I'm happy with its 3DES/RSA 
>security.
>
>I said I'd mention more about SSH - that also uses good encryption and is 
>therefore secure, and once you have an SSH connection between two machines, 
>you can "tunnel" almost any network traffic you like between them, and it 
>does work, although I wouldn't select this as a first choice for a VPN 
>because there's a lot more manual setting up involved.   IPsec is more like a 
>network route - you just configure it, and let the two endpoint machines get 
>on with negotiating the link, and then computers from whichever network 
>ranges you've configured the VPN to support can connect to each other 
>transparently through a nice secure tunnel across the Internet.
>
>Hope this helps,
>
>Regards,
>
>Antony.
>
>  
>


