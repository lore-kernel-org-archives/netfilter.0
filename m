From: Victor Julien <lists@inliniac.net>
Subject: Re: state match is obsolete 1.4.17
Date: Tue, 15 Jan 2013 10:54:07 +0100
Message-ID: <50F5273F.5020205@inliniac.net>
References: <CAMD-=V+PhM3NLpWyxB0G4KUN6D+-XKL0PZCBAuyUXUw56gmuJw@mail.gmail.com> <alpine.LNX.2.01.1301150958390.16853@nerf07.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1301150958390.16853@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@inai.de>
Cc: Nick Edwards <nick.z.edwards@gmail.com>, netfilter@vger.kernel.org

On 01/15/2013 10:11 AM, Jan Engelhardt wrote:
> 
> On Tuesday 2013-01-15 06:09, Nick Edwards wrote:
> 
>> WARNING: The state match is obsolete. Use conntrack instead.
>>
>> Getting these errors since upgrading to 1.4.17
> 
> It is a warning, not an error. (An error would not let use you
> the command at all.)
> 
>> Am I right in assuming that :
>> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>> must now become :
>> iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
>> or does that not do the same thing?
> 
> state is a redundant subset of conntrack (the latter was introduced around
> Linux 2.5.32) and shall go away.

I think removing it is a bad idea. For years and years all docs, books,
tutorials and frontends (like my own) have worked with "state". The
change seems so trivial "s/-m state --state/-m conntrack --ctstate/g"
that it would appear keeping "state" around as an alias or compatibility
layer would require minimal effort. Why not keep it around?

-- 
---------------------------------------------
Victor Julien
http://www.inliniac.net/
PGP: http://www.inliniac.net/victorjulien.asc
---------------------------------------------

