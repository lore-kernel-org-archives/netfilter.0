From: Gianni Pucciani <gp.puccio@tin.it>
Subject: Re: vpn under linux
Date: Sat, 10 Apr 2004 12:15:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4077C92F.9040501@tin.it>
References: <4077B7EF.5070805@tin.it> <200404101018.38664.Antony@Soft-Solutions.co.uk> <4077C15E.9080701@tin.it> <200404101100.25648.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404101100.25648.Antony@Soft-Solutions.co.uk>
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

Ok, I see.
Well, thank you very much for giving me such information and for being 
so exhaustive.

regards

Gianni

Antony Stone wrote:

>On Saturday 10 April 2004 10:41 am, Gianni Pucciani wrote:
>
>  
>
>>Hi,
>>I forget one things, waht about the CIPE solution. I read that in the
>>rh9 sec guide about VPN.
>>    
>>
>
>Yes, I should have mentioned that.   It uses a different method for encrypting 
>the data than IPsec does (Blowfish instead of 3DES) and is therefore supposed 
>to be faster.   However in my experience you need to have a *big* pipe to the 
>outside world in order to be encrypting so much data down your VPN that a 
>basic CPU can't handle it.
>
>I've never used CIPE so can't comment on it in practice.
>
>I tend to use the standard which is supported by most other vendors for 
>cross-compatibility, therefore I like IPsec.
>
>  
>
>>And then, I see this  news:  the FreeS/WAN project is no longer in
>>active development, it could be a problem?
>>    
>>
>
>I don't regard it as a problem - I think people will continue to use the 
>latest version for setting up IPsec with Linux 2.4 kernels, and they'll 
>migrate to using the built-in IPsec for 2.6 kernels.
>
>The main reason that FreeS/WAN is no longer being developed is because 
>although it works well as a VPN, the team don't think they can achieve one of 
>their goals, which was Opportunistic Encryption (using DNS to hold public 
>keys so that routers could create VPN tunnels on their own when they wanted 
>to talk to each other, instead of being manually configured to set up 
>specific tunnels).
>
>In my opinion that doesn't stop it still being very useful as a way to 
>configure standard IPsec links.
>
>Regards,
>
>Antony.
>
>  
>


