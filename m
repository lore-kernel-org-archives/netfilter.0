From: Marek Kierdelewicz <marek@piasta.pl>
Subject: DNETMAP module update
Date: Thu, 28 Jun 2012 21:45:52 +0200
Message-ID: <20120628214552.1a253642@catus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi guys,

Just a note that new DNETMAP module functionality is available. Code
has already been submitted to xtables-addons project and accepted by
Jan Engelhardt (thanks!).

Changes:
- new static binding type
- new persistent flag option for prefix
- add extra information in /proc/net/xt_DNETMAP/prefix_stat that include
static binding count and persistent flag 
- add proc interface write support (add/del/flush binding)
- updated manual 
- log prefix exhaustion/freeup events only, not each rule hit with
  exhaused prefix - it ensures no log storm in case of dnetmap prefix
  depletion and use of 1:n fallback 
- allow larget ttl value as rule option - allows specifying ttl as high
  as one day

For more information and configuration examples, please go to
http://cat.piasta.pl/dnetmap/

Best regards,
Marek Kierdelewicz
