From: Patrick McHardy <kaber@trash.net>
Subject: Re: [ANNOUNCE] Release of iptables 1.4.0rc1
Date: Wed, 17 Oct 2007 10:38:28 +0200
Message-ID: <4715CA04.9080708@trash.net>
References: <47139AD0.8060002@netfilter.org> <slrnfh7f7l.crr.petr.pisar@album.ics.muni.cz> <471479F5.4000002@trash.net> <Pine.LNX.4.64.0710161659080.10197@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0710161659080.10197@fbirervta.pbzchgretzou.qr>
Sender: netfilter-devel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: Petr Pisar <petr.pisar@atlas.cz>, netfilter@vger.kernel.org, Netfilter Development Mailinglist <netfilter-devel@vger.kernel.org>

Jan Engelhardt wrote:
> On Oct 16 2007 10:44, Patrick McHardy wrote:
>>
>> static int parse_counters(char *string, struct ip6t_counters *ctr)
>> {
>> -	return (sscanf(string, "[%llu:%llu]", (unsigned long long *)&ctr->pcnt, (unsigned long long *)&ctr->bcnt) == 2);
>> +	u_int64_t *pcnt, *bcnt;
>> +
>> +	pcnt = &ctr->pcnt;
>> +	bcnt = &ctr->bcnt;
>> +	return (sscanf(string, "[%llu:%llu]", (unsigned long long *)pcnt, (unsigned long long *)bcnt) == 2);
>> }
> 
> This is also wrong (even though it may work in practice), since unsigned long
> long does not necessarily need to be 64 bit (it may be larger, and if so,
> you'll smash the stack).
> What you want is:


Indeed, that is obviously wrong. I'll fix that and the other occurences.
