From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: SSH Brute Force not working (any longer)
Date: Thu, 28 Jul 2005 14:28:20 -0500
Message-ID: <42E931D4.8000508@riverviewtech.net>
References: <5d2f37910507270936737ad3d1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5d2f37910507270936737ad3d1@mail.gmail.com>
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
To: Netfilter User Mailing List <netfilter@lists.netfilter.org>

After having messed with the SSH_Brute_Force script(s) extensively I think I can help you with this.

<testwall1>
iptables -N SSH_Brute_Force
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j SSH_Brute_Force
#following, adapted from grant's post, lets everything through
iptables -A SSH_Brute_Force -m recent --name SSH ! --rcheck --seconds 60  --hitcount 4  -j RETURN
#following, from grant's original post, gives iptables v1.2.9: Unknown arg `4'
#iptables -A SSH_Brute_Force -m recent --name SSH ! --rcheck --seconds 60 -m recent --hitcount 4 --set --name SSH -j RETURN
iptables -A SSH_Brute_Force -m recent --name SSH --update
iptables -A SSH_Brute_Force -j LOG --log-prefix "IPT_TEST SSH DROP:  "
iptables -A SSH_Brute_Force -p tcp -j TARPIT
</testwall1>

After a reboot I'm betting that your testwall1 script will never NOT RETURN packets as you are never really doing a SET of the information in the recent list and thus never having a packet counter get to 4 where where the inverse match would fail and thus not return.  In my experience "--update" will only increment a value that already is set to something.  Conversely "--rcheck" has to have a value to check against.

<testwall2>
/sbin/iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --set --name SSHBF
/sbin/iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --update --seconds 60 --hitcount 4 --name SSHBF -j LOG --log-prefix "IPT_TEST SSH DROP: "
/sbin/iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --update --seconds 60 --hitcount 4 --name SSHBF -j DROP
</testwall2>

Something tells me that you *might* get one packet through this filter but it would depend on what else you have done in the last 60 seconds.  When the packet is indeed in state NEW it will come in to the first rule and have it's value set in the SSHBF recent list.  Subsequently the packet will have it's entry in the SSHBF recent list updated (incremented by 1) while evaluating the 2nd rule.  Seeing as how this packet should now have it's recent list entry counter at 2 it will not match and thus not log as the recent match should fail but still update the recent list.  Finally the packet will have it's entry in the SSHBF recent list updated while evaluating the 3rd rule.  Seeing as how the packet should now have it's recent list entry counter at 3 it will not match and thus not be dropped.  However this will all depend on the fact that there are no entries in the recent list for any give
 n packet before it starts because if it even has a value of 1 it will be dropped by the ti
me that it reaches the 3rd rule.  I suspect that you might be able to get one packet and thus connection through this filter on the first pass but have a lot of trouble with subsequent connections.

<testwall3>
iptables -N SSH_Brute_Force
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --name SSH --set --rsource -j SSH_Brute_Force
iptables -A SSH_Brute_Force -m recent ! --rcheck --seconds 60 --hitcount 3 --name SSH --rsource -j RETURN 
iptables -A SSH_Brute_Force -j LOG --log-prefix "IPT_TEST SSH drop:  "
iptables -A SSH_Brute_Force -p tcp -j TARPIT
</testwall3>

I would expect that this script did work for you.  From the fact that it is the last testwall I'm going to assume that it did for a while.  The only thing that comes to mind as to why this would not work would be if for some reason the packet(s) started matching a state of NEW again.  The only reason that I can think of that your packet would erroneously be showing up as a state of NEW again would be if for some reason your conntrack table was full.  Your size conntrack table depends on the amount of memory that you have in the router and thus could possibly be over run as the conntrack table is a FIFO as far as I know.  If this is the case you should have seen some logs in dmesg regarding the conntrack table being full.  Sorry I don't remember the exact wording of the error as it's been over a year sense I dealt with that on a different router.

I don't know what to think about the patch (http://patchwork.netfilter.org/netfilter-devel/patch.pl?id=2587) that Marius referenced as I have not experienced this issue and thus have not had to address it, though it does sound plausible.

One thing that I can recommend is that you check the /proc/net/ipt_recent/<recent list name> file(s) for the existence of a line matching the IP (and possibly the TTL) that you are having problem with.  If there is a line in this file(s) then your IP is in that recent list with a hit count of the number of packets that are listed on the line.  Or at least this is how I understand it.

Something else that I did that you might find useful was to have a rule something like "-m recent --name SSH --remove" to make sure that the IP that you are testing from is NOT in the recent list so you can fiddle with things and then get back to a clean slate with out having to reboot.

If you would care to look at the version of the script that I am running take a look at this previous post https://lists.netfilter.org/pipermail/netfilter/2005-June/061362.html



Grant. . . .

curby . wrote:
> I know enough to realize that it didn't stop working just because it
> hates me: most likely, i changed something in the configuration or
> something to make it stop working.  However, I can't think of anyting
> I could have done to two different machines to make them stop working
> in exactly that same way.  Basically, every SSH attempt skips the
> return to the input chain and jumps directly to log/drop or
> log/tarpit.  I've tried increasing the --hitcount, tried rebooting or
> otherwise restarting the network service, tried using a different
> --name in recet, etc.
> 
> I have tried all the following scripts (I can paste their contents in
> if requested but it would be rather annoying because of their combined
> length) with no success.  Any ideas on what might have happened? 
> Kernel version and iptables version didn't change, the recent module
> loads with no errors, and all the iptables commands to insert rules
> complete with no errors.
> 
> Links to variations that I tried with no success:
> 
> http://curby.net/doc/testwall1
> http://curby.net/doc/testwall2
> http://curby.net/doc/testwall3
> http://curby.net/doc/testwall4
> 
> Hopefully it's a really simple typo or something, though with all the
> variations I've tried, I'm starting to doubt that simple explanation. 
> What might the problem be?  Thanks!

