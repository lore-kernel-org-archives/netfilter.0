From: Florian Westphal <fw@strlen.de>
Subject: Re: Assertion error when using map
Date: Fri, 3 Jan 2020 00:25:29 +0100
Message-ID: <20200102232529.GL795@breakpoint.cc>
References: <CABa6K_EvuX5EJNNxM+9aESFephAjhos9dmmNmGsZJvjEzHiupQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABa6K_EvuX5EJNNxM+9aESFephAjhos9dmmNmGsZJvjEzHiupQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Changli Gao <xiaosuo@gmail.com>
Cc: netfilter@vger.kernel.org

Changli Gao <xiaosuo@gmail.com> wrote:
> I want to use map to simplify the configuration of DSCP fields with
> the following command:
> 
> > ... ip dscp set meta cgroup map { 3000 : 0x2c, 4000 : 0x20 }
> 
> But it fails with the following message:
> 
> > BUG: invalid mapping expression set reference
> > nft: evaluate.c:1426: expr_evaluate_map: Assertion `0' failed.
> > Aborted (core dumped)
> 
> It seems that the parser recognize the command as a valid one, but the
> later evaluation process doesn't think so.

Yes, this is unsupported.

The problem comes from 'dscp' being of non-byte-divisible length.

tcp dport set 42

is simple:
  [ immediate reg 1 0x00002a00 ]
  [ payload write reg 1 => 2b @ transport header + 2 ..

We can just place the immediate in a register and tell payload
expression to place two bytes from the register at the proper location.

ip dscp set 42

is already more complicated:

  [ payload load 2b @ network header + 0 => reg 1 ]
  [ bitwise reg 1 = (reg=1 & 0x000003ff ) ^ 0x0000a800 ]
  [ payload write reg 1 => 2b @ network header + 0 ..

because 'payload write' size is in bytes, just placing
42 in a register and then telling payload expression to write
that to the proper location in the packet will zero the ecn
signalling bits.

So, nft first loads the existing data, masks off the dscp
bits (retaining everything else sharing the same byte-addressed
location). then xors the immediate (0xa8 == 42 << 2).

Then, the register is written to the packet payload.

In order to support this for map, we would need something
similar to this:

   [ meta load cgroup => reg 1 ]
   [ lookup reg 1 set __map%d dreg 1 ]  # reg1 now contains desired dscp value
   [ payload load 2b @ network header + 0 => reg 2 ] # reg 2: original bytes that need mangling
   [ bitwise reg 2 = (reg=2 & 0x000003ff ) ^ reg1 ] # XOR reg1 into reg2
   [ payload write reg 2 => 2b @ ... # write back reg2 to packet header

This needs quite some work:

We must preprocess the map data values to contain the shifted
immediates, i.e. if user stores 0x20 we need to pass 0x80 to the kernel.

nft does this via 'binop_transfer' in the evaluation phase (but not yet for
maps as you found).

The second, more severe problem is that 'bitwise' only takes one source
register, not two.  So the '[ reg2 &= reg2 & 0x3ff ^ reg1 ] is not
possible at the moment.  nft_bitwise.c in kernel needs to be extended
for this.

We will also likely need surgery on netlink
linearization/delinearization steps.

Regarding bitwise, there are other use cases that will need the
ability to handle more than one sreg, e.g. to restore only parts
of the packet mark to the connmark or vice versa, while retaining
existing bits, so this will need to be added eventually.
