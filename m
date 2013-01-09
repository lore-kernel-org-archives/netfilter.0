From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: Deleting subnet range from conntrack
Date: Wed, 09 Jan 2013 15:50:01 +0200
Message-ID: <50ED7589.6050900@ngtech.co.il>
References: <026801cded4b$cda64b10$68f2e130$@telsatbb.vu> <20130108035050.GA19114@1984>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20130108035050.GA19114@1984>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: "Steve (Telsat Broadband)" <steve@telsatbb.vu>, netfilter@vger.kernel.org

Hey there,

A simple script that will invoke all conntrack sessions can do that and 
it is not really advised to do that in a very busy gateway or allow 
users trigger such event freely.

How exactly a AUTH processing listener works on data-grams? Just wondering?

In most cases UDP should be dropped to prevent this kind of issues.

Regards,
Eliezer

On 1/8/2013 5:50 AM, Pablo Neira Ayuso wrote:
> Hi Steve,
>
> On Tue, Jan 08, 2013 at 01:56:48PM +1100, Steve (Telsat Broadband) wrote:
>> Hi All,
>>
>> As part of a walled gateway I have written, the gateway is listening on both
>> TCP and UDP for incoming connections.  For TCP, the connection is picked up
>> and authenticated and allowed to proceed through the gateway; this all
>> appears to work normally; however, under UDP, the unauthenticated data is
>> sent to the auth processing listener via a NAT 'REDIRECT' command.  This
>> command then authenticates the data, BUT the problem is that UDP data still
>> continues to be redirected to the auth processor even after authorisation.
>>
>> If have found that if I run a 'conntrack -D -s xxx.xxx.xxx.xxx' on the IP in
>> question, the UDP data then flows through as expected.  The problem is, that
>> for some instances, I'm needing the authorise/permit a subnet or network
>> xxx.xxx.xxx.xxx/xx or and IPv6 subnet and it appears that conntrack doesn't
>> support this.
>>
>> Is there a way to get around this and delete conntrack entries for the
>> subnet?
>
> Unfortunately not yet. But it is doable.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
