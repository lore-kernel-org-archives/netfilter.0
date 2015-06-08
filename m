From: alvin <alvin.sm@Mail.Linux-Consulting.com>
Subject: Re: iptables based appliances - ipset
Date: Mon, 8 Jun 2015 07:02:12 -0700 (PDT)
Message-ID: <201506081402.t58E2CrZ021258@Mail.Linux-Consulting.com>
References: <20150607155120.43e0eab8@playground>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20150607155120.43e0eab8@playground>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Cc: netfilter@vger.kernel.org, alvin <alvin.sm@Mail.Linux-Consulting.com>


hi neal

> On Sun, 7 Jun 2015 08:04:40 -0700 (PDT)
....
> > even if the src IP# might be spoof'd, you, i still do NOT want those
> > incoming DDoS attacks coming in at 1,000 or 10,000 packets per second
> 
> Yes, 1000 rules is a little overboard.

and if there's 10,000 iptables rules, it's galacticly overboard ?

	- it was also a test to see if iptables would fail
	and it didnt seem to break iptables

> Have you tried ipset? Last I knew, it becomes more efficient than
> individual rules when there are more than 16 IPs to check.

ipset is on the todo list ... but since most of the heavy DDoS attackers,
5,000 or ddos packets per hour, that i see are using just 1 ip# out of 
thier class-C, i thought ipset might not work as good since there's
no "classC" to tarpit ... 

i'd assume the script kiddies are the ones using the zombie hosts at 
*.11 *.12 *.13 *.14 doing silly things like portscans

my other iptables todo would be to AutoExpire the DDoS attackers 
to minimize the list of active ddos attackers  ... manually deleting
the attackers that went away is for the birds :-)

	iptables -N AutoExpire
	iptables -p tcp -A AutoExpire attacker0001
	iptables -p tcp -A AutoExpire attacker0002
	iptables -p tcp -A AutoExpire attacker0003
	iptables -p tcp -A AutoExpire attacker2000	# 2,000 ddos attackers
	...
	# tarpit if still attacking within 24hrs
	iptables -p tcp ... -m recent --name AutoExpire --rcheck --seconds 86400  -j TARPIT
	iptables -p tcp ... -m recent --name AutoExpire --remove
	iptables -p tcp ... -m recent --name AutoExpire --set  -j TARPIT 

one day, i will need to sit down figure out the --remove syntax 
for 5,000 DDoS attackers

thanx
alvin
IPtables-BlackList.net
