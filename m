From: Chris Hall <nftables@gmch.uk>
Subject: Re: Failing to construct a 'set' for TCP Flag filtering.
Date: Thu, 3 Sep 2020 18:44:18 +0100
Message-ID: <ac91e032-b055-6687-6ec8-a880b16171b6@gmch.uk>
References: <S1728814AbgIBQSI/20200902161835Z+839@vger.kernel.org>
 <4c39e878-8c4d-24a8-543e-206e1ca0a458@gmch.uk> <20200902175133.GA5283@salvia>
 <ae5d9b55-b77d-0a1e-d236-be67eb9333ce@gmch.uk>
 <20200903142439.GL7319@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20200903142439.GL7319@breakpoint.cc>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 03/09/2020 15:24, Florian Westphal wrote:
...
> Try
> 
>   ./configure PKG_CONFIG_PATH=/path/to/where/the/1.1.7.pc-file-is

Thank you.  I have now succeeded in building nft and libnftnl.so.11.3.0, 
and copying same to the firewall machine.  (Yay!)

Having applied the suggested patch, I now find that with the (same) file 
'tryx' as before I now get:

# nft -f tryx
table ip MAIN {
         set tcp_good_flags {
                 type tcp_flag
                 flags constant
         }
}

...which appears to be a step backwards :-(  BUT when I now check the 
ruleset I get:

# nft list ruleset
table ip MAIN {
         set tcp_good_flags {
                 type tcp_flag
                 flags constant
                 elements = { fin | psh | ack | urg, fin | psh | ack, 
fin | ack | urg, fin | ack, syn | psh | ack | urg,
                              syn | psh | ack, syn | ack | urg, syn | 
ack, syn, rst | psh | ack | urg,
                              rst | psh | ack, rst | ack | urg, rst | 
ack, rst, psh | ack | urg,
                              psh | ack, ack | urg, ack }
         }
}

So it's not crashing any more -- hurrah !

BTW: if I have a 'list ruleset' in an .nft script, what should I expect 
it to show me ?  I ask because if I do (as above):

# nft -f xxxx.nft      -- where the last line is 'list ruleset'
# nft list ruleset

the second command seems to show a more complete ruleset ?

FWIW:

   add rule ip MAIN FORWARD tcp flags & (fin|syn|rst|ack|psh|urg) \
     @tcp_good_flags goto FwdTCP

is accepted (and I hope will do what I want !).

Thanks,

Chris
