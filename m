From: "Emre CELEB&#304;" <emre22@europe.com>
Subject: Re: secure remote management
Date: Sat, 24 Jan 2004 19:02:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040124170246.20948.qmail@mail.com>
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
To: netfilter@lists.netfilter.org


 
> 	Where I've used webmin in the past, I've changed the port that
> 	it listens on, and filtered access to that port to a specific list of ips.
> 	Given some configuration, it can be relatively secure.  
> 	Question -- you don't want to do X11 forwarded sessions because? .. 
> 	at a guess the users want to be able to see the rules from a winders 
> 	box downstream from the firewall?  -- at that point I can ses why ..
> 	webmin is a bit of overkill for this, but is granular enough that you
> 	can let your clients review the firewall rules and not allow them to 
> 	muck with them too much.
> 	
> 	There is a java project you might look at: http://sourceforge.net/projects/jwall
> 	but I've never used it -- I do know one person who has and finds it useful,
> 	how useful it would be for you I don't know.
> 
> 	Alistair
> 
Yeah, yur right cause users want to see the rules and logs in a windows enviroment, i also offered the Cygwin installation for ssh-X tunneling but oofff they are the bosses man they love IE!!. its easy for logs with php#mysql and using log analyzer and get custom reports but when it comes to rules im really scared. Also i tried JWall but it seems still pre-mature as i tested some rule genarating operations and it unfortunely produces wrong scripts for iptables (will contack the developer for this,) but i admire that jwall as it aims to be able to manage remotely IDS and firewall in a secure GUI env. cool for ones like me who tries to satisfy the unsatisfied MS users and also can scripting to check that gui outputs.

Emre.




-- 
_______________________________________________
Get your free email from http://www.mail.com


