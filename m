From: Jesse Molina <jesse@opendreams.net>
Subject: Re: How do we arp for NAT?  Secondary IPs, proxy arp? something else?
Date: Sun, 24 May 2009 14:15:06 -0700
Message-ID: <4A19B8DA.8020108@opendreams.net>
References: <4A19235F.4070306@opendreams.net> <20090524164956.6f3fa24e@catlap>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090524164956.6f3fa24e@catlap>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


Assume we have no control over the services -- they pick any old IP (and 
I assure you, they do, this isn't just academic) from that public-facing 
IP physical interface and start using ephemeral ports, which then can 
conflict with RPC or whatever for the SNAT/DNAT host that the IP is 
supposed to exclusively support.

Furthermore, let's say that an upstream firewall counts packets from 
source/destination IPs for the purposes of auditing traffic.  By a local 
service on the GNU/Linux firewall using these IPs that they are not 
supposed to, it creates the false illusion that the host for which the 
IP is supposed to be exclusively used for is sending/receiving traffic. 
  If we had such upstream filtering going on, this could even 
permit/deny traffic unintended from policy.

There might be some other unintended consequences that I've not thought 
of.  Either way, it just seems wrong that there isn't a way to do this 
if GNU/Linux is going intended to be used as a modern fully featureless 
firewall that can perform NAT/PAT.



M**** K**** wrote:
> Hello,
> 
>> The problem with this is that the firewall itself runs some services
>> and they have the potential to use these secondary IPs as their
>> ...
>> It seems like using these secondary addresses is not the right thing to
>> do.
> 
> One non-invasive approach is to launch local services on firewall box
> specifying bind address (0.0.0.0 is default and binds to all
> addressess).
> 
> Method mentioned by Tore Anderson is the cleanest way out, but you'd
> have to persuade your upstream provider to route a subnet of public IPs
> throu your firewall box. This way you wouldn't have to assing secondary
> addresses for SNAT/DNAT to work.
> 
> Cheers,

-- 
# Jesse Molina
# Mail = jesse@opendreams.net
# Page = page-jesse@opendreams.net
# Cell = 1.602.323.7608
# Web  = http://www.opendreams.net/jesse/


