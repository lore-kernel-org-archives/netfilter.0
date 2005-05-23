From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: SSH Brute force attacks
Date: Mon, 23 May 2005 11:53:59 -0500
Message-ID: <42920AA7.6070909@riverviewtech.net>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>	<4285C016.2060900@wp.pl>	<42864CA9.7050802@riverviewtech.net>	<428856F8.60706@wp.pl>	<Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Would this version be more to your liking?  I'm just trying to evolve this script to answer as many of the questions / concerns that are being posed on the list.

iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --name SSH --set --rsource -j SSH_Brute_Force
iptables -A SSH_Brute_Force -s $My_Home_Firewall_IP -j RETURN
iptables -A SSH_Brute_Force -s $My_Office_Firewall_IP -j RETURN
iptables -A SSH_Brute_Force -s $My_Girlfriends_Firewall_IP list -j RETURN
iptables -A SSH_Brute_Force -m recent ! --rcheck --seconds 60 --hitcount 3 --name SSH --rsource -j RETURN 
iptables -A SSH_Brute_Force -j LOG --log-prefix "SSH Brute Force Attempt:  "
iptables -A SSH_Brute_Force -p tcp -j TARPIT

I have tested this script on my home firewall and have found it to work the way that it is intended, so give it a try and see what you think.  Any and all feedback is welcome and appreciated.



Grant. . . .

