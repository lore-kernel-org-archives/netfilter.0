From: Mogens Valentin <mogensv@vip.cybercity.dk>
Subject: Re: Advice on setting up a firewall for a Windows Domain Controller
Date: Fri, 14 Oct 2005 03:24:11 +0200
Message-ID: <434F08BB.8040603@vip.cybercity.dk>
References: <531442a50510121004i2229579fv8bb1cae2cd1b456a@mail.gmail.com>
Reply-To: mogensv@vip.cybercity.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <531442a50510121004i2229579fv8bb1cae2cd1b456a@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Zacky wrote:
> Hello everyone,
> 
> I was asked to set up a firewall for a Win2K domain controller, which
> also acts as a print server, web server and SQL server... Last year, I
> was assigned a similar project but never got around to work on it.
> However, I did some research on the topic and I was directed to this
> KB article that lists the ports I have to open for the DC to work
> behind the firewall:
> 
> http://support.microsoft.com/kb/179442/
> 
> While I have set up firewalls in the past, I'm not very familiar with
> Windows networks and I would like to hear your opinions on how to go
> about setting up the firewall.
> 
>   Here's some info about the network. The DC and all the 25 Windows XP
> desktops that connect to the DC have public IP addresses, but only the
> DC has a FQDN. The requirement is to keep the desktops' public IP
> addresses and just move the DC behind the firewall.

Geez! Much like a project a was assigned to solve a few yeas back.

All having public addresses. Double-geez!!
Tell them this means the server, and all clients are directly accessable 
from the internet. No no no, they're not merely -connectet- to the inet, 
they can be -accessed- by weird people living out here on the net.
Do a quick'n'fun test: From -any- client, go to grc.com, and perform the 
fun Test Your Shields test (if it's still available).
Ok, with the Great MS Firewall in place on each fuly updated XP, it 
-may- not be that bad; but they're still accesable from the net.


So,
Firstly, persuade them to have the Linux box not only do the 
firewalling, but also route the network, and perform NAT on the internal 
segment. Depending upon how those XP clients are organized, you may 
(want) to segment the internal net into, say at least, an administrative 
segment and a not-so-trusted client segment.


Secondly, you may want to talk them into not nunning domain controller, 
print server, web server and SQL server on one and same physical server.

At least move the webserver onto its own hardware.

What's the SQL server doing? A backend for the IIS?
Worse? Some internal finalcials running on it? Both? (shiver)


Thirdly, let the Linux box be the -real- DNS and preferably also the 
dhcp. Use a ddns setup here, and if the business absolutely -must- run 
some MS-DNS, have the W2K DNS get it's public info from the Linux box.
This is actually not a stupid idea. Some MS services are easier handled 
if the MS server runs it's own DNS.
The Right Tool for the Right Job.


But I can see a big problem whacked right onto you face:
Public IP's being a REQUIREMENT!  Trible geez!!!
Why on earth do they need to have the clients on the ugly inet?
My take is: They don't know. Explain why they don't want that.

-- 
Kind regards,
Mogens Valentin


The OSI 7-layer network model actually has three extensions:
Layer 8 is politics
Layer 9 is religion
Layer 10 is the CEO layer..



