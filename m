From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Yet another FTP connection problem
Date: Thu, 6 Jun 2002 19:51:54 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206061852.g56Iq2A30805@Networker.rockstone.co.uk>
References: <200206061650.g56GoQA32044@vulcan.rissington.net> <381103237.1023392855@[192.168.13.4]>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <381103237.1023392855@[192.168.13.4]>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Thursday 06 June 2002 6:47 pm, Erik Pagel wrote:

> Hi Antony,
>
> sorry I must apologise again, but I didn't send all my rules, just the ftp
> part.

It's always good to post your complete ruleset, just in case you've got 
something in a rule you don't think is important, which is causing all the 
troubles...

> Of course my standard policy is deny,

Good :-)

> also I manage my own DNS Server.

Okay - you still need to makesure your firewall can talk to it, and I guess 
you already have the rules to allow port 53 through the firewall for external 
lookups.

> NAT is also installed and working.

Okay.   I saw you didn't have it and wasn't sure if that was because you 
didn't need it (internal clients on routable addresses) or because you 
already had it working, or because you'd forgotten it (we get all sorts of 
questions on this mailing list).

> The only part not working are the ftp
> ruleset.
>
> ># allow ftp control connections outbound
> > iptables -A OUTPUT -p tcp --dport 21 -j ACCEPT
>
> Why only port 21 and not also port 20 (DATA Channel).

Because the first outbound connection from the client to the server will 
always be a control connection, and then replies for both control and data 
will be handled as in the ESTABLISHED,RELATED state match.

> ># allow replies back from ftp servers
> > iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> Ok, but I want to restrict the portrange to source port 20 and 21.

Why ?   Where else are you going to get ESTABLISHED or RELATED packets from 
except in reply to something you've decided to allow out in the first place ?

> Anyway my last ruleset has a line like this but I want to get ride of it.

Maybe you should post the complete ruleset and see if someone can see why ftp 
wouldn't work if everything else does.

> > iptables -A POSTROUTING -t nat -o $EXT_IF -j SNAT --to $EXT_IP
>
> I use this rule
> iptables -t nat -A POSTROUTING -o $I_EXTERN -j MASQUERADE

If you have a dynamic address on your external interface, your rule is 
correct.   It will still work even if you have a static address, but is 
considered slightly less efficient for netfilter than specifiying SNAT and 
the address.   Either way, I don't think you'll notice a difference.

> > Let us know how you get on with those.
>
> sorry, not until now.

So did you try them ?   Do they work ?


Antony.

