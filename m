From: santosh prasad nayak <santoshprasadnayak@gmail.com>
Subject: Re: [PATCH 2/3] netfilter: potential null derefence.
Date: Thu, 1 Mar 2012 15:53:29 +0530
Message-ID: <CAOD=uF5O=VJheUhxg7zadpq8p+bqa_M2jiKE1mqLXz6JJps-sg@mail.gmail.com>
References: <1330593434-19275-1-git-send-email-santoshprasadnayak@gmail.com>
	<20120301102136.GB6488@1984>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=EA1ycbqDLSAnXOhmmeYeIS6WVvBfPhyAySTCV1idxhY=;
        b=UBCEzHaSrMP2uAbN5TdP1vXxvuhB5OwNwbZP4/1b1iKrCLfXFFWfqfZ92gh/rX8l5B
         xXzyTDK6ViK4s4YBR4ScjcdUx4kvGhEXN5ftcpIFsWgMO9gsXiB4G1UDwFB+4N+Jq7V3
         jwYYoU1mZVl6JfyKKlZzLY/KM6Wv4Q+bGyoVw=
In-Reply-To: <20120301102136.GB6488@1984>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: bart.de.schuymer@pandora.be, kaber@trash.net, shemminger@vyatta.com, davem@davemloft.net, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, bridge@lists.linux-foundation.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Pablo,

Please look at the last line of my patch.
I have added a new label "out"

regards
santosh

On Thu, Mar 1, 2012 at 3:51 PM, Pablo Neira Ayuso <pablo@netfilter.org>=
 wrote:
> On Thu, Mar 01, 2012 at 02:47:14PM +0530, santosh nayak wrote:
>> From: Santosh Nayak <santoshprasadnayak@gmail.com>
>>
>> I am getting following error.
>> " net/bridge/netfilter/ebtables.c:269 ebt_do_table()
>> =A0 error: potential null derefence 'cs'"
>>
>> =A0 =A0 i =3D cs[sp].n; =A0// If cs =3D=3D Null then this will cause=
 problem.
>>
>> Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
>> ---
>> =A0net/bridge/netfilter/ebtables.c | =A0 =A05 ++++-
>> =A01 files changed, 4 insertions(+), 1 deletions(-)
>>
>> diff --git a/net/bridge/netfilter/ebtables.c b/net/bridge/netfilter/=
ebtables.c
>> index f3fcbd9..9c0f177 100644
>> --- a/net/bridge/netfilter/ebtables.c
>> +++ b/net/bridge/netfilter/ebtables.c
>> @@ -209,8 +209,10 @@ unsigned int ebt_do_table (unsigned int hook, s=
truct sk_buff *skb,
>> =A0 =A0 =A0 =A0 =A0smp_processor_id());
>> =A0 =A0 =A0 if (private->chainstack)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 cs =3D private->chainstack[smp_processor=
_id()];
>> - =A0 =A0 else
>> + =A0 =A0 else {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 cs =3D NULL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>
> There is no "out" label in ebt_do_table !!
