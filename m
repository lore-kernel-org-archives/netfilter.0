From: Petr Pisar <petr.pisar@atlas.cz>
Subject: Re: conntrack can't delete more conntrack records
Date: Tue, 11 Mar 2008 14:26:35 +0000 (UTC)
Message-ID: <slrnftd5kr.s7n.petr.pisar@album.ics.muni.cz>
References: <slrnftb46h.vkl.petr.pisar@album.ics.muni.cz> <47D67370.6000103@netfilter.org>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On 2008-03-11, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> Petr Pisar wrote:
>> Hello,
>> 
>> I'm trying to remove all conntrack records for one source IP address. If
>> I specify only source IP address it will fail:
>> 
>> $ conntrack -D -s 10.0.0.179
>> Operation failed: such conntrack doesn't exist
>
> This is not supported yet but it will in the next release 0.9.7.

Great to hear it.

If somebody would interest in ugly work around, following bash script
does the hard work:

conntrack -L -s "$SRC" | \
        sed  's/\([^ ]*\).*src=\([^ ]*\) dst=\([^ ]*\) sport=\([^ ]*\) dport=\([^ ]*\) src=.*/conntrack -D -s \2 -d \3 -p \1 --sport \4 --dport \5/'| \
        while read; do eval "$REPLY"; done


-- Petr

