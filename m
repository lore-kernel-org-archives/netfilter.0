From: Frank Myhr <fmyhr@fhmtech.com>
Subject: nft -f fails to merge some chains in same table but defined in
 separate blocks
Date: Fri, 31 Jan 2020 21:57:19 -0500
Message-ID: <657e2684-db7d-0721-d23e-8da6d05054d7@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Subject:From:To; bh=u3qQ4x89qMtIVBEpCAu0D3fqMH2MCBR/hnju56hTfIo=;
        b=lNYZU0s813AhCgupJ3Iht1kDwN1nP+qKdoMwlBzHAjdu4iKWkqoFFycozS3LAByyXciGsX6+lGKWvqbC9UxRFnUIedOL8V1agtkyn/sERimDDm8mITqNvqCF26aw1/nmMLBiNIq33WtQf2Qoth8TPQtRE+jYJUQltdMFZu3BFQY=;
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

Saving the following to <filename> and running 'nft -f <filename>' works 
fine: table t contains sets s1 & s2 and chains c1, c2, c3. But if chain 
c4 is uncommented, nft returns:  Error: Set 's1' does not exist.

Note that chain c4 is exactly the same as chain c2 except for its name, 
and its placement in a separate table block (for the same table).

nft has no problem merging chains c1 & c3 (and sets s1 & s2) which are 
also in separate table blocks for the same table. Is there a way to get 
nft to merge c4 the same way? Or must every chain that contains 
set-matching rules be defined in the same _block_ (not just the same 
table) as the set being matched?

Reason I ask: I'm working toward a modular config that assembles 
multiple files into a single file to be executed by nft -f in order to 
apply the whole thing atomically. So it would be convenient to rely on 
nft to merge multiple blocks for the same table / other structures. But 
maybe I'll need to do this merging before handing the config to nft...?

Thanks,
Frank

----------

#!/usr/sbin/nft -f
table ip t
delete table t
table ip t {
   set s1 {
     type ipv4_addr
     elements = {
       127.0.0.1
     }
   }
   chain c1 {
     ip saddr 127.0.0.1 accept
   }
   chain c2 {
     ip saddr @s1 accept
   }
}
table ip t {
   set s2 {
     type ipv4_addr
     elements = {
       8.8.8.8
     }
   }
   chain c3 {
     ip saddr 192.168.0.1 accept
   }
#  chain c4 {
#    ip saddr @s1 accept
#  }
}
