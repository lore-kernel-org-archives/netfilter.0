From: Llorente Santos Jesus <jesus.llorente.santos@aalto.fi>
Subject: SYNPROXY target issue with TCP reset sent from server after initial
 syn
Date: Tue, 21 Jun 2016 12:34:02 +0000
Message-ID: <A404B5896AB4F5468A8755AFC23F7317E431E333@EXMDB04.org.aalto.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Dear all,

I'm attempting  to set up a scenario where a router connects two networks (A and B) and uses SYNPROXY when new TCP connections are initiated A-to-B direction.
My server is located in network B and the remote client in network A. Both hosts use this router as default gateway for their traffic.

I have followed the available instructions for setting up SYNPROXY and it seems to work very straightforward. I am using the SYNPROXY rule in filter FORWARD chain.

If the server-B is running in my network-B, client-A can connect perfectly to it and the connection is relayed by the SYNPROXY in the router, back and forth. However, and this is the reason why I am contacting the mailing list, SYNPROXY seems to fail if a TCP RST,ACK is sent by the server-B when the server process is not running. The TCP RST,ACK does not seem to be mangled by the SYNPROXY as it answered with TCP SEQ 0x00 and contains no TCP header options.

After checking the code, I think I may have back traced the issue to the file ipt_SYNPROXY.c (line 360), in the function ipv4_synproxy_hook()
    case TCP_CONNTRACK_SYN_SENT:
                                if (!synproxy_parse_options(skb, thoff, th, &opts))
                                                return NF_DROP;
            
Would you please clarify if the current behavior is the intended one or is this some kind of bug?

Thank you!
Jesus Llorente
