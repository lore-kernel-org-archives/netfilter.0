From: Robert Wood <rob@rnwood.co.uk>
Subject: Re: Linux HA with Bridge
Date: Tue, 30 Sep 2003 21:24:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F79E67D.7030708@rnwood.co.uk>
References: <0C7C6E1720E8D74FB52EBEF93649730A0116BF95@2k099exm01.compucom.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <0C7C6E1720E8D74FB52EBEF93649730A0116BF95@2k099exm01.compucom.local>
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
To: Josh.Berry@compucom.com
Cc: blueflux@koffein.net, netfilter@lists.netfilter.org

This looks possibly a bit outdated but it could be relevant...
http://www.tldp.org/HOWTO/BRIDGE-STP-HOWTO/practical-example.html

Josh.Berry@compucom.com wrote:
> Sure, send it over.  Is it possible to have some type of failover using
> the priority settings with the STP protocol?
> 
> -----Original Message-----
> From: Oskar Andreasson [mailto:blueflux@koffein.net] 
> Sent: Tuesday, September 30, 2003 1:38 PM
> To: Berry, Josh (jberry)
> Cc: netfilter@lists.netfilter.org
> Subject: Re: Linux HA with Bridge
> 
> Yes, as long as you are aware that connection states will not traverse
> over the heartbeat system, and that you will find yourself in a deep pit
> of trouble with the IPaddr script (at least the version I saw) that
> comes with heartbeat, and iptables =). IPaddr.sh runs with the help of
> interface aliases, which iptables can't handle.
> 
> I rewrote the IPaddr script for work a couple of months ago to get rid
> of the interface aliases, but when I was about finished we started to
> rethink the whole idea, and noticed that the whole script was flawed for
> our uses;).
> 
> In other words, if you want it, I could try and send it over, as long as
> you know that it is almost totally untested.
> 
> 
> On Tue, 30 Sep 2003 Josh.Berry@compucom.com wrote:
> 
> 
>>Is it possible to have a Linux-HA setup with a bridge.  Example
>>
>>
>>                     Internet
>>                         |
>>      |-------------- Switch ---------------|
>>      |                                     |
>>Bridge Interface                    Bridge Interface
>>      |                                     |
>>LinuxFirewall IP---- Heartbeat ----IP LinuxFirewall
>>	|						  |
>>Bridge Interface                    Bridge Interface
>>	|                                     |
>>	|-------------- Switch ---------------|
>>			       |
>>			    Network
>>
>>Josh Berry
>>Information Security Group
>>972-856-5402
>>
>>
>>
>>
> 
> 
> ----
> Oskar Andreasson
> http://www.frozentux.net
> http://iptables-tutorial.frozentux.net
> http://ipsysctl-tutorial.frozentux.net
> mailto:blueflux@koffein.net
> 


