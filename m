From: Chris Wilson <chris@netservers.co.uk>
Subject: RE: per user IP adresses
Date: Tue, 6 May 2003 10:48:16 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0305061043470.20564-100000@localhost>
References: <000301c31272$057d8630$0200a8c0@WKSJOHN>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000301c31272$057d8630$0200a8c0@WKSJOHN>
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
To: John Guntenaar <john@guntenaar.nl>
Cc: netfilter@lists.netfilter.org

Hi John,

> I think you didn't understand my question,
> 
> Ofcourse I can just set open that IP address, but I only want it to be
> open for my own user (so the other users CAN'T use the IP)
> 
> I think I need things like -m owner --owner-uid or something but I can't
> figure out a good rule, I get errors on everything I try :(

I don't think REJECT works in the OUTPUT chain, try DROP:

	iptables -A OUTPUT -p tcp --dport 6667 -m owner --owner-uid john
		-s 1.2.3.4 -j ACCEPT
	iptables -A OUTPUT -p tcp --dport 6667 -j DROP

where "john" is the user ID who is allowed to use IRC on IP address 
1.2.3.4 only.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


