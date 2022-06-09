From: Gordon Fisher <gordfisherman@gmail.com>
Subject: Re: Possibly dangerous interpretation of address/prefix pair in -s
 option
Date: Thu, 9 Jun 2022 13:28:47 -0700
Message-ID: <62A257FF.2060600@gmail.com>
References: <mail.629a20b0.7e37.7f80bf761b5d8a04@storage.wm.amazon.com>
 <CANGix0Ddy_BW5wgUbmEmMiJajs_FxEFRcYDPuzNL3aaBxnCtoQ@mail.gmail.com>
 <mail.629a519e.0cd7.3039eb4576cddb5d@storage.wm.amazon.com>
 <010201812aced64c-cfcce59b-f83c-4892-b6eb-43b9b0a2fc64-000000@eu-west-1.amazonses.com>
 <2ae6f4de-e03c-1fab-c1fa-68915b3837d8@netfilter.org>
 <mail.629aff89.73ff.3ae87c7606a48613@storage.wm.amazon.com>
 <010201812d7632b0-1fa6a570-192e-423c-ba87-558c0d650ac9-000000@eu-west-1.amazonses.com>
 <4df0f9c3-5617-e798-56d9-d24725250906@thelounge.net>
 <efe54ba7-fca1-e95-2ded-d83c5e144987@netfilter.org>
 <mail.629b6720.3649.7e2693125cedf4ea@storage.wm.amazon.com>
 <010201812f0adc45-929753b5-ff42-41a8-a922-fdb605cde46f-000000@eu-west-1.amazonses.com>
 <eef7aaa0-e8f4-2672-956b-47ec49547b33@netfilter.org>
 <mail.62a0b35b.5c1c.42faef732ab2e9b5@storage.wm.amazon.com>
 <0102018143bca3f1-ec4843ce-f6b1-464b-a9c6-ccd61b399815-000000@eu-west-1.amazonses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=nReyV9LTv2Aq01tc/EIXLJ00l8E4buD0jaAF1VFmk0Q=;
        b=oz2sbwgITMaPB3YgXGjJ8zkc0vN2XZi37XGl/c7fP5kZJzhv64TXb8MIJqRPbx+hig
         r0mQLpqBx4Pt+aT/fhMBIw6Kpt627h3e7EUqXJcKP9oubxX+ZVm7CPVtHkqTVWYgRjcR
         fkbMZfif9kSCt6Cyem2/Qynh+k7c5Ex9LWD241Yi7G/nnaqqpCmKeVu61BDvKqXam2E3
         4w2MitopXKrb7CvljPbyy0KwUVB8R0MWoSdBE0LxCqx8bW53uq6RKf6+73NF6chpKiw5
         ywIisdjEbwipsMPr9OHHIlJxx1zjX9RPnNFdJUjRifmgBZlfveJgw2GlgfH3bTj3g3qR
         4b/A==
In-Reply-To: <0102018143bca3f1-ec4843ce-f6b1-464b-a9c6-ccd61b399815-000000@eu-west-1.amazonses.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 6/8/2022 7:34 AM, Stefan Riha wrote:
>> The mask is unconditionally applied to the IP address.
> Yes. Note again that it is unconditionally applied by other programs too, yet they do not discard the full ip address. When I use 10.0.0.2/24 in the "Address=" keywork of a systemd-networkd configuration, then the the mask is used to compute a prefix route (which is automatically added if not otherwise declared). Yet the full Ip address is kept, and assigned to the nic.

This is a different context and meaning than the usage in `iptables`.

In `systemd-networkd`, that is a host address field, not a network 
address field, and that specifying a length, a la 10.0.0.2/24, is short 
hand for configuring IP address 10.0.0.2 with a mask 255.255.255.0 as 
this is for configuring an address on a network interface, which 
normally requires an IP address and a mask pair.

Where as in `iptables`, an address supplied to -d or -s is is a network 
address field that defaults to /32 when no length is specified, which is 
a single address.

It makes all the difference if the field if is a network field or an 
single address field.

-- 
gordonfish
