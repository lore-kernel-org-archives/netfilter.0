From: "John Guntenaar" <john@guntenaar.nl>
Subject: RE: per user IP adresses
Date: Sun, 4 May 2003 21:18:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000301c31272$057d8630$0200a8c0@WKSJOHN>
References: <200305042119.15316.pc-secure@home.nl>
Reply-To: <john@guntenaar.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200305042119.15316.pc-secure@home.nl>
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

I think you didn't understand my question,

Ofcourse I can just set open that IP address, but I only want it to be
open for my own user (so the other users CAN'T use the IP)

I think I need things like -m owner --owner-uid or something but I can't
figure out a good rule, I get errors on everything I try :(

John

-----Oorspronkelijk bericht-----
Van: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] Namens SaVaGE
Verzonden: zondag 4 mei 2003 21:19
Aan: netfilter@lists.netfilter.org
Onderwerp: Re: per user IP adresses

Op zondag 4 mei 2003 20:38, schreef John Guntenaar:
> Hello,
>
> I have a linux machine with 4 IP addresses, I have a couple of friends
> on that machine and I don't allow them to use IRC, so I simply blocked
> the IRC ports, but I want to use IRC from the 4th IP without the other
> users being able to use it. I think I can reach that goal by using the
> owner match facility of iptables, though I can't find any good
examples
> with google, is it correct and can somebody post an example?
>
> Thanks in advantage,
>
> John

this one is very easy , you can use the same rule , you used before ,
but now 
you say :     ..........     -s ! $4th_ip -j DROP


Pascal




