From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: iptables scripts
Date: 31 Oct 2003 07:12:40 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067602360.1137.58.camel@valhalla>
References: <83055D4B014C9E478D2F04624B9E82CFD48C@noveldc.novelgmt.mu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <83055D4B014C9E478D2F04624B9E82CFD48C@noveldc.novelgmt.mu>
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
To: Gilles Yue <gyue@novelgmt.intnet.mu>
Cc: netfilter@lists.netfilter.org

On Fri, 2003-10-31 at 06:25, Gilles Yue wrote: 
> 
> What is the difference between saving iptables rules by typing
> /sbin/service save and putting it in a script which executes when the
> pc is restarted?

IMHO this is a personal preference thing. Some people prefer to use the
save/restore scripts. Some people (like myself) prefer to write their
own shell script. Its all a matter of personal preference.

For me, I just find working with a shell script easier. I typically
remotely manage my firewalls. I find it easier to vi a file rather than
work from the command line (you are also less likely to shoot yourself
in the foot by messing up your rules and blocking your remote session.
Been there, done that ;-). I also like being able to add in additional
functionality like variables, do loops, etc. Your mileage may vary.

> Secondly, if you were to put all your firewall rules in a script,
> where (on which path) would you put it to have it executed when the
> machine reboots.

Again this is somewhat personal choice. I create /root/firewall and
place all my firewall related scripts in there. You could put it in
something like /usr/local/sbin, but now you have a longer path to type
(ya I know, I'm *very* lazy ;-) and other unrelated files to contend
with in the same directory. 

HTH,
C



