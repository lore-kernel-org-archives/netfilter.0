From: Dimitar Katerinski <train@bofh.bg>
Subject: Re: Transparent proxy single machine question
Date: Sun, 27 Jun 2004 04:16:51 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40DE2003.9040306@bofh.bg>
References: <40DDE99C.7060001@triad.rr.com> <40DDEFEC.5000205@bofh.bg>	 <1088287795.4717.12.camel@Kenslinux>  <40DDFBD1.2090700@bofh.bg> <1088297542.4717.29.camel@Kenslinux>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1088297542.4717.29.camel@Kenslinux>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ken scott <kscott9@triad.rr.com>
Cc: netfilter@lists.netfilter.org

ken scott wrote:
> On Sat, 2004-06-26 at 18:42, Dimitar Katerinski wrote:
> 
> 
>>Hello Ken,
>>
>>Ah just know I understand that this is a workstation with some users, 
>>and squid and DG running ot this machine. Okay, I did some tests and 
>>came up with a solution ;-)
>>You can't redirect packets that origin from the machine itself, to some 
>>other local port (as far as i know). Maybe you can play with 
>>CONFIG_IP_NF_NAT_LOCAL option in the kernel, but as I understand it, it 
>>lets you to use destination NAT on connections originating from local 
>>processes on the nat box itself, but that is now we are looking for. So
>>here is what you can do:
>>
>>1. Leave the proxy setting as is in the browser properties (127.0.0.1:8181)
>>2. Allow outgoing requests to port 80 only for the UID that squid is 
>>running under.
>>iptables -A OUTPUT -m owner ! --uid squid -p tcp --dport 80 -j DROP
>>This rule can be more flexible, but I live this to you, I hope you get 
>>the idea.
>>3. And finally test, whether you can make requests as user with and 
>>without proxy set in the browser.
>>
> 
> Dimitar,
> 
> Success!! (at least mostly.)  Thanks greatly for your assistance.
> I used WEBMIN firewall module to build the following rule:
> -A OUTPUT -p tcp -m tcp --dport 80 -m owner ! --uid-owner squid -j
> DROP    
> 
> case 1- User requests (with browser set to no proxy) time out after
> about a minute.    [Desired outcome except timeout takes a long time]
> case 2- User requests (with browser proxy set to the Dansguardian 8181
> port) work fine.  [Desired outcome]
> case 3- User requests (with browser proxy set to the Squid 3128 port)
> also work fine.  [Not desired since webfiltering is bypassed]
> 
> So three things remain
> 1) Newbie question - How do I edit/change directly the iptable rules
> without requiring webmin?  (I can print them out with the iptables-save
> command)
> 2) Can I get the request reject/timeout to occur more quickly?
> 3) Can I close the loop hole of someone pointing their browser to the
> squid port (rather than the dg port)?
> 
> Thanks again!!
> Ken

Hello Ken,


First about the indesired timeout, you could do -j REJECT instead of -j 
DROP as REJECT target send tcp rst to the connection.
iptables -A OUTPUT -p tcp --dport 80 -m owner ! --uid-owner squid -j 
REJECT --reject-with tcp-reset

As for bypassing DG, you could easily allow only DG to be able to 
connect to 3128.
iptables -A OUTPUT -p tcp --dport 3128 -m owner ! --uid-owner 
dansguardian -j REJECT --reject-with tcp-reset

About asking me how to modify iptables rules, well it would be nice to 
read some howtos on netfilter.org ;-) The commands I'm giving you can be 
executed directly from the console, so no need for webmin. You can put 
them in your startup scripts, so they can be executed everytime the box 
starts. And finally, if you want to delete the above rules, you can 
substitute -A with -D, just my 2cents :-).

I wish you luck with the issue you have. I think we almost or fully 
resolve it ;-), so I may go to sleep now, because its 04:00 am here.

Regards,
Dimitar

-- 
"The only thing necessary for the triumph of evil is for good men to do 
nothing."
                                                   --Edmund Burke.

