From: Alireza Yazdani <yazdani1193@yahoo.com>
Subject: SSH Brute force attacks
Date: Wed, 11 May 2005 06:20:02 -0700 (PDT)
Message-ID: <20050511132002.63539.qmail@web51911.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: 6667
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

please introdoction program name for SSH_Brute_Force and Telnet_Brute_Force

Brent Clark <bclark@eccotours.dyndns.org> wrote:Taylor, Grant wrote:
> # Let's jump to the SSH_Brute_Force chain if this is a new connection 
> that is not from my IP address.
> iptables -A INPUT -p tcp --dport 22 -m state --state NEW -s ! 
> $MYIPADDRESS -j SSH_Brute_Force
> # If there have not been 4 NEW connection attempts from this source IP 
> address in the last 60 secons let's return to the INPUT chain.
> iptables -A SSH_Brute_Force -m recent --name SSH ! --rcheck --seconds 60 
> -m recent --hitcount 4 --set --name SSH -j RETURN
> # Well, the NEW connection has been seen so let's update the SSH recent 
> list.
> iptables -A SSH_Brute_Force -m recent --name SSH --update
> # I like to log on a line by it's self so I don't have to remember to do 
> it on my last line prior to the end of my script.
> iptables -A SSH_Brute_Force -j LOG --log-prefix "SSH Brute Force 
> Attempt: "
> # Let's send the person that is trying to SSH in to us to the TARPIT 
> target and make them think twice before they try again.
> # TARPIT will force the site that is SSHing in to us to timeout the 
> connection. Sure stick you hand in my port, I'll grab hold of it and 
> not let go,
> # you will ahve to chew your arm off and grow a new one and try again.
> iptables -A SSH_Brute_Force -j TARPIT
> # I can be a mean vindictive SoB (Sweet Old Buzzard. NOT!)

Hi all

Thanks to Grant for the info above, but for some funny reason I cant get 
the following to work

iptables -A SSH_Brute_Force -m recent --name SSH ! --rcheck --seconds 60 
-m recent --hitcount 4 --set --name SSH -j RETURN

this what I get back:
=====================
[root@abc root]# iptables -A SSH_Brute_Force -m recent --name SSH ! 
--rcheck --seconds 60 -m recent --hitcount 4 --set --name SSH -j RETURN
iptables v1.2.9: Unknown arg `4'
Try `iptables -h' or 'iptables --help' for more information.
[root@ns root]#


Regards
Brent Clark



		
---------------------------------
Do you Yahoo!?
 Yahoo! Mail - You care about security. So do we.
