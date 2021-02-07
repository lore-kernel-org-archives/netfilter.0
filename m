From: Martin Gignac <martin.gignac@gmail.com>
Subject: Where is the ICMP *type* information in nft 0.9.8 trace output?
Date: Sun, 7 Feb 2021 08:21:06 -0500
Message-ID: <CANf9dFNK+APd2Pn0twresoZic60q+cFJ+yxc77fggYZKsf-11A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=zS0923+4WGWu7NH9zYFyXc969P8IRZtKAKZE70AL2S8=;
        b=dVbdcorLeIjyAuBlj+w9C/mKaLdhSucUIiSaO7FLJLogCGp/hiYtJ3aFdqBK/W7oEv
         FsB4jRgDtlAviSXUOzfjJxW+vXcKOF+anEPN0fNzZYGXzwZPBw1Iv782GTQFxOJoH6Z8
         WHvXIKqZF/RzuvoSoy+EmCSiZWPUnMakFzJMf7GSXlMsKu+Rw9khcsjgw9PF0FofJhQ9
         9xNSNcT78p5/Yap81wwTvDYu/iF26o8z8+zTYRexPnU1kGin4AvlT2ymXs46QQl0UubZ
         Z7UyKllyF7WD3VCTpwhL0SoxXASXom79aQ+xBq6adTdMVabSnW01tFnv5AiihTAGipUv
         46dQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm doing some tracing with nft 0.9.8 and I am seeing something which
I'm not sure is a bug or just me doing something wrong.

I've got this chain in my ruleset:

  chain trace_chain {
    type filter hook prerouting priority -301;
    ip daddr 24.153.88.9 ip protocol icmp meta nftrace set 1
  }

When I run 'nft monitor trace' and do a ping to 24.153.88.9 I get this:

  trace id d89e0527 inet filter trace_chain packet: iif "ens2f4" ether
saddr 3c:fd:fe:d0:21:31 ether daddr 00:07:43:3e:b5:40 ip saddr
192.168.1.4 ip daddr 24.153.88.9 ip dscp cs0 ip ecn not-ect ip ttl 64
ip id 48512 ip protocol icmp ip length 84 icmp code net-unreachable
icmp id 7698 icmp sequence 1 @th,64,96 70826276232191064865536871936

I didn't understand why I was getting 'icmp code net-unreachable' when
I should be getting something like 'icmp code echo-request', so I
re-ran the trace with 'nft -nn monitor trace':

  trace id f3014662 inet filter trace_chain packet: iif "ens2f4" ether
saddr 3c:fd:fe:d0:21:31 ether daddr 00:07:43:3e:b5:40 ip saddr
192.168.1.4 ip daddr 24.153.88.9 ip dscp 0x00 ip ecn 0x0 ip ttl 64 ip
id 56274 ip protocol 1 ip length 84 icmp code 0 icmp id 7700 icmp
sequence 1 @th,64,96 75468551379511240899085402624

I then realized that 'icmp code net-unreachable' is correct *if* the
icmp *type* is 1 or 2, but not if the type is 8, which is the case for
an echo request. I then also realized that the ICMP *type* information
was missing from the trace.

So my question is this: am I misunderstanding the trace output or is
there some sort of bug?

Bonus question: if instead of calling the chain "trace_chain", I call
it "chain", like so:

  chain trace {
    type filter hook prerouting priority -301;
    ip daddr 24.153.88.9 ip protocol icmp meta nftrace set 1
  }

When I try loading the ruleset I get this error:

  /etc/firewall/rules.nft:40:9-13: Error: syntax error, unexpected
trace, expecting string
  chain trace {
        ^^^^^
Is 'trace' some sort of reserved keyword? I thought chains could be
called anything. Can they not?

Thanks,
-Martin
