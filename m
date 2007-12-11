From: "Oscar N" <oscar@linnea.net>
Subject: Re: interfaces in /proc/net/ip_conntrack
Date: Tue, 11 Dec 2007 09:03:01 +0100 (CET)
Message-ID: <29992.83.227.11.179.1197360181.squirrel@mh.linnea.com>
References: <26618.83.227.11.237.1197308966.squirrel@mh.linnea.com>
    <475DCD66.5080102@rtij.nl>
Reply-To: oscar@linnea.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <475DCD66.5080102@rtij.nl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> Oscar N wrote:
>> Are the interfaces saved in any way in a session or is it only ip src,
>> dst
>> and ports that are saved and matched against?
>>
>> Why I ask is because what happens if I configure a linuxbox as two
>> virtual
>> firewall with same nets being used on different vlans. Will all the
>> sessions be separate or will they sometimes "merge" if it happens to be
>> the same IPs and ports in two sessions.
>>
>
> Interfaces are not used, not in this sense. In fact, this is a feature.
> It allows asymetric routing, where packets go out through one interface
> and the return packets arrive at a different interface.
>
> I would use two physical or virtual machines, as the risk you describe
> is real, if remote.
>
> HTH,
> M4
>
>

Thanks for the answer, I guess it would work that way because interfaces
aren't shown in /proc/net/ip_conntrack.

The whole idea was to create multiple firewalls of one linuxbox, not only
2 but 20 or something like that.

One solution is ofcourse to don't run connection tracking at all, but it
would be nice to get it to work. Do anyone know if this would be way to
much work to implement? Otherwise I might get some time over to play with
this.

/Oscar

