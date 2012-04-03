From: DIGVIJAY SINGH <digvijay09020@iiitd.ac.in>
Subject: Fwd: Build arptables target extension module
Date: Tue, 3 Apr 2012 08:56:20 +0530
Message-ID: <CA+EzgVTb851Cb+FAvrVr4icKpwNKM0BAcPysaU1YKuhDwb1VpQ@mail.gmail.com>
References: <CA+EzgVTduzG+RiuAWCWebs002+x_VTLFKk1EXZERABYtBHYrWA@mail.gmail.com>
	<CAAjRDhY4eKGE9ULbhH274zrbBe1ubqfBmRJqvahWLHx0_MZLLQ@mail.gmail.com>
	<CA+EzgVSTLby9n1tSBx0d1hXSNE++a4haYLQKFB-i0gDrZS4KAg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=eFVL8ZaQCt6eFVVXkEv97QEXcY2JOI6oaC2RzyufwB4=;
        b=iBofuq0TRQSKG8jK7aqyk5hDLrVk4ylLJ8DnNW2U2J97tW8Jq3IUQ/+H3fLcZd5GEY
         XvF9ewPfyrcf6vVaSiHxuFAm+I/dznwd5IVd1JWU+9hMumyQ+6567fvxNXD3qzwclobb
         lIB8NyODo0ysbRZNOkEI6gcDBBWaiOo8VEWZk=
In-Reply-To: <CA+EzgVSTLby9n1tSBx0d1hXSNE++a4haYLQKFB-i0gDrZS4KAg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hey Brendan!
I'll clarify what I am trying to do. I have a pc in a LAN. I need to
redirect all my outgoing traffic to different pcs over the lan.(The
thing is that of all the pcs which I have selected only 1 of them
should receive one packet). These pcs will direct all my traffic to
the required destination.

This is what I have figured out: Since I need to re-direct my outgoing
traffic to different PCs I'll have to work my way on the Layer 2. So
arptables is probably the best way to do it. Secondly I need to create
a target extension which takes the first frame and sends it over to
pc1, takes the second =A0frame and sends it to pc2 and so on.(Obviously
once the total number of pcs are over, it loopbacks). This is
something like the nth patch in iptables but not the same.

=46inally once I build this target extension I would like to build it.
So that I can use it in arptables.

This is what it is.

Yours,
Digvijay

On Mon, Apr 2, 2012 at 10:52 PM, Brendan Morrison
<morrison.brendan17@gmail.com> wrote:
> hey what are you trying to do exactly
> ive just finished writing a few netfilter modules to do custom packet
> proccesing and might be able to lend a hand
> -brendan
>
> On Mon, Apr 2, 2012 at 1:17 PM, DIGVIJAY SINGH <digvijay09020@iiitd.a=
c.in>
> wrote:
>>
>> Hey there!
>> I wanted to build a target extension module I have created. But I
>> cannot find any How-TOs or tutorials. I went through Jengelh Medozas
>> "Writing Netfilter Modules" guide, however it seems have skipped the
>> entire section of how to build the target extension. So it would be
>> great if someone could guide me through it.
>>
>> Yours truly,
>> Digvijay Singh
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
>
