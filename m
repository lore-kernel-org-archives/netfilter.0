From: Jack Bowling <jbinpg@shaw.ca>
Subject: Re: iptables -L TABLE -n -v -d x.x.x.x --dport x -i ethx
Date: Sun, 30 Jun 2002 23:13:18 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <0GYK002T43YAXX@l-daemon>
References: <200FAA488DE0D41194F10010B597610D2BA1BA@JUPITER>
Reply-To: Jack Bowling <jbinpg@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200FAA488DE0D41194F10010B597610D2BA1BA@JUPITER>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: netfilter@lists.samba.org

** Reply to message from George Vieira <GeorgeV@citadelcomputer.com.au> on Mon, 01 Jul 2002 13:49:04 +1000


> Hi all,
> 
> First post to the list and forgive me if someone's asked this before (I
> tried the archives)...
> 
> Can the above command actually work or is there a way to print just 1 rule
> that matches as I tried something similar to what's shown above and it
> doesn't like it.. go figure.
> 
> Am I doing it wrong or does it not support it in iptables? At the moment I
> have to keep greping the rule I need to check.. is there a better way?

I would just try the tried and true grep:

iptables -L TABLE -n -v | grep "-d x.x.x.x --dport x -i ethx"

jb

