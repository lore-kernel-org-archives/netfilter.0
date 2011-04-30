From: Mike Hendrie <mike@hendrienet.com>
Subject: Re: Proxy Filter iptable Settings
Date: Sat, 30 Apr 2011 12:47:40 -0500
Message-ID: <BANLkTincTDu1QiYeiYzVV7+1VUqyv-Q6aQ@mail.gmail.com>
References: <BANLkTin=W-MWbPfrpqnmWDCMq9fGp5CvwQ@mail.gmail.com>
	<1303885014.18916.10.camel@andybev-desktop>
	<BANLkTikUnSoefT3Xy=O+43zWGEw3tgb7wQ@mail.gmail.com>
	<4DB80945.8040304@atc.tcs.com>
	<BANLkTiky5xV9yhr-1nq7cLOSmV1nGt=cKg@mail.gmail.com>
	<4DB817A5.3020604@atc.tcs.com>
	<BANLkTi=y37mzCOenHg8EbR_u9PpoTVceGA@mail.gmail.com>
	<4DB90AE6.9070909@atc.tcs.com>
	<BANLkTikM3czG=D7yq3UHhQdt-pUcjpbKSA@mail.gmail.com>
	<1304150575.1579.15.camel@andybev>
	<20110430165041.GN2976@cardinal>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110430165041.GN2976@cardinal>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Trying to apply:
iptables -t nat -A POSTROUTING -o $ext_IF -j MASQUERADE

I get the following error -
Bad argument `MASQUERADE'
Try `iptables -h' or 'iptables --help' for more information.

It does not like the command you suggested.....

Mike

On Sat, Apr 30, 2011 at 11:50 AM, /dev/rob0 <rob0@gmx.co.uk> wrote:
> On Sat, Apr 30, 2011 at 09:02:55AM +0100, Andrew Beverley wrote:
>> On Thu, 2011-04-28 at 16:43 -0500, Mike Hendrie wrote:
>> > All users can get to Google and do searches just fine. I am
>> > having funny issues with the a couple of application.
>> >
>> > I do not understand why I am having the below issues. Could this
>> > be because of the iptables?
>>
>> Probably, although I would say more accurately because of UFW.
>> It's quite difficult to diagnose problems with automatically
>> generated iptables rules.
>
> Indeed, and users of such rulesets should be asking elsewhere (at the
> provider of the ruleset) for support.
>
>> I would say you are better off disabling UFW, and starting with
>> just the rules you need to get everything working:
>
> Yes, but iptables-restore(8) is the recommended means to apply a
> ruleset.
>
>> # Flush all tables
>> iptables -t nat -F
>> iptables -t mangle -F
>> iptables -t filter -F
>>
>> # Set the default policy to ACCEPT:
>> iptables -P PREROUTING ACCEPT
>
> The default table, filter, does not have a PREROUTING chain.
>
>> iptables -P INPUT ACCEPT
>> iptables -P OUTPUT ACCEPT
>> iptables -P FORWARD ACCEPT
>> iptables -P POSTROUTING ACCEPT
>
> The default table, filter, does not have a POSTROUTING chain.
>
>> # Enable packet forwarding:
>> echo 1 > /proc/sys/net/ipv4/ip_forward
>>
>> # Setup NAT:
>> iptables -t nat -A POSTROUTING -o $ext_IF -j MASQUERADE
>>
>> Once that works, you can then start blocking ports.
>>
>> > - There is FileMaker application that uses ports 5000 - 5005 to
>> > connect to an external server that cannot find the external server=
=2E
>> > ??StatefulNAT translation.??
>>
>> Looking at the following website, you'll need to allow more than jus=
t
>> those ports:
>>
>> http://sixfriedrice.com/wp/filemaker-firewall/
>>
>> But, as above, get the firewall working with all ports open, and
>> then start closing them.
>
> Otherwise I agree with what you have said.
> --
> =A0 =A0Offlist mail to this address is discarded unless
> =A0 =A0"/dev/rob0" or "not-spam" is in Subject: header
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
