From: "Don Hughes" <support@microtechniques.com>
Subject: DNATing back to the same network
Date: Thu, 13 Jan 2005 14:26:07 -0500
Message-ID: <41E684FF.13943.7EDFCC@localhost>
References: <20050113165624.C0BFA5F67@mail.microtechniques.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <20050113165624.C0BFA5F67@mail.microtechniques.com>
Content-description: Mail message body
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

 
> Message: 1
> Date: Thu, 13 Jan 2005 15:42:33 +0100 (CET)
> From: danci@agenda.si
> Subject: DNATing back to the same network
> To: netfilter@lists.netfilter.org
> Message-ID: <Pine.LNX.4.58.0501131538030.16403@desktop.agenda.si>
> Content-Type: TEXT/PLAIN; charset=US-ASCII
> 
> Hi!
> 
> I have a firewall with a number of DNAT rules for various ports/hosts.
> It would be good if local users could use the same DNAT's. However, as
> it seems this doesn't work.
> 
> My firewall has a public IP. Some ports on this IP are DNATed to
> different hosts on the local network. DNAT works for users that
> connect from the internet.
> 
> However, when a local users tries to connect to the public IP and
> DNATed port, the connection fails. Which is basically logical as the
> server receives a packet with the source IP of the actual user and it
> answeres directly to that IP.
> 
> Is it possible to change netfilter behaviour? Any other work-around
> for that?
> 

I have a POSTROUTING rule for any internal traffic to SNAT it so 
that it returns back to the router instead of directly to the 
user.




-- 
..don

dhughes@microtechniques.com
White Plains, NY



