From: "Manikandan" <mani@manikandan.org>
Subject: RE: Multiple PPTP clients behind iptables.
Date: Sun, 25 Apr 2004 18:41:43 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GHEILNONPACCGBGKBEKKOEGNCFAA.mani@manikandan.org>
References: <BC9C1881.6F2F%luke@westaironline.com>
Reply-To: <manikandan@manikandan.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BC9C1881.6F2F%luke@westaironline.com>
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
To: Netfilter list <netfilter@lists.netfilter.org>
Cc: Luke Deryckx <luke@westaironline.com>, rob@sterenborg.info


Somehow I managed to patch my kernel with pptp patch. But everytime when I
load modules like ip_conntrack_pptp, ip_nat_pptp, I am getting an error like
"ip_conntrack_pptp.c: bad csum" in the log file.

Also the pptp connections are not stable. The pptp sessions are getting
disconnected very often say every 2 mins.

Kernel = 2.4.20-30.9 and iptables version 1.2.9 .

Please help.

Regards,
Manikandan.

 -----Original Message-----
From: 	Luke Deryckx [mailto:luke@westaironline.com]
Sent:	Friday, April 09, 2004 9:38 PM
To:	manikandan@manikandan.org
Cc:	Netfilter list
Subject:	Re: Multiple PPTP clients behind iptables.

This patch worked very nicely for me as well. Keep in mind you also need to
recompile iptables after you've patched your kernel.

Cheers




On 4/9/04 8:55 AM, "Alexis" <alexis@tpys.com.ar> wrote:

> yes, you need the pptp patch
>
> ive been in the same situation, and applying the patch made it work just
> fine.-
>
> see
>
http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-5.h
tm
> l#ss5.6
>
> ----- Original Message -----
> From: "Manikandan" <mani@manikandan.org>
> To: "Netfilter" <netfilter@lists.netfilter.org>
> Sent: Friday, April 09, 2004 12:08 PM
> Subject: Multiple PPTP clients behind iptables.
>
>
>> Dear friends,
>>
>> As I am getting more confused about VPN masq., request your help on
>> this.
>>
>> My local LAN is 10.35.0.0/24
>> My Linux box running red hat linux 9.0 with kernel 2.4.20-8. acting as
the
>> gateway for my LAN to Internet.
>>
>> I need to allow my LAN clients to access Microsoft windows VPN (Windows
> 2000
>> Adv. Server) using PPTP over Internet.
>> I am not able to make more than one connection to the VPN server as my
LAN
>> outgoing traffic to Internet is getting SNAT to single public IP.
>>
>>
>> I read few guides and howtos to configure my firewall to allow multiple
> PPTP
>> sessions. But still I couldn't get through.
>>
>> Do I need to patch my kernel? What support do I need to enable this
> multiple
>> PPTP traffic.
>>
>> Request your views and help on this.
>>
>>
>> Have a nice day
>>
>> Regards,
>> Manikandan.
>>
>>
>>
>>
>>
>>
>>
>>
>




