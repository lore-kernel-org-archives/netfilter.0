From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Help creating a RULE
Date: Mon, 19 Sep 2005 06:10:23 -0400
Message-ID: <1127124623.2656.7.camel@localhost>
References: <CBF2220F040BC54584E69D569377DC4D41698F@smg-mail.summitmedia.com.ph>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <CBF2220F040BC54584E69D569377DC4D41698F@smg-mail.summitmedia.com.ph>
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
To: Jojo Solis <jojo.solis@summitmedia.com.ph>
Cc: netfilter@lists.netfilter.org

On Mon, 2005-09-19 at 08:39 +0800, Jojo Solis wrote:
> Hi Everyone,
>  
> 
> We have firewall with 3 LAN Card, Eth0 is connected to my LAN, eth1 is
> Connected to Internet, and eth2 is connected to our Sister companies
> WAN.
>  
> Since I am new to IPtables i dont know how to create a Rule to make the
> packet successfully reach its destination. This setup was made by a
> former sysad but left the firewall especially the connection going to
> the Sister Companies WAN un-configured. So that's the reason why Im here
> to seek help creating a rule for this firewall.
>  
> Basically I want to achive the following.
>  
> 1. Allow any IN and OUT traffic from eth0 to eth2 and vice versa.
> 2. Allow IN and OUT http traffic from eth0 to eth1.
> 3. Allow IN and OUT SMTP traffic from eth0 to eth1.
> 4. Allow Outgoing FTP traffic from eth0 to Eth1, Plus allow ESTABLISHED
> and RELATED FTP connection.
<snip>
For something this basic, you are best off reading a good tutorial.
There is an excellent one by Oskar Andreasson at
http://iptables-tutorial.frozentux.net/iptables-tutorial.html and it
makes for very quick reading.  You can also find some slightly dated
training slide shows in the training section of
http://iscs.sourceforge.net - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


