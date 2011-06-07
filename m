From: Erik Schorr <erik-lists@arpa.org>
Subject: Re: ipv6 link local address
Date: Tue, 07 Jun 2011 00:06:57 -0700
Message-ID: <4DEDCE11.3090004@arpa.org>
References: <92A9C99A1E5FF14F8538DDEE14996A5203341F@chp-exg.coxhp.com> <1307429067.7853.1.camel@hakkenden>
Reply-To: erik-lists@arpa.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1307429067.7853.1.camel@hakkenden>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org
Cc: "Nikolay S." <nowhere@hakkenden.ath.cx>

On 06/06/2011 11:44 PM, Nikolay S. wrote:
> =D0=92 =D0=9F=D0=BD=D0=B4, 06/06/2011 =D0=B2 21:47 +0000, bmcdowell@c=
oxhealthplans.com =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Hello list.  I'm updating my IBF (invisible bridging firewall) deplo=
yments, and I'd like to add support for ip6tables.  In the near-term, I=
'd like to '-P DROP' everything, but I'd rather not have to reinvent th=
e wheel once/when/if we start supporting this protocol in the DMZ.
>>
>> Everything seems to be moving along just fine, except the matter of =
the link local addressing.  While not specifically a netfilter issue, I=
 do wonder if anyone on the list has dealt with this in the past.  It s=
eems to my somewhat-limited understanding of the protocol that there's =
simply no way to filter ipv6 without 'speaking' it.  Even in my very ea=
rly days of learning ipv4 I could have specified a '0.0.0.0' address on=
 the interface, but ipv6 is designed from the ground up to prohibit thi=
s behavior.  Ostensibly for issues such as address allotment, any ipv6 =
enabled interface defaults to being able to converse with any other int=
erface on the same layer 3 link.  For an IBF this is potentially a bad =
thing, because now my unaddressable device is suddenly addressable, eve=
n if only to those on the same local link. The simplest example scenari=
o I can imagine is a compromised FTP/Web server speaking to a vulnerabl=
e iptables firewall and re-writing the rules it carries.
>>
>> While I can certainly firewall off this traffic easily using netfilt=
er today, I'll not be able to do that forever.  The moment I allow link=
-local traffic I'll be exposing my bridge interfaces to the same.  Assu=
ming netfilter is never down or misconfigured seems to be a fatal conce=
it.
>>
>> Thoughts?
>>
>>
>
> You can turn off ipv6 on interfaces. This should not prevent bridging
> ipv6, but will remove any ipv6 logic from them.

I wish I'd known this.  Could you give an example of how to remove ipv6=
=20
functionality from an interface?  I think this was the only thing=20
preventing me from unloading an accidentally-loaded ipv6.ko module.

--=20
Erik Schorr KD6AUT
Advocate and Consultant
VMware/Iptables/Exim/Perl
