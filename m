From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: SSH Brute force attacks - Script version 1.0
Date: Mon, 25 Jul 2005 15:41:33 -0400
Message-ID: <42E5406D.9080406@SCampbell.net>
References: <427B93EE.3030905@eccotours.dyndns.org>
	<429F4F47.8050301@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <429F4F47.8050301@riverviewtech.net>
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
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: iptables <netfilter@lists.netfilter.org>

Taylor, Grant wrote:
># NetFilter MailList SSH_Brute_Force Chain version 1.0.
>iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --name SSH --set --rsource -j SSH_Brute_Force
>iptables -A SSH_Brute_Force -s $My_Home_Firewall_IP -j RETURN
>iptables -A SSH_Brute_Force -s $My_Office_Firewall_IP -j RETURN
>iptables -A SSH_Brute_Force -s $My_Girlfriends_Firewall_IP list -j RETURN
>iptables -A SSH_Brute_Force -m recent ! --rcheck --seconds 60 --hitcount 3 --name SSH --rsource -j RETURN 
>iptables -A SSH_Brute_Force -j LOG --log-prefix "SSH Brute Force Attempt:  "
>iptables -A SSH_Brute_Force -p tcp -j TARPIT
>
>  
Thanks, that is most informative.  Here's an (hopefully) interesting 
twist on that:

-A INPUT -p tcp -m tcp --dport 22 -m state --state NEW -m recent --set 
--name SSH --rsource -j SSH
-A SSH -m recent --rcheck --seconds 300 --hitcount 7 --name SSH 
--rsource -j DROP
-A SSH -m recent --rcheck --seconds 30 --hitcount 4 --name SSH --rsource 
-j RETURN
-A SSH -j DROP

Now we must make 3 failed attempts to connect within 30 seconds then the 
4'th through 7'th attempts will be allowed.  Further attempts will not 
be allowed until 5 minutes of idle time.   Port scanners should blow 
right past this thinking "the port is closed", you can still get in by 
doing multiple attempts and anyone who does figure it out still can only 
issue 4 brute attempts every 5 minutes.



