From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: iptables question
Date: Thu, 14 Aug 2003 11:17:31 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0308141100450.31438-100000@localhost>
References: <1060807798.4082.8.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1060807798.4082.8.camel@localhost.localdomain>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glenn Hancock <ghancock@softeksoftware.com>
Cc: netfilter@lists.netfilter.org

Hi Glenn,

> I have my rules setup the way I would guess they should be based on 5
> tutorials, 1 book and the man pages.  However, I still can't seem to get
> the thing to do what I want.  Could someone please help me?
> 
> I will make this very simple:
> 1)  I want to allow all incoming requests to port 80
> 2) I want to allow all outgoing requests .... period.
> 
> I want to drop all other incoming requests not addressed to port 80.

Did you see Rob Sterenborg's response to your previous post? The ruleset 
which you sent didn't appear to be complete. You also don't mention if the 
machine you're running the firewall on is the same one that's running the 
web server, and that you're trying to make outgoing requests from. 
Assuming that it is, the following rules should work:

  iptables -F
  iptables -P INPUT DROP
  iptables -P OUTPUT ACCEPT
  iptables -P FORWARD DROP
  iptables -A INPUT -m state --state established -j ACCEPT
  iptables -A INPUT -i lo -j ACCEPT
  iptables -A INPUT -p tcp --dport 80 -j ACCEPT

If, on the other hand, you have another network behind your Linux box, and 
machines on that network need to get through the Linux box to the 
Internet, then you will need the following additional rules:

  iptables -A FORWARD -i <internal-interface> -o <external-interface> \
	-j ACCEPT
  iptables -A FORWARD -m state --state established -j ACCEPT

and if the internal machines have private IP addresses:

  iptables -t nat -A POSTROUTING -o <external-interface> -j MASQUERADE

By the way, I don't like my first impression of your challenge-response
spam filter. You might want to try SpamAssassin, it's much less intrusive 
to people trying to e-mail you.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |




