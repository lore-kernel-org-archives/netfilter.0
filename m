From: DEMAINE Benoit-Pierre <benoit@demaine.info>
Subject: Re: ebtables to perform MAC NAT ?
Date: Tue, 22 Jul 2008 18:01:07 +0200
Message-ID: <48860443.1040108@demaine.info>
References: <4884282D.80804@demaine.info> <1634.193.44.5.60.1216715131.squirrel@mh.linnea.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1634.193.44.5.60.1216715131.squirrel@mh.linnea.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Oscar N wrote:
> Hi!
> 
> I looked into "MAC NAT" 1-2 years ago and actually got it to work, but it
> included some nasty changes to how linux process arp. I therefor solved
> the problem I had another way. The feature is still on the todolist on
> ebtables: http://ebtables.sourceforge.net/documentation.html#todo
> 
> Anyway, this is some notes I had from back then if it's useful for someone:
> 
> There are at least 4 scenarios that need to work.
> DNAT and SNAT are referring to NAT done in ebtables.

*at least* ... as example, you forgpt the case where 1.1.1.2 wants to 
talk with 1.1.1.3 (case where broadcast is sent everywhere for 
discovery, unless ... )

But, you rougly understood how complex my problem is, from ARP point of 
view. I will have a look at your website.

***

after installing parprouted on Debian, from man parprouted:

> DESCRIPTION
>        parprouted is a daemon for transparent IP (Layer 3) proxy ARP bridging.
>        Unlike standard bridging, proxy ARP bridging allows to bridge Ethernet
>        networks behind wireless nodes. Normal L2 bridging does not work
>        between wireless nodes because wireless does not know about MAC
>        addresses used in the wired Ethernet networks. Also this daemon is use
>        ful for making transparent firewalls.

says long about my problem :)

-- 
  >o_/ DEMAINE Benoit-Pierre (aka DoubleHP) http://benoit.demaine.info/
If computing were an exact science, IT engineers would not have work \_o<

"So all that's left, Is the proof that love's not only blind but deaf."
(FAKE TALES OF SAN FRANCISCO, Arctic Monkeys)
