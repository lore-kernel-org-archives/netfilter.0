From: Scott Bronson <bronson@rinspin.com>
Subject: Re: Why isn't DNAT happening for host-originated packets?
Date: Mon, 14 Dec 2015 13:06:56 -0800
Message-ID: <CAKmUPx7kNePHQ1TnbSui9NK-wjouN=y5nN8=63xCOgQgY_xuwA@mail.gmail.com>
References: <CAKmUPx5kE+v03OGAjF32rOGyVQfOLbSmyTEOOK9uApANeWbU1A@mail.gmail.com>
	<5660CCD1.60807@familie-kuntze.de>
	<CAKmUPx44yvsz21jRE9BoxK0D4R+gGjJdk9De5QQHUBzj6o9r6Q@mail.gmail.com>
	<5660D6D3.8040205@familie-kuntze.de>
	<CAKmUPx4jX4wyK10jR9Qr0DEPveRG5kOoLnuScpLgWE78DRXtyw@mail.gmail.com>
	<CAKmUPx6yaQdb1OE6CSf0TQ=eZYV=eX7Kmdzg-x6nVPtxtMpLEA@mail.gmail.com>
	<5660DFC7.9040206@familie-kuntze.de>
	<CAKmUPx5751FXOkBBhcxUKPBwq2cQrBSkoYX4JGJfy-UZE9+Vmw@mail.gmail.com>
	<5662B8BD.1040908@plouf.fr.eu.org>
	<CAKmUPx63JOfQ2Qv7JBu+b70c_oCWJF=cbnfxJfD7qs=tsEok1Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rinspin-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=fY7KUkEullRQ22aihfJaLS/zHG1i5othWqoS3nPcZ8k=;
        b=pVjUCCablia5GBsCYvFRLml3iqL9XLe9HydbKf7IGDxPq0+D9D8IG/4E5nwM8yQ58a
         cH4V3Ac20MMRAxAhbPiHlu9PFcRdl9XcqLuZnA3hzSCORW69U4o7m3y3S+B51fle4JkD
         SKwiCxtaPabN7Y744xTzpU8AZzlXZgw+++JPy+RGMOhbNqVVvnBs13Mhk+obLySEBN4b
         OGt7JVd0C2ywp53sNxKAbmEISdD6Ti+HfFy9u/aVGnO+PJNGNs3b8iYD+r7VWtS8FSGm
         hyncjAXTm35QQPkn/e3DFBkuh9VgT0w3hwYUCilJXg/w7uT3MGGh8X4fqHn7HyhnUgs+
         SFeQ==
In-Reply-To: <CAKmUPx63JOfQ2Qv7JBu+b70c_oCWJF=cbnfxJfD7qs=tsEok1Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: Noel Kuntze <noel@familie-kuntze.de>, netfilter@vger.kernel.org

Finally got a chance to code up this fix:

https://github.com/bronson/libvirt-hook-qemu/tree/hostfix
https://github.com/bronson/libvirt-hook-qemu/blob/hostfix/qemu#L67-L95

Works great.  Thanks Noel and Pascal.  Now I need to work on the
disappearing packet.

On Mon, Dec 7, 2015 at 4:53 PM, Scott Bronson <bronson@rinspin.com> wrote:
> On Sat, Dec 5, 2015 at 2:13 AM, Pascal Hambourg <pascal@plouf.fr.eu.org> wrote:
>> It's not handled specially /per se/.
>> It's a side effect of how conntrack and NAT work. The conntrack confirm
>> takes place at the end of POSTROUTING, and no new NAT rule can be
>> applied on a confirmed connection.
>>
>> The same applies to packets belonging to an established connection :
>> they all skip the nat chains.
>
> That makes sense (assuming PREROUTING above).  Thanks, this seems
> way less arbitrary.
>
>
>> The special thing in the loopback path is that there is no need for an
>> input routing decision after PREROUTING. So, what would happen if you
>> could actually DNAT the packet ?
>
> I would like to change its destination, then have the routing decision after
> PREROUTING send the packet somewhere else.
>
> Just because it arrived local doesn't mean I want it to stay local!
>
> But that's no big deal.  I'm making the PREROUTING+OUTPUT
> chain modifications now, everything looks OK to me.
