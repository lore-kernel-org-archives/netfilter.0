From: Daniel Reurich <daniel@centurion.net.nz>
Subject: Re: nf_nat_sip with CT target
Date: Fri, 15 Feb 2013 08:08:36 +1300
Message-ID: <511D3634.2060809@centurion.net.nz>
References: <511C16B6.3000607@centurion.net.nz> <20130214130556.GA3788@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20130214130556.GA3788@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On 15/02/13 02:05, Pablo Neira Ayuso wrote:
> On Thu, Feb 14, 2013 at 11:41:58AM +1300, Daniel Reurich wrote:
>> Hi,
>>
>> I'm having trouble figuring out how to set up nf_nat_sip when using
>> the CT target for loading nf_conntrack_sip.
>>
>> The CT target for sip works fine.
>>
>> What I'm struggling with is finding any documentation that indicates
>> how to add the fucntion of nf_nat_sip as well.
>>
>> Do I still need to manually load the nf_nat_sip module or can it be
>> loaded by the conntrack helper or some similar method?
>
> modprobe nf_nat_sip should be enough.
>
I was under the impression that manually loading the modules was 
deprecated and they should autoload either via using a helper or the CT 
target.

Will nf_nat_sip just detect whether a sip connection needs to be NATed 
due to it's hitting the standard SNAT rule for that route, or do I need 
to create a nat table entry specifically for the sip connection with 
some other parameters such as -m helper --helper nat-sip ....

Just loading the nf_nat_sip doesn't seem to be enough.



-- 
Daniel Reurich
Centurion Computer Technology (2005) Ltd.
021 797 722
