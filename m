From: Anssi Hannula <anssi.hannula@gmail.com>
Subject: Re: Messages in log with SNAT target
Date: Thu, 27 Jul 2006 22:46:15 +0300
Message-ID: <44C91807.6030500@gmail.com>
References: <44C4903B.3080004@gmail.com> <44C49FC6.6030504@plouf.fr.eu.org>
	<44C4A904.4010403@gmail.com>
	<02BB8A4AC86C564C89C7F14CF98CE0C40127D9@knowledge.wizdom.nu>
	<44C4B69E.9040302@gmail.com>
	<Pine.LNX.4.64.0607252038520.10006@darkstar.sysinfo.com>
	<44C724D3.2090602@gmail.com>
	<02BB8A4AC86C564C89C7F14CF98CE0C40127E0@knowledge.wizdom.nu>
	<44C75021.9070204@gmail.com>
	<02BB8A4AC86C564C89C7F14CF98CE0C40127E4@knowledge.wizdom.nu>
	<44C757F3.6060400@gmail.com>
	<Pine.LNX.4.64.0607271507410.16694@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64.0607271507410.16694@darkstar.sysinfo.com>
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
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: netfilter@lists.netfilter.org

R. DuFresne wrote:
> On Wed, 26 Jul 2006, Anssi Hannula wrote:
> 
>>> Sietse van Zanen wrote:
>>>
>>>> The important issue you have is not WHAT somebody can hack. It's what
>>>> somebody can DO and ACCESS, WHEN you've been hacked.
>>>>
>>>> If somebody does manage to take over one of your systems, he most
>>>> certainly gains access to ALL to systems on the same physical
>>>> (sub)network. As ALL your systems are on the same net, draw the
>>>> conclusion.
>>>>
>>>> Combine that conclusion with the innate vulnerability of WiFi
>>>> networks and do the math. It's unwise to use your set up. period.
>>>> It's not for nothing that reccomendations always talk about shielding
>>>> your WiFi with a firewall. Now for personal use, it might be
>>>> acceptable to do otherwise, but that's up to you, as always the
>>>> choice is between security and convenience.
>>>
>>>
>>> Thanks for your reply. Unfortunately, you do not seem to offer any
>>> alternative to my current setup.
> 
> Actually he did offer an alternative, though you had to read carefully
> his answer;  go with a wired set of networks, both distinct from one
> another.

Well, I can't go with wired network, especially with the laptop. I
consider WLAN with a proper WPA encryption to be sufficiently secure for
my purposes.

> Firewall those networks, adding further isolation from eachother and
> from the publc internet at large.

But if these are two distinct networks (the first one being connected to
internet and the workstations, the second one connected to workstations
only), what do you mean by "firewalling" them?

There cannot be any blocking of traffic on the first network, as the
whole purpose of the network is to allow connections from the internet.

The second network contains only internal traffic, and blocking any of
that would result in trouble only.

People, thanks for your concern over my network security, but I don't
really think I can achieve much better security by rewiring my network
differently. The biggest security problem I have is the possibility of
vulnerabilities in the server software, and if such a vulnerability gets
exploited, no firewall will help me then. I have to just make sure that
doesn't happen.

-- 
Anssi Hannula


