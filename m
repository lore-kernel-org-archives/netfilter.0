From: Jack Bowling <jbinpg@shaw.ca>
Subject: Re: simple, but not for me.
Date: Sat, 29 Jun 2002 22:25:42 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <0GYI00CJJ72YLS@l-daemon>
References: <00a701c21feb$30bea010$0200a8c0@SILVERBEAST>
Reply-To: Jack Bowling <jbinpg@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <00a701c21feb$30bea010$0200a8c0@SILVERBEAST>
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

** Reply to message from outspoken <outspoken@gru.net> on Sun, 30 Jun 2002 00:04:09 -0400


> ok, ill lay out a simple plan of what i need done. of course ive tried a lot of the options listed in this listeserv, and cant seem to get them working properly. also read some howtos and other various things but just came seem to get things working. there was one post that i thought was going to be helpful recently, but all they talked about was how its a security risk and they should really look into a dmz. well i cant right now since i don't have another ethernet card so please someone post simple iptables examples for me to use. =)
> 
> 
> i have a machine = 192.168.0.8 which is behind the firewall = 192.168.0.1
> what i need to do is have 192.168.0.8 be visible to the public for web serving, ssh, mysql.
> that is all.
> 
> my nat setup currently works fine with 3 machines behind the firewall.
> 
> modules loaded:
<snip>

Just an aside - we are not likely to be much help unless you post your whole ruleset. We do not know your default chain policies for one which will determine a lot.

jb

