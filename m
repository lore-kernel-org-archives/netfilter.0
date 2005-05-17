From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: SSH Brute force attacks
Date: Tue, 17 May 2005 01:55:55 -0500
Message-ID: <4289957B.8070909@riverviewtech.net>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>	<4285C016.2060900@wp.pl>
	<42864CA9.7050802@riverviewtech.net>	<428856F8.60706@wp.pl>
	<Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> Stick with one "-m recent".

I have just recently learned that it is only possible to have one match type per IPTables rule.  Sorry for the confusion, I typed up my idea late one evening with out testing it to see if it would work.  Fortunately the people on this list have helped to turn my idea in to a working product.

> Instead of this:
> 
> iptables -A SSH_Brute_Force -m recent --name SSH ! --rcheck --seconds 60 \
>   -m recent --hitcount 4 --set--name SSH -j RETURN
> 
> try this:
> 
> iptables -A SSH_Brute_Force -m recent --name SSH ! --update --seconds 60
>  --hitcount 4 -j RETURN
> 
> I think that might be what the OP intended.

Yes this is indeed what I was trying to do.  I was (at the time) no aware that --update would do the equivalent of --set for an IP address that was not already in the recent list.  Nor was I aware that you could only have one of each match type per line.  With these updates in mind here is a repost of the original script that I have tested and found to work successfully:

# Let's jump to the SSH_Brute_Force chain if this is a new connection that is not from my IP address.
# This will prevent processing these rules for non SSH traffic.
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j SSH_Brute_Force
# Let's white list some IP addresses.
iptables -A SSH_Brute_Force -s $My_IP_Address -j RETURN
iptables -A SSH_Brute_Force -s $My_Friends_IP_Address -j RETURN
iptables -A SSH_Brute_Force -s $Any_other_IP_that_I_want_to_white list -j RETURN
# We have to manually add the IP address that we want to block to our SSH recent set.
iptables -A SSH_Brute_Force -m recent --set --name SSH --rsource 
# If there have not been 4 NEW connection attempts from this source IP address in the last 60 seconds let's return to the INPUT chain.
# Our hitcount has to be set to twice the number of SSH connection attempts that we want to allow b/c of the previous --set rule will match each and every pass.
iptables -A SSH_Brute_Force -m recent ! --update --seconds 60 --hitcount 8 --name SSH --rsource -j RETURN 
# Well, the NEW connection has been seen so let's update the SSH recent list.
iptables -A SSH_Brute_Force -m recent --update --name SSH --rsource
# I like to log on a line by it's self so I don't have to remember to do it on my last line prior to the end of my script.
iptables -A SSH_Brute_Force -j LOG --log-prefix "SSH Brute Force Attempt:  "
# Let's send the person that is trying to SSH in to us to the TARPIT target and make them think twice before they try again.
# TARPIT will force the site that is SSHing in to us to timeout the connection.  Sure stick you hand in my port, I'll grab hold of it and not let go,
# you will have to chew your arm off and grow a new one and try again.  I'll hold your new arm again and again and again and...  This should slow you down.
iptables -A SSH_Brute_Force -p tcp -j TARPIT
# I can be a mean vindictive SoB (Sweet Old Buzzard.  NOT!)

Sorry for the confusion and trouble that this caused.  I am now personally using a slight deviation (pkttype unicast and addrtype unicast matches) of this script with 5 allowed SSH connection attempts (hitcount of 10) in 1 minute.  I also found a bug in the "-j TARPIT" line as you can only TARPIT TCP traffic, hens the "-p tcp" on the line now.  :)



Grant. . . .

