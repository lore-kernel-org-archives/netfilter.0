From: Luke Deryckx <luke@westaironline.com>
Subject: Re: Multiple PPTP clients behind iptables.
Date: Sat, 10 Apr 2004 10:40:48 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BC9D7FB0.6FB9%luke@westaironline.com>
References: <GHEILNONPACCGBGKBEKKOEBKCFAA.mani@manikandan.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <GHEILNONPACCGBGKBEKKOEBKCFAA.mani@manikandan.org>
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
To: manikandan@manikandan.org, Manikandan <mani@manikandan.org>, Netfilter list <netfilter@lists.netfilter.org>

It looks like your trying to patch the out of the box Redhat 9 kernel
correct? You'll need to upgrade to a newer kernel to apply this patch. I
have successfully applied it to both 2.4.22 and 2.4.25 kernels.


Luke


On 4/9/04 10:18 PM, "Manikandan" <mani@manikandan.org> wrote:

> When I try to apply the patch, using netfilter CVS I am getting an error
> like
> 
> Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] y
> Testing patch submitted/03_2.4.21.patch...
> Failed to patch copy of /usr/src/linux-2.4.20-8/
> TEST FAILED: patch NOT applied.
> 
> [Press enter to continue]
> What could be wrong?
> Regards,
> Manikandan
> -----Original Message-----
> From:    Luke Deryckx [mailto:luke@westaironline.com]
> Sent:    Friday, April 09, 2004 9:38 PM
> To:    manikandan@manikandan.org
> Cc:    Netfilter list
> Subject:    Re: Multiple PPTP clients behind iptables.
> 
> This patch worked very nicely for me as well. Keep in mind you also need to
> recompile iptables after you've patched your kernel.
> Cheers
> 
> 
> 
> On 4/9/04 8:55 AM, "Alexis" <alexis@tpys.com.ar> wrote:
>> yes, you need the pptp patch
>> 
>> ive been in the same situation, and applying the patch made it work just
>> fine.-
>> 
>> see
>> 
> http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-5.h
> tm
>> l#ss5.6
>> 
>> ----- Original Message -----
>> From:    "Manikandan" <mani@manikandan.org>
>> To:    "Netfilter" <netfilter@lists.netfilter.org>
>> Sent:    Friday, April 09, 2004 12:08 PM
>> Subject:    Multiple PPTP clients behind iptables.
>> 
>> 
>>> Dear friends,
>>> 
>>> As I am getting more confused about VPN masq., request your help on
>>> this.
>>> 
>>> My local LAN is 10.35.0.0/24
>>> My Linux box running red hat linux 9.0 with kernel 2.4.20-8. acting as
> the
>>> gateway for my LAN to Internet.
>>> 
>>> I need to allow my LAN clients to access Microsoft windows VPN (Windows
>> 2000
>>> Adv. Server) using PPTP over Internet.
>>> I am not able to make more than one connection to the VPN server as my
> LAN
>>> outgoing traffic to Internet is getting SNAT to single public IP.
>>> 
>>> 
>>> I read few guides and howtos to configure my firewall to allow multiple
>> PPTP
>>> sessions. But still I couldn't get through.
>>> 
>>> Do I need to patch my kernel? What support do I need to enable this
>> multiple
>>> PPTP traffic.
>>> 
>>> Request your views and help on this.
>>> 
>>> 
>>> Have a nice day
>>> 
>>> Regards,
>>> Manikandan.
>>> 
>>> 
>>> 
>>> 
>>> 
>>> 
>>> 
>>> 
>> 
> 
> 
> 


