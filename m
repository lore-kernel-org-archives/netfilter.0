From: Scott Mayo <sgmayo@mail.bloomfield.k12.mo.us>
Subject: Re: logging port 25
Date: Tue, 18 Oct 2005 13:45:06 -0500
Message-ID: <435542B2.2020907@mail.bloomfield.k12.mo.us>
References: <435514F5.9000201@mail.bloomfield.k12.mo.us>
	<200510181059.34916.rob0@gmx.co.uk>
Reply-To: sgmayo@mail.bloomfield.k12.mo.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510181059.34916.rob0@gmx.co.uk>
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

/dev/rob0 wrote:
> On Tuesday 2005-October-18 10:29, Scott Mayo wrote:
> 
>>the outside.  What rules do I need to set in my firewall, so that any
>>mail that is destined for my mail server through port 25 is alright,
>>but any mail that is destined for port 25 that is not going to my
>>mail server, gets logged and dropeed.
>>
>>I am trying to do this in case I get a virus that uses its own smtp
>>to send out mail.
> 
> 
> Good idea. You probably already have some.

Well, I have virus protections on most things, but uses seem to get them 
turned off once in a while. :)

> 
> 
>>What would I need to put in for my rules?  I thought that I had it
> 
> 
> Tell us what you tried and I will tell you why it was wrong. My crystal 
> ball thinks you put the rules in INPUT. Was it right?


I was not sure, so I put the rules in both the INPUT and FORWARD chain.

> 
>>down correctly, but I am not getting anything in the log.  It does
>>log this to /var/log/messages doesn't it?
> 
> 
> It logs according to the configuration of your system syslogd. It might 
> also log to different places depending upon --log-level if specified in 
> the rule[s] which you did not post. IINM the default syslog facility 
> and priority is kern.info, but /proc settings can change the priority 
> too.

Here is what I added in:
The firewall has two different NICS in it.

INT_IP_RANGE="10.0.0/16"
INT_IP_RANGE2="192.168.0.0/24"

$IPTABLES -A INPUT -p tcp -d mail_server_IP --dport 25 -j ACCEPT
$IPTABLES -A INPUT -p tcp -s $INT_IP_RANGE --dport 25 -j LOG --log-level 
debug
$IPTABLES -A INPUT -p tcp -s $INT_IP_RANGE --dport 25 -j LOG 
--log-prefix "EMAIL:"
$IPTABLES -A INPUT -p tcp -s $INT_IP_RANGE --dport 25 -j LOG 
--log-tcp-sequence
$IPTABLES -A INPUT -p tcp -s $INT_IP_RANGE --dport 25 -j LOG 
--log-ip-options
$IPTABLES -A INPUT -p tcp -s $INT_IP_RANGE2 --dport 25 -j LOG 
--log-level debug
$IPTABLES -A INPUT -p tcp -s $INT_IP_RANGE2 --dport 25 -j LOG 
--log-prefix "EMAIL:"
$IPTABLES -A INPUT -p tcp -s $INT_IP_RANGE2 --dport 25 -j LOG 
--log-tcp-sequence
$IPTABLES -A INPUT -p tcp -s $INT_IP_RANGE2 --dport 25 -j LOG 
--log-ip-options

I did the same thing for the FORWARD chain, except changed teh INPUT to 
FORWARD obviously. :)

Thanks for any help.

-- 
Scott Mayo
Technology Coordinator
Bloomfield Schools
PH: 573-568-5669
FA: 573-568-4565
Pager: 800-264-2535 X2549

Duct tape is like the force, it has a light side and a dark side and it
holds the universe together.

