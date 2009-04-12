From: my mail <amfpg@yahoo.com>
Subject: Re: question about table filter, nat and mangle with chain default policy
Date: Sun, 12 Apr 2009 03:00:46 -0700 (PDT)
Message-ID: <965661.5152.qm@web46111.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1239530446; bh=fNVY1mk+tKXu/b3IFznzsMIee8Sn+rlNkOpEHA4a/mY=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=opoo62gwHHO1mqV8690DDTTlvXgc2DqO4ACnIGKdALvO4pLg4IhIhDl+JKXFM7d3zCi6y05VsSPqKjl3QAVHQgrBtz2eh32vE58ilMzmm1lb+5SqgUEcbK5Kkr3iFfnvxZA/g7hEXnbqQYpX6GTKvFV8VQHGSc2uaT39baB6yUI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org



--- On Sun, 4/12/09, Mart Frauenlob <mart.frauenlob@chello.at> wrote:

=46rom: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: question about table filter, nat and mangle with chain def=
ault policy
To: netfilter@vger.kernel.org
Date: Sunday, April 12, 2009, 7:11 AM

>=A0=A0=A0
> Don't set the policy to DROP in mangle and nat table.
> Put the drop policy only in filter table.

> greets

> Mart

thanks for your help, but why i can't set policy DROPT in mangle and na=
t table?
is the mangle and nat table share chain with filter table or why?

because as i remember process from INPUT will not pass the rule for OUT=
PUT and FORWARD

it's right or i have wrong from understand the iptables rule?

thx again...


     =20

