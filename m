From: Scott Mayo <sgmayo@mail.bloomfield.k12.mo.us>
Subject: Re: Dropping a specific Owner from a certain IP
Date: Tue, 07 Sep 2004 16:05:16 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <413E228C.5020707@mail.bloomfield.k12.mo.us>
References: <413E1004.5020808@mail.bloomfield.k12.mo.us>
	<1094589164.1890.59.camel@wolfpack.ljm.dom>
Reply-To: sgmayo@mail.bloomfield.k12.mo.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094589164.1890.59.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Jason Opperisano wrote:

> On Tue, 2004-09-07 at 15:46, Scott Mayo wrote:
> 
>>I have my filter set up with 1 internal nic and 1 external nic.  My 
>>workstations are addressed 10.0.0.1-10.0.255.255 with a subnet of 
>>255.255.0.0.  My filter 10.0.0.1 has Dansguardian and Squid/Squidguard 
>>which authenticates through my Samba server 10.0.0.5.
>>
>>I have a generic user 'user' that I give to a lab in the elementary 
>>(10.0.8.1-10.0.8.255).  Is there some way that I can stop that generic 
>>login from being used from anywhere else?  I tried the following, but it 
>>did not do anything.
>>
>>iptables -A OUTPUT -m owner --uid-owner 10000 -s ! 10.0.8.0/24 -j DROP
>>
>>10000 is the uid of 'user' on my samba server.  Is the uid actually 
>>pulled from the filter server?  If so then I guess that I cannot do this.
>>Thanks for any info.
> 
> 
> apply this filter in dansguardian.  it's the only thing in this scenario
> that knows both the src ip and username--it should be able to force them
> to be paired up.  i do this with squid+squidguard for a similar setup as
> yours...never used dansguardian myself, so i can't get all OT on this
> one...

Dansguardian does not have ACL's so it is impossible there. I can either 
block an ip or block a user, but not on both.  Once Dansguardian hands 
the information back to squid/squidguard (which does have the acls that 
I need), then all I have for an ip is the internal nic of the computer 
so once again I do not have any ip info.

I guess that I will have to setup another occurence of squid so that I 
can use it for acls only, go to dansguardian and back to my other 
occurence of squid which will be used for the cache.
Thanks for the input.

-- 
Scott Mayo
Technology Coordinator
Bloomfield Schools
PH: 573-568-4564
FA: 573-568-4565
Pager: 800-264-2535 X2549

WindowS
     LinUX!

Duct tape is like the force, it has a light side and a dark side and it
holds the universe together.

