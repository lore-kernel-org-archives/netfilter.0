From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: the impossible "iptables -C" option
Date: Sun, 25 Jul 2004 19:08:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407251908.00346.Antony@Soft-Solutions.co.uk>
References: <01be01c4710c$440a79e0$5100a8c0@egp> <200407242113.48128.Antony@Soft-Solutions.co.uk> <1090777811.31169.40.camel@les-home.futuresource.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1090777811.31169.40.camel@les-home.futuresource.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Sunday 25 July 2004 6:50 pm, Les Mikesell wrote:

> On Sat, 2004-07-24 at 15:13, Antony Stone wrote:
> > On Saturday 24 July 2004 7:46 pm, Les Mikesell wrote:
> > > I have a situation where I can see strange results with tcpdump and
> > > would like to know what combination of rules is causing it.
> >
> > I suggest you take some of the features you can see from the tcpdump
> > output and create some logging rules to find out how far through your
> > ruleset the packets are getting.
>
> The problem is that in this case the rules are built by a perl
> script that writes a shell script that lives in /etc/rc.d/init.d
> and both contain variables and conditionals interpreted at
> runtime.  The point of using this particular system is that
> you normally don't have to understand how it all works because
> the configuration is all scripted.  So it isn't 'my' rules
> I want to see - I just want to know which of the existing
> rules I have to work around.

Well, you can find out what the ruleset really is once it's all been scripted, 
run and installed, by asking netfilter for a listing:

iptables -L -nvx; iptables -L -t nat -nvx

Then you can can add LOGging rules at whatever points you like in the ruleset 
by using "-I CHAIN #" where # is the position you want the rule to occupy.

You could even take this to an extreme and insert a LOGging rule between every 
two other rules with a little script of your own:

for((a=2;a<100;a+=2))
do
  iptables -I FORWARD $a -j LOG --log-prefix="rule $a "
done

(assuming you have 50 rules at present, so the last new LOG rule needs to go 
in position 100)

This will create some verbose output, but you'll certainly find out what's 
happening to your packets...

Regards,

Antony.

-- 
I don't know, maybe if we all waited then cosmic rays would write all our 
software for us. Of course it might take a while.

 - Ron Minnich, Los Alamos National Laboratory

                                                     Please reply to the list;
                                                           please don't CC me.


