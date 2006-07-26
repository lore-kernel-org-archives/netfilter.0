From: Anssi Hannula <anssi.hannula@gmail.com>
Subject: Re: Messages in log with SNAT target
Date: Wed, 26 Jul 2006 14:54:27 +0300
Message-ID: <44C757F3.6060400@gmail.com>
References: <44C4903B.3080004@gmail.com> <44C49FC6.6030504@plouf.fr.eu.org>
	<44C4A904.4010403@gmail.com>
	<02BB8A4AC86C564C89C7F14CF98CE0C40127D9@knowledge.wizdom.nu>
	<44C4B69E.9040302@gmail.com>
	<Pine.LNX.4.64.0607252038520.10006@darkstar.sysinfo.com>
	<44C724D3.2090602@gmail.com>
	<02BB8A4AC86C564C89C7F14CF98CE0C40127E0@knowledge.wizdom.nu>
	<44C75021.9070204@gmail.com>
	<02BB8A4AC86C564C89C7F14CF98CE0C40127E4@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <02BB8A4AC86C564C89C7F14CF98CE0C40127E4@knowledge.wizdom.nu>
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
To: Sietse van Zanen <sietse@wizdom.nu>
Cc: netfilter@lists.netfilter.org

Sietse van Zanen wrote:
> The important issue you have is not WHAT somebody can hack. It's what somebody can DO and ACCESS, WHEN you've been hacked.
>  
> If somebody does manage to take over one of your systems, he most certainly gains access to ALL to systems on the same physical (sub)network. As ALL your systems are on the same net, draw the conclusion.
>  
> Combine that conclusion with the innate vulnerability of WiFi networks and do the math. It's unwise to use your set up. period. It's not for nothing that reccomendations always talk about shielding your WiFi with a firewall. Now for personal use, it might be acceptable to do otherwise, but that's up to you, as always the choice is between security and convenience.

Thanks for your reply. Unfortunately, you do not seem to offer any
alternative to my current setup.

Do you suggest that having all the systems on the same physical network
is unwise? If yes, should I have multiple subnetworks for my *home
network*, that has only 3 hosts, of which I want public IP for 2-3 hosts.

You seem to suggest that one should shield the WLAN with a firewall.
Where would that firewall go? Between the WLAN and the only host that
doesn't usually need to have public access from the internet? But the
WLAN adapter is *in* the laptop, so that would have to be a software
firewall. But wait, what would we want to block? All incoming traffic?

It seems you don't know enough of my network, so here's the scheme:

ADSL modem, no natting.
WLAN access point connected to the ADSL modem, no natting.
Host 1 with private+public IP, needs to have public access from
internet, connected to WLAN AP via wireless.
Host 2 with private+public IP, needs to have public access from
internet, connected to ADSL modem via ethernet.
Host 3 with private IP only, connected to WLAN AP via wireless, routed
through Host 1.

If you have any suggestion to make this better, feel free to do so.


> ________________________________
> 
> From: Anssi Hannula [mailto:anssi.hannula@gmail.com]
> Sent: Wed 26-Jul-06 13:21
> To: Sietse van Zanen
> Cc: R. DuFresne; netfilter@lists.netfilter.org
> Subject: Re: Messages in log with SNAT target
> 
> 
> 
> Sietse van Zanen wrote:
> 
>>That, or put your WiFi in a DMZ behind a firewall, and have the firewall protect your private network.
>>
>>Making WiFi DMZ's is sort of standard practice.
>>
>>-sietse
> 
> 
> I don't really get it.
> 
> As far as I can see, there are currently two weak points in my network:
> 1. Someone could compromise one of the hosts remotely.
> 2. Someone could crack the WLAN encryption.
> 
> No matter what kind of firewalls or network schemes I deploy, neither of
> those points goes away.
> 
> 
> 
>>________________________________
>>
>>From: Anssi Hannula [mailto:anssi.hannula@gmail.com]
>>Sent: Wed 26-Jul-06 10:16
>>To: R. DuFresne
>>Cc: Sietse van Zanen; netfilter@lists.netfilter.org
>>Subject: Re: Messages in log with SNAT target
>>
>>
>>
>>R. DuFresne wrote:
>>
>>
>>>On Mon, 24 Jul 2006, Anssi Hannula wrote:
>>>
>>>
>>>
>>>>>Sietse van Zanen wrote:
>>>>>
>>>>>
>>>>>
>>>>>>The security risk is, and it is a MAJOR one, especially with WiFi
>>>>>>networks is that any PC on the network could just be set up with a
>>>>>>private IP on your private network, start sniffing for passwords etc.
>>>>>>
>>>>>>It's a very, very bad idea to put your public and private WiFi
>>>>>>infratructure on the same physical network.
>>>>>>I would say, there's even no point in firewalling this. Firewalling
>>>>>>is seperating, you are combining.
>>>>>>
>>>>>>-Sietse
>>>>>
>>>>>
>>>>>In this case the private network is only a very small home network. I
>>>>>don't see there being too big a risk of anyone setting up a box with
>>>>>private IP on the network with harm on their mind. If that would be
>>>>>possible, wouldn't the security of the whole system be compromised so
>>>>>much that the private/public separation doesn't matter anymore?
>>>>>
>>>>>The main purpose of the private IPs here is the ease of use and having
>>>>>no public IP for a system if so wanted.
>>>
>>>
>>>
>>>Hopefully, for yer sake, you are the only home for mile and miles
>>>around....Yet, I doubt such is the case, so you are a risk to all sadly.
>>>
>>
>>
>>So, what do you suggest, then?
>>
>>That I have 2 separate wireless networks, one for the internet and one
>>for the private network?
>>
>>(the WLAN is of course WPA encrypted)
>>
>>--
>>Anssi Hannula
>>
> 
> --
> Anssi Hannula
> 
> 


-- 
Anssi Hannula


