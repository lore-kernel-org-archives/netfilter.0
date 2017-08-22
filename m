From: Jeff Kletsky <netfilter@allycomm.com>
Subject: Re: Diagnosing "Error: NAT is only supported for IPv4/IPv6"
Date: Tue, 22 Aug 2017 12:48:24 -0700
Message-ID: <f59dbbb0-8d1b-8a0d-4d30-1b79196376c2@wagsky.com>
References: <5156c091-4b06-9efd-fd33-9a117f526572@wagsky.com>
 <94b2bbfe-b72f-992f-b1c6-ec36e0aa4c1b@wagsky.com>
 <20170822173315.GA18186@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20170822173315.GA18186@salvia>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

No updates seen from git (my build was previously done on 2017-08-19),
but did an uninstall, re-configure, make, reinstall to confirm.


I do see in output from 'git log'

commit 509671dfa03365bba727b8be5e522b737da93a6f
Author: Pablo Neira Ayuso <pablo@netfilter.org>
Date:   Thu Jun 15 14:35:33 2017 +0200


I have confirmed that nft is not available after the uninstall


Same behavior as before

Jeff


       1 #!/usr/sbin/nft -f
       2
       3 flush ruleset
       4
       5 table inet global {
       6
       7     chain nat_in {
       8         type nat hook prerouting priority -100
       9     continue
      10     }
      11
      12     chain nat_out {
      13         type nat hook postrouting priority -100
      14     continue
      15     }
      16
      17 }

$ sudo nft -f tmp
tmp:3:1-14: Error: Could not process rule: No such file or directory
flush ruleset
^^^^^^^^^^^^^^
tmp:3:1-14: Error: Could not process rule: No such file or directory
flush ruleset
^^^^^^^^^^^^^^
tmp:3:1-14: Error: Could not process rule: No such file or directory
flush ruleset
^^^^^^^^^^^^^^
tmp:3:1-14: Error: Could not process rule: No such file or directory
flush ruleset
^^^^^^^^^^^^^^

~/build/nftables$ git log -1
commit d74eed8c9649e9278b69f2cd0fd92f71e3e19cfb (HEAD -> master, tag: 
2017-08-19, origin/master, origin/HEAD)
Author: Varsha Rao <rvarsha016@gmail.com>
Date:   Wed Aug 16 19:48:17 2017 +0530

~/build/libmnl$ git log -1
commit fbe0f33b45abd585eb9f52cb56d751a750667dc6 (HEAD -> master, tag: 
2017-08-19, origin/master, origin/HEAD)
Author: Guillaume Nault <g.nault@alphalink.fr>
Date:   Wed Aug 3 12:52:34 2016 +0200

~/build/libnftnl$ git log -1
commit d58998312375de0865091cfc5d00ddd271d9a44c (HEAD -> master, tag: 
2017-08-19)
Author: Eric Leblond <eric@regit.org>
Date:   Thu Jul 6 13:58:27 2017 +0100





On 8/22/17 10:33 AM, Pablo Neira Ayuso wrote:
> On Tue, Aug 22, 2017 at 09:55:10AM -0700, Jeff Kletsky wrote:
>> Digging into the cause (and, for now ignoring the unhelpful error message),
>> this appears to be a bug in nft
>>
>> No matter what the documentation says, it appears that NAT statements can't
>> be in an "inet" table
>>
>> Parses and loads with "table ip"
>> ================================
>>
>> #!/usr/sbin/nft -f
>>
>> flush ruleset
>>
>> table ip global {
>>
>>      chain nat_in {
>>          type nat hook prerouting priority -100
>>      continue
>>      }
>>
>>      chain nat_out {
>>          type nat hook postrouting priority -100
>>      continue
>>      }
>>
>> }
>>
>>
>> Fails with "table inet"
>> =======================
>>
>> #!/usr/sbin/nft -f
>>
>> flush ruleset
>>
>> table inet global {
>>
>>      chain nat_in {
>>          type nat hook prerouting priority -100
>>      continue
>>      }
>>
>>      chain nat_out {
>>          type nat hook postrouting priority -100
>>      continue
>>      }
>>
>> }
>>
>>
>> The error messages here are different, but equally useless
>>
>> $ sudo nft -f nftables.conf
>> nftables.conf:3:1-14: Error: Could not process rule: No such file or
>> directory
>> flush ruleset
>> ^^^^^^^^^^^^^^
>> nftables.conf:3:1-14: Error: Could not process rule: No such file or
>> directory
>> flush ruleset
>> ^^^^^^^^^^^^^^
>> nftables.conf:3:1-14: Error: Could not process rule: No such file or
>> directory
>> flush ruleset
>> ^^^^^^^^^^^^^^
>> nftables.conf:3:1-14: Error: Could not process rule: No such file or
>> directory
>> flush ruleset
>> ^^^^^^^^^^^^^^
> This is working since:
>
> commit 509671dfa03365bba727b8be5e522b737da93a6f
> Author: Pablo Neira Ayuso <pablo@netfilter.org>
> Date:   Thu Jun 15 14:35:33 2017 +0200
>
>      src: error reporting for nested ruleset representation
>
> Would you give a try to nft.git snapshot to confirm this?
>
> This will be included in the next release.
>

