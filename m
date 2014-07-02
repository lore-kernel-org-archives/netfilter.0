From: Jonathan Johnson <ecybernard@gmail.com>
Subject: Re: errors found in nftable docs on wiki
Date: Tue, 1 Jul 2014 23:44:33 -0500
Message-ID: <CALLvB8KbqmQT1YQLj9D8mD=wuxW4CY6DkWirP8za4iPZ067d0Q@mail.gmail.com>
References: <CALLvB8LPbBQpGD-QAmPW3L9GT6CYZ2TAMh+E9koYBq7OWBUCkw@mail.gmail.com>
 <20140629101250.GA3615@localhost> <CALLvB8K7dnprfQdozF1RCsUhiy_hjp3A09T8M9U+BRVNkKA+Gg@mail.gmail.com>
 <CAOkSjBhBVBLHWWNRC7qZrks0ug_qQ8RH9g_gJQGDA6vZPcNqLA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=yxN72rqNOr0isgfyDE/S0MG9I1FS+JwFua5DH8mz1Xw=;
        b=GVOL34qJo8E1o51Bi7Oxcc0YOeM0j+CD3hw3JE2vHFdjymKPObQ3pUbj/nB3zmp0wz
         47jnruHW85NsHfFRsXfNX5OB9GTltSCBcYPkUKFpVck4JBHMeIMWgdK+quQVkBBS37wt
         GL0a0mmmbX12/lSUo4XEkzbiZtQ17Yg/fgu/YP0aofzCOTKfgqKVUs9ptwHw7rMDhfQ7
         IFrchmAIoef1kETssBrfW8erXdCCUQV4mpPiTlA+wocCvGC7XDpEFQMvmCM2DYo6B53G
         h+rcVPWFu5y2kv3s5WDlVIhvFbnWx/UOb+fxwT2gKbHkVykN8qzYU2+IdfV1qjM54Ao5
         7qLA==
In-Reply-To: <CAOkSjBhBVBLHWWNRC7qZrks0ug_qQ8RH9g_gJQGDA6vZPcNqLA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

I tried to implement the syntax above with no luck.  I have no idea
what I am supposed to do, and I am blindly stabbing around with trial
and error trying to figure this out.  Why don't you just provide me
with a complete example and make it easy for me?  All the examples I
find are broken,wrong, or incomplete.

Jonathan

On Tue, Jul 1, 2014 at 1:32 AM, Arturo Borrero Gonzalez
<arturo.borrero.glez@gmail.com> wrote:
> On 29 June 2014 16:51, Jonathan Johnson <ecybernard@gmail.com> wrote:
>> I followed your example and no go.
>>
>> /sbin/nft add table ip  blackhole
>> nft list tables
>> results:  blackhole
>>
>> nft add set filter blackhole { type ipv4_addr\;}
>> <cmdline>:1:26-42: Error: Could not add set: No such file or directo=
ry
>>
>
> The syntax is:
>
> nft add set <family> <table> <setname> { type ... }
>
> So, you are adding a set named 'blackhole' in a table named 'filter'.
>
> I would suggest to create the filter table.
> --
> Arturo Borrero Gonz=C3=A1lez
