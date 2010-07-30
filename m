From: Elmar Stellnberger <estellnb@gmail.com>
Subject: Re: block network access for certain users/groups
Date: Fri, 30 Jul 2010 22:10:17 +0200
Message-ID: <AANLkTini081q41=oHEoSgQQ+YGN5NEkvuDhU7MBWguhV@mail.gmail.com>
References: <op.vgmcupy42qajpl@imac.local>
	<4C51D771.1080904@gmail.com>
	<alpine.LSU.2.01.1007301036310.27811@obet.zrqbmnf.qr>
	<4C52B8D4.30207@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=d2CuNOhMDEOXpv/kjJdcthQEVrkymegFesDmTCGEIKs=;
        b=Z9ITIK9rvBGSEvwzgFnsL7MhhqgW21XUb+NqdoiFklN27WmFpN6zekDRjM1WcG7NYq
         clOX7vbjovUegbBubftcnBhap10/aG467mFttMx2jXBPutgpYeyfcjp9tncdkP5YEF1T
         1qq1YaFmouO74N5gSws0cKiboUtr1TuD5mqGI=
In-Reply-To: <4C52B8D4.30207@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Lars Nooden <lars.curator@gmail.com>, jengelh@medozas.de, arimus.uk@gmail.com, netfilter@vger.kernel.org

Promptly stated we have the following two problems:
* The --uid-owner and --gid-owner flags may only be specified in the
output chain (as the man page says).
  However to block all network traffic for a certain user we do also
need it in the input chain.
  Curiously we can log the user who is going to receive a package but
we can not select for this.
* The --gid-owner iptables-rule is apparently ineffective for
http-access (lynx localhost:631).
   It is the first rule and would be expected to reject any package
with the specified gid.

Jan Engelhardt & Lars Nooden:
Thxs for your advice.
Using Reject would for sure be the cleaner solution as Drop only lags
for normal app. users and does not help against professional
portscans.
Nonetheless our primary goal here should be to block all network
access for a certain user and only for this user.
The idea is to run programs which do not need network access under the
specified user id (as apache runs under wwwrun).

Richard Horton:
I have connected with lynx to cups (localhost:631).
Lynx does not have the suid-group id bit set so the group should not ch=
ange.

Lars Nooden & Richard Horton:

As you can see my rule is the first to execute (It is on the right
place but obviously does not work right):
>iptables -L -v
Chain OUTPUT (policy ACCEPT 1 packets, 52 bytes)
 pkts bytes target     prot opt in     out     source
destination
 8683  506K user_spec  all  --  any    any     anywhere
anywhere
    0     0 ACCEPT     all  --  any    lo      anywhere
anywhere
 8682  506K ACCEPT     all  --  any    any     anywhere
anywhere            state NEW,RELATED,ESTABLISHED
    1    52 LOG        all  --  any    any     anywhere
anywhere            limit: avg 3/min burst 5 LOG level warning
tcp-options ip-options prefix `SFW2-OUT-ERROR '

Chain reject_func (0 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 REJECT     tcp  --  any    any     anywhere
anywhere            reject-with tcp-reset
    0     0 REJECT     udp  --  any    any     anywhere
anywhere            reject-with icmp-port-unreachable
    0     0 REJECT     all  --  any    any     anywhere
anywhere            reject-with icmp-proto-unreachable

Chain user_spec (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 DROP       all  --  any    any     anywhere
anywhere            owner GID match app
=2E..

Nonetheless the rule is there and being executed:
> ping localhost
ping: sendmsg: Operation not permitted
ping: sendmsg: Operation not permitted
ping: sendmsg: Operation not permitted
PING localhost (127.0.0.1) 56(84) bytes of data.

--- localhost ping statistics ---
3 packets transmitted, 0 received, 100% packet loss, time 2000ms



2010/7/30 Lars Nooden <lars.curator@gmail.com>:
> On 07/30/2010 12:00 PM, Jan Engelhardt wrote:
>>
>> Ref: http://marc.info/?l=3Dnetfilter&m=3D128043201731932&w=3D2
>>
>> On Thursday 2010-07-29 21:33, Lars Nooden wrote:
>>> On 7/29/10 10:09 PM, Elmar Stellnberger wrote:
>>>> iptables -A mychain -m owner --gid-owner blockedusergroup -j DROP
>>>
>>> For starters, consider using the REJECT target instead of DROP if f=
or no other
>>> reason than that it will make your engineering easier:
>>>
>>> =A0 =A0 =A0http://www.chiark.greenend.org.uk/~peterb/network/drop-v=
s-reject
>>
>> That page - especially the summary - is leaving out one essential fe=
ature
>> G=E1spar already mentioned it in another thread; the CHAOS target fr=
om
>> Xtables-addons.
>
> CHAOS and TARPIT look about the same as DROP in regards to the questi=
on
> of REJECT vs DROP. =A0The same arguments apply about a quick response=
 from
> the filter or not.
>
> =A0http://www.chrisbrenton.org/2009/07/why-firewall-reject-rules-are-=
better-than-firewall-drop-rules/
>
> =A0http://www.chiark.greenend.org.uk/~peterb/network/drop-vs-reject
>
>
> /Lars
>
