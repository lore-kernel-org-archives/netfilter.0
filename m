From: Jeff Kletsky <netfilter@allycomm.com>
Subject: Re: Create set and/or chain accessible across multiple tables
Date: Wed, 23 Aug 2017 11:51:59 -0700
Message-ID: <06974758-bdb2-125f-2d39-bb9ca8529fd9@wagsky.com>
References: <02c72729-72ab-1947-53b7-0a3cbaff4d7a@wagsky.com>
 <CAOkSjBiqzd5PHuFU=_sctb4JxRC0_ibmgcVkgDL8C9qANrCFMQ@mail.gmail.com>
 <CAOkSjBjkO8J7RGUqGSb_nqTTe7roeoMgqd0FnC7+0h_4iz9FQw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAOkSjBjkO8J7RGUqGSb_nqTTe7roeoMgqd0FnC7+0h_4iz9FQw@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Arturo Borrero Gonzalez <arturo@netfilter.org>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

Thanks, yes, a define at the top-level can be accessed throughout.

I chose to select an approach to declare the set in a file that can be 
"included" within any table.

The question about atomic changes comes from my familiarity with and use 
of FreeBSD's ipfw
and its support for atomic operations on only *parts* of a rule set, 
such as:

ipfw set enable <M>
ipfw set disable <M>
ipfw set swap <M> <N>

ipfw [set N] table <name> add <key> <value> [<key> <value> ...]
ipfw [set N] table <name> atomic add <key> <value> [<key> <value> ...]
ipfw [set N] table <name> delete <key> <value> [<key> <value> ...]
ipfw [set N] table <name> swap <name>

For the unfamiliar, in ipfw:

   "set" is a predefined collection of any or all of; rules, tables, 
NAT/NAT64/NPT, ...

   "table" provides functionality similar to nftable's set/dictionary/map


As an example of an application of this, consider that there are two 
possible packet flows that need to be "switched" between.

     /---- path A ----\
---X                  Y--->
     \---- path B ----/

To provide uninterrupted flow, the "switch" point at Y needs to be 
simultaneously changed with that at X


Yes, a full replacement of the rule set will accomplish this. That 
approach has a couple drawbacks:

* In my limited experience, it takes several hundred milliseconds for 
nft to compile and load a ruleset

   This limits the responsiveness of the system and exacerbates the need 
for locking in the next point

* In cases where the running ruleset may have changed from the original 
files that created it,
   or those files or other conditions on which those files and nft 
depend upon have changed,
   it would require:
     1) a dump of the running ruleset
     2) programatically parsing and "editing" the output
     3) feeding the result into nft

   This would locking of the rule set to ensure that there weren't 
changes made during that time by another process or thread


Not a "Joe Public" application, to be certain, but perhaps something to 
consider for future planning.


Jeff




On 8/23/17 3:42 AM, Arturo Borrero Gonzalez wrote:
> BTW, you can reuse the set declaration by using variables:
>
> define ports = {1,2,3,4,5}
> [..]
> set set1 {
>         type inet_service;
>         elements = $ports
> }
> set set2 {
>         type inet_service;
>         elements = $ports
> }
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

