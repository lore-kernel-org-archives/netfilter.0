From: "John Guntenaar" <john@guntenaar.nl>
Subject: RE: per user IP adresses
Date: Mon, 5 May 2003 10:30:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000401c312e0$8bf85d70$0200a8c0@WKSJOHN>
References: <01CEA3A5B8B2D511890F0002A5870AEC0128AD85@EXCHANGE>
Reply-To: <john@guntenaar.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <01CEA3A5B8B2D511890F0002A5870AEC0128AD85@EXCHANGE>
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
To: 'Khanh Tran' <khanh@slc.edu>
Cc: netfilter@lists.netfilter.org

That won't work either because the IP's are aliased, so the all have the
same MAC address.

I just want that userid 1234 can't use IP 1.2.3.4 BUT userid 1235 CAN
use that IP to bind for things like IRC sessions (for like a vhost or
something).

-----Oorspronkelijk bericht-----
Van: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] Namens Khanh Tran
Verzonden: maandag 5 mei 2003 2:10
Aan: john@guntenaar.nl
CC: netfilter@lists.netfilter.org
Onderwerp: RE: per user IP adresses

I think what you want to do is continue to use your rule that drops all
IRC
packets, but then add a rule that will -m --mac yo:ur:ma:ca:dd:re:ss and
-j
ACCEPT for IRC ports.  Remember to put the match rule for your MAC
address
after the drop rule since the rules are processed in order!


Khanh Tran
Network Operations
Sarah Lawrence College

-----Original Message-----
From: John Guntenaar [mailto:john@guntenaar.nl]
Sent: Sunday, May 04, 2003 3:19 PM
To: netfilter@lists.netfilter.org
Subject: RE: per user IP adresses


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









