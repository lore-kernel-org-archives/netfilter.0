From: Tino Keitel <tkeitel@innominate.com>
Subject: Re: Conntrackd and UDP
Date: Thu, 11 Feb 2010 08:22:18 +0100
Message-ID: <20100211072218.GA28517@tkeitel002.bln.innominate.local>
References: <1235464670.9964.13.camel@menhir.cc.uniud.it>
 <49A3FA77.2090305@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <49A3FA77.2090305@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On Tue, Feb 24, 2009 at 14:47:35 +0100, Pablo Neira Ayuso wrote:

[...]

> It depends on the UDP traffic and your rule-set, for example, I
> don't synchronize UDP DNS traffic but you may want to do it for
> long-standing UDP flows for real-time communications. With regards

Hi,

that sounds like other UDP traffic can be synced. However, it looks
like conntrackd does not support UDP at all. Are there plans to support
it in upcoming releases?

Regards,

-- 
Tino Keitel
Software Engineer
 
Innominate Security Technologies AG
/protecting industrial networks/
Tel: +49.30.921028-206
Fax: +49.30.921028-020
Rudower Chaussee 13
12489 Berlin / Germany
http://www.innominate.com/

Register Court: AG Charlottenburg, HRB 81603 Management Board: Dirk
Seewald, Chairman of the Supervisory Board: Volker Bibelhausen
