From: michael@floog.net
Subject: Re: How to drop/reject packets amongst LAN clients?
Date: Mon, 10 May 2004 11:26:17 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084213577.409fc949e1db4@webmail.floog.net>
References: <1084206191.409fac6f1176a@webmail.floog.net> <409FB903.1090005@pbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <409FB903.1090005@pbl.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Cc: netfilter@lists.netfilter.org

Aleksandar,

Thanks for your guidance.
It looks like I've got a fair amount of new reading to do after
receiving Antony, Cedric, and your suggestion.  I think I'll want to
install the 3rd NIC, and do some more NAT'ing and/or Bridge'ing.

First stop, www.tldp.org for review of documentation there.
Second stop, man route and/or routed.

I appreciate your help.

Mike



Quoting Aleksandar Milivojevic <amilivojevic@pbl.ca>:

> Second solution would be to put new server onto separate LAN. 
> 192.168.1.9 will become 192.168.2.9 (or whatever).  Than clients on
> your 
> first LAN (192.168.1.0/24) will have to talk to your firewall/router
> to 
> get to the server on your second LAN (192.168.2.0/24).
> 
> You will need one more ethernet card for second solution.  If
> additional 
> server is going to be the only host in second LAN, you can connect it
> 
> directly with cross over cable.  If you are going to add more servers
> to 
> second LAN, you will also need additional hub or switch (do not
> connect 
> two LANs into same hub).
> 
> -- 
> Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote




