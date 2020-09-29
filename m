From: Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com>
Subject: RE: NFTables: Can not add logs
Date: Tue, 29 Sep 2020 13:51:59 +0000
Message-ID: <VI1PR06MB463985DA59650DDCD9BDA406C5320@VI1PR06MB4639.eurprd06.prod.outlook.com>
References: <VI1PR06MB4639FCC3DB3457BD9B067E82C5320@VI1PR06MB4639.eurprd06.prod.outlook.com>
 <20200929100523.GA20140@breakpoint.cc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hitachi-powergrids.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZLGoo6JmYCD/sMSrQTrTJA1jfDLkUfSL0JPWFkF+4Y=;
 b=Woec7mevxk3pTLnM++zjdaQ8XGPp3MtNa6+KDAHT6DyDtZI15uPvOsxXfC+JcGUGskxO9FX+DRUe5HVNBP+UQY123buszpM5/HcMjZwhEIKcuBaoQXcqhmO+S+czg7uWDcDVz3XiSWFAbjJjtPLhmWsz6lrPJCidtHFXo7Zfvi0=
In-Reply-To: <20200929100523.GA20140@breakpoint.cc>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
To: Florian Westphal <fw@strlen.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

>Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com> wrote:
>> Hi
>>
>> I am trying to figure out why I sometimes lose connection during some te=
st activites.
>> Therefore I would like to use the logging option to see what has been dr=
opped.
>>
>> But I get:
>> nft add rule x y log
>> Error: Could not process rule: No such file or directory add rule x y=20
>> log
>^^^^^^^^^^^^^^^^^
>> CONFIG_NFT_LOG=3Dy
>
>Missing CONFIG_NF_LOG_IPV4?
Absolutely! Thx a lot.

Cheers
Andy
