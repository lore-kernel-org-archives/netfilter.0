From: "Bret Holbrook" <bholbrook@michiganfamilyresources.org>
Subject: Re: CnC General and ipitables woes. Need HELP PLS!
Date: Thu, 17 Apr 2003 09:45:17 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <se9e77b9.047@michiganfamilyresources.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: "nf", netfilter@lists.netfilter.org, , , "SBlaze", dagent.geo@yahoo.com, , 

I also had the same issue with CnC and there is an .ini file with a port
over-ride in it, but adjusting it produced no successful result.  I am
also struggling with NWN.  After putting all the appropriate prerouting
commands in as you did with all the ports they suggest, it still does
not work.  There have been many other games I've struggled with also.  I
have actually only been able to get a fraction of them working.  It
seems by the time I get the rules working and am done scouring the
internet for help, we are playing a different game :).  I am considering
just plugging my dedicated linux server into the internet, setting up
basic masq for my internal pc's to surf, burning an image of the HD, and
leaving it wide open to attack from the internet.  If some kid wants to
run a newsgroup server off it, fine, as long as I can play my video
games with my buddies in college.  Setting up basic Iptables was no
sweat, this more advanced routing for video games and such is extremely
complex to the un-learned.

>>> "Sascha Reissner" <sascha.reissner@toxicnet.de> 04/16/03 10:53PM
>>>
From: "SBlaze" <dagent.geo@yahoo.com>

[...]

> So my question is... is some sort of con. tracking mod needed? Anyone
know
> anything about this problem? Thanks for your time and help anyone

[...]

Those kind of games tend to include the IP address of the "gaming"
machine
withing the payload of their datapackets.

As i don't know that game i can just tell you that you might want to
take a
look into .ini files or parameters for the game to override that
behaviour.

Some games allow players via parameter to set a different ip that will
get
included into the data payload.

Greets,
Sascha




