From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Using interface name as a command line option to create a iptables
 rule
Date: Wed, 22 Jun 2011 09:30:27 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106220928140.19508@frira.zrqbmnf.qr>
References: <BANLkTi=A5NWc3YR2fZk7Q6tw-xJ_BAz2Ug@mail.gmail.com> <alpine.LNX.2.01.1106201359080.12967@frira.zrqbmnf.qr> <BANLkTiksEDRhm2RbTfVFJUHcQqC4bLmyHg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTiksEDRhm2RbTfVFJUHcQqC4bLmyHg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adishesh M <adisheshsm@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2011-06-22 06:25, Adishesh M wrote:
>
>> The two sets certainly can be different (mathematically), so choose
>> wisely. Especially since addresses can occur on any interface.
>
>Currently we are not using DHCP to get IP addresses.

This has nothing to do with DHCP. Any malicious host on a particular 
subnet can emit packets with any desired source address.

>we wanted to know the difference between option 1 and option 2 (
>mentioned in the first mail of this mail chain) with respect to
>security of the system.

As I said before, this entirely depends on the ruleset. Block wide, 
accept sparingly. Combining -i with -s is obviously a narrower 
expression than just -s.
