From: Jiri Pirko <jpirko@redhat.com>
Subject: [question] ipt_CLUSTERIP and address length
Date: Thu, 25 Feb 2010 11:12:58 +0100
Message-ID: <20100225101257.GC2667@psychotron.lab.eng.brq.redhat.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter-devel@vger.kernel.org
Cc: kaber@trash.net, coreteam@netfilter.org, netfilter@vger.kernel.org

Hi all.

I want to ask if there is any particular reason for ipt_CLUSTERIP to support
only address length of 6 (ETH_ALEN)? It seems to me reasonable for this to work
even with another types of network hw with different addr_len.

Thanks.

Jirka
