From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: inner workings of IP tables
Date: Sun, 29 Sep 2002 20:30:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020929193020.YCUL13996.mta05-svc.ntlworld.com@there>
References: <20020929091933.FWMZ13996.mta05-svc.ntlworld.com@there> <55639.64.86.49.17.1033326331.squirrel@www.icafe.co.tz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <55639.64.86.49.17.1033326331.squirrel@www.icafe.co.tz>
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
To: netfilter@lists.netfilter.org

On Sunday 29 September 2002 8:05 pm, Mitesh P Choksi wrote:

[ Comparing netfilter with Checkpoint Firewall-1 ]

> What about ease of use? The GUI

There are many netfilter-based firewall products available with a GUI 
interface.   Not all of them tell you they're based on netfilter, but many do.

Checkpoint sell a two-day training course for around $5000 to teach people 
how to use their GUI (I have done it, and their system is not obvious if you 
don't do the training course).   Many of the netfilter products with GUIs are 
available for less money than the Check Point training course, never mind the 
CP product licence...

Anyway, the points you raised in your previous email, which I answered, were 
about the security of the product, not how pretty it looked.

> Multiple firewalls.

Again that is not a security question, this one is about reliability of 
equipment.   If you want fault-tolerance and automatic-failover then 
netfilter isn't the answer, but that doesn't mean it's any less secure.

> Management of firewalls.

What about it ?   If you know Firewall-1 then you can manage a FW-1 
installation.   If you know netfilter then you can manage a netfilter 
installation.   Swap jobs and you're in trouble either way.

> Delegation of firewalls and types of rules.

Either this is the same point as you made above about GUIs, or else you're 
suggesting you can't load the same ruleset onto two netfilter boxes and get 
them to do the same thing ?

Most people require one ruleset on one firewall.   I do know companies who 
have mutliple firewalls and want to manage them centrally, sometimes using a 
single ruleset (which doesn't actually necessarily make things any easier) 
however these are the minority and therefore they have to choose a product 
with specialised features.

> I believe that CheckPoint has the level of application along with that
> allows all of hte above. For Netfilter you have to build on top of it.

You are correct - Firewall-1 does include all the above features.   However, 
various commercial organisations *have* built them to varying degrees on top 
of netfilter, and if you don't mind paying for a product (and a lot less than 
Check Point charge) you can buy one of those and get the benefits.

> We can't compare apples to oranges.

Indeed.   I thought we were talking about the security performance of the 
products, based on the questions you raised earlier.

If you're happy that both products do just as good a job at the security 
level, and now you're comparing them for their management aspects, then yes 
they are different.

> CheckPoint goes a bit beyond packet filtering on the user
> interaction / commercial side of it.

Agreed.   And just as well considering what they charge for it.   However, as 
I say there are many commercially-available firewalls based around netfilter 
which add the features you seem to be looking for.

You can't criticise a car engine built by General Motors because it doesn't 
have as nice a dashboard as a Rolls-Royce car: you should find a car which 
contains that engine and then compare the dashboards.

Antony.

-- 

Documentation is like sex:
when it's good, it's very very good;
when it's bad, it's still better than nothing.

