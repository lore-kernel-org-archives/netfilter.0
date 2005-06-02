From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: SSH Brute force attacks - Script version 1.0
Date: Thu, 02 Jun 2005 13:26:15 -0500
Message-ID: <429F4F47.8050301@riverviewtech.net>
References: <427B93EE.3030905@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <427B93EE.3030905@eccotours.dyndns.org>
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
To: iptables <netfilter@lists.netfilter.org>

There has been question on the list asking me to post a ""final (or most current) version of the SSH_Brute_Force script so I am doing just that.  I have included a version number in the subject line so it should be easier to identify in the future.

Below is the most recent script version that has been discussed on the NetFilter mail list.  I am going to call this version "NetFilter MailList SSH_Brute_Force Chain".

# NetFilter MailList SSH_Brute_Force Chain version 1.0.
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --name SSH --set --rsource -j SSH_Brute_Force
iptables -A SSH_Brute_Force -s $My_Home_Firewall_IP -j RETURN
iptables -A SSH_Brute_Force -s $My_Office_Firewall_IP -j RETURN
iptables -A SSH_Brute_Force -s $My_Girlfriends_Firewall_IP list -j RETURN
iptables -A SSH_Brute_Force -m recent ! --rcheck --seconds 60 --hitcount 3 --name SSH --rsource -j RETURN 
iptables -A SSH_Brute_Force -j LOG --log-prefix "SSH Brute Force Attempt:  "
iptables -A SSH_Brute_Force -p tcp -j TARPIT

Below is the version of this script that I tend to run on my firewall at home for various reasons which will be explained below.  I am going to call this version "Grant's personal SSH_Brute_Force Chain".

# Grant's personal SSH_Brute_Force Chain version 1.0.
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j SSH_Brute_Force
iptables -A SSH_Brute_Force -s $My_Home_Firewall_IP -j RETURN
iptables -A SSH_Brute_Force -s $My_Office_Firewall_IP -j RETURN
iptables -A SSH_Brute_Force -s $My_Girlfriends_Firewall_IP list -j RETURN
iptables -A SSH_Brute_Force -m recent --name SSH --set --rsource
iptables -A SSH_Brute_Force -m recent ! --rcheck --seconds 60 --hitcount 3 --name SSH --rsource -j RETURN 
iptables -A SSH_Brute_Force -j LOG --log-prefix "SSH Brute Force Attempt:  "
iptables -A SSH_Brute_Force -p tcp -j TARPIT

The reason that I tend to run my (Grant's) personal SSH_Brute_Force version of the script verses the "NetFilter MailList SSH_Brute_Force" version is that I want / like the ability to jump to the SSH_Brute_Force chain with out having to remember to add the "-m recent --name SSH --set --rsource" parameters to the rule that jumps to the SSH_Brute_Force chain.  IMHO this makes this chain easier to use in the future and easier to maintain as you don't have to remember to update multiple calling rules, just the one rule in the SSH_Brute_Force chain its self.

A note about the RETURN verses the ACCEPT targets.  The RETURN target is going to go back to the chain that jumped to the SSH_Brute_Force chain and continue processing from where it left off.  This method is great if you want to pass your traffic through more types of sanity checks / filters.  The RETURN target is what you will likely see used in more compelx firewall scripts.  On the other side of the coin is the ACCEPT target which will directly allow the traffic to pass through the firewall and on in to the server in question.  This is better for simple firewall scripts where you only want to proccess one filter, SSH_Brute_Force chain in this case, on the traffic.  The ACCEPT target is less likely to be seen in the more complex firewall scripts.

A note about the TARPIT verses the DROP targets.  The TARPIT target is a special target that will consume few resources to hold open the SSH connection and cause the sending / attacking system to spend system resources / time (delay) before it eventually force closes the connection on it's end.  The advantage of this is that you slow down the attacker and thus help make the internet ever so slightly more secure by delaying who the attacker can attack because the attacker is busy attacking you in a maner that does not harm you.  If you consider that the attacker can attack only so many hosts in a specific amount of time and you make the attacker take longer to attack one host they will ultimetly attack fewer hosts.  The DROP target will not consume any more resources than the TARPIT target but will allow the attacker to continue with the next host immedietly as you are doing nothing to sl
 ow the attacker down.  About the only reason I can see to use the DROP target verses the T
ARPIT target would be if you do not have the TARPIT target avaliable and you do not for some reason want to change that.

There have been a lot of people wanting to run a varient like the one below.

iptables -A INPUT -p tcp --dport 22 -s ! $My_Home_Firewall_IP -m state --state NEW -m recent --name SSH --set --rsource -j SSH_Brute_Force
iptables -A SSH_Brute_Force -m recent ! --rcheck --seconds 60 --hitcount 3 --name SSH --rsource -j RETURN 
iptables -A SSH_Brute_Force -j LOG --log-prefix "SSH Brute Force Attempt:  "
iptables -A SSH_Brute_Force -p tcp -j TARPIT

This version is just fine and will acomplish the same thing in a different manner.  My problem with this version is that it does not scale well to have multiple different source IPs that you want to have be known good with out using something like IPSets.  Also there is the fact that the "-m recent --name SSH --set --rsource" parameters are added to the calling rule(s), discussed earlier.

Finally a brake down of what / why / how the script actually does what it does for those who are interested.

1)  The kernel will have to know to jump to the SSH_Brute_Force chain some how, thus the "-j SSH_Brute_Force" somewhere in your firewall script.
2)  There should be some way to white list known good IP addresses to be SSHing in from, hens the "-s $My_Home_Firewall_IP -j RETURN" line(s) or the "-s ! $My_Home_Firewall_IP ... -j SSH_Brute_Force" line(s).
3)  Somewhere we will have to "--set" the recent counter for this packet, be it on the line that jumps to the SSH_Brute_Force chain or in the SSH_Brute_Force chain its self.
4)  The real ""magic of this script is on the line that checks to see if the hitcount on the recent list is at a value that we determine to be bad and if not RETURN back to the calling chain.
5)  Any thing that we have not returned by this point qualifies as traffic that is likely an SSH brute force attempt thus we LOG and TARPIT the traffic.

One last note is that there has been a request to update this script to alter a list of known bad hosts that can safely be dropped across the board.  I will be working on such a script and should hopefully be able to submit that version to the list as well.  Said version of the script will be based on my "Grant's personal SSH_Brute_Force Chain version 1.0" of the SSH Brute Force chain / script.  I expect that this version will have additional recent match lists for hosts that are known SSH brute force attackers and can safely be blocked for growing intervals of time, likely an hour, day, week, month, year, and permanent (at least that is what I'm thinking about writing).  I will probably rename some of the recent match lists to reflect more what they are so that they could be used in other tests to safely block hosts there too. This should be a good example of a much larger more fleet or
 iented script to be used on multiple production servers.



Grant. . . .

P.S.  This idea of an SSH_Brute_Force chain has obviously grown way beyond the original question and I think is impacting more and more people thus I think it is about time to set up a site somewhere dedicated to this for even more people to be able to find information and benefit (or detrimented by) from this script.  If any one knows a good place for this I would be greatly appreciate being told where to go with this.  I don't know / think that places like SourceForge or FreashMeat are appropriate for firewall scripts, though I could be wrong.  I would think there would be a good place on the NetFilter web site, though I'm not sure how to go about this my self.  Again any help / input / guidance would be welcome.

