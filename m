From: Michael Gale <michael@bluesuperman.com>
Subject: Re: Performance Monitoring
Date: Mon, 5 Jan 2004 23:01:15 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040105230115.687bded9.michael@bluesuperman.com>
References: <004401c3d17c$4baa7cc0$0a01000a@xcom1>
	<3FF9E4B7.8010109@lintelsys.com.au>
	<011001c3d3f8$6a6a7e20$7700000a@lawrencewin2k>
	<3FFA33C7.9010806@lintelsys.com.au>
	<20040106033802.30955.qmail@paus.pesat.net.id>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040106033802.30955.qmail@paus.pesat.net.id>
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

Hello,

	Yesterday I was a reply on Performance Monitoring on the netfilter mail
list, it suggested the user use IPAC-NG. The admin then have to create a
chain for each IP they want to monitor.

I did not think this is a good idea ... so for those of you who want to
do bandwidth monitoring I suggest you check out the following. Here is a
list of ones I have tried.

ntop -- provides a web GUI for real time monitoring. Using it now on a
firewall box to monitoring traffic on each interface. 

Adv .. provides great states , very detailed
Dis .. seems to be some over header ... uses a DDR db :(

You can use curl to pull the stats nightly and save them to a text file.
Then create a little PHP scritp to provide you with the numbers. Now you
will have stats for as long as you want.

iptraf -- not bad ... detail is low.

Adv ... NO over head and works great on a work station or 1 interface
machine. It takes a bit to setup because you have to create all the
filters your self.

Dis ... out is simple ... a php script to produce a nice web GUI is
needed.

Nagios -- http://www.nagios.org/
	Could be over kill depending on what you want ... this is more of a
network monitoring tool. Really not designed to be run with one machine
in mind.

IPFM -- not bad .. very simple:

example:
HOST                          IN         OUT       TOTAL
host1.domain.com           12345     6666684     6679029

MRTG for total traffic accounts only

Bandwidthd -- not bad ... currently testing it. Seems to provide web png
files much like MRTG but does provide host info. I do not believe you
are able to save the data though :(


Michael.


On Tue, 06 Jan 2004 10:38:02 +0700
"bino" <bino@indoakses-online.com> wrote:

> I my self don't familiar with IPAC-NG.
> The basic logic block is :
> 1. use the feature of iptables -N to create per ip-addr IN and Out
> chain 2. jump every traffic per ip addr, to respective chain 
> 
> use cron to run the bash-script that do :
> 1. iptables -L -vnx
> 2. Parse the data from each respective chain
> 3. stor it to remote MySQL using MySql client tool
> 4. reset (zero ?) the value of each chain 
> 
> That way you can have a traffic record per station (ip addr) 
> 
> If you just need monitoring like MRTG (in bps, no detailed history
> record), it'll more simple ... you only need to hack NetSNMPD and use
> MRTG to do the rest, no SQL hasle. 
> 
> Sincerely
>  -bino- 
> 
> Alex Satrapa writes: 
> 
> > Lawrence Tang wrote:
> >> Does this will help to calculate each PC on LAN MB usage report ??
> > 
> > You should be able to configure it to do so. IPAC-NG uses separate 
> > accounting rules for every item that you want to report on. Thus if
> > you want individual accounting per PC, you can set it up to do so. 
> > 
> > Install it and fiddle. That's my recommendation. 
> > 
> > Alex Satrapa 
> > 
> >  
> > 
> > 
>  
> 
> 


-- 
Hand over the Slackware CD's and back AWAY from the computer, your geek
rights have been revoked !!!

Michael Gale
Slackware user :)
Bluesuperman.com 

