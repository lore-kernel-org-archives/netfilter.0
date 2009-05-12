From: Tino Keitel <tkeitel@innominate.com>
Subject: Re: How to use mark and connmark in one rule
Date: Tue, 12 May 2009 15:00:28 +0200
Message-ID: <20090512130028.GA19645@tkeitel002.bln.innominate.local>
References: <20090424133235.GA14156@tkeitel002.bln.innominate.local> <49F1C0B4.8010809@standarduniversal.com.au> <49F1C120.8090802@standarduniversal.com.au>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <49F1C120.8090802@standarduniversal.com.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Fri, Apr 24, 2009 at 23:39:44 +1000, Brian Austin - Standard Universal wrote:
> that should be 2 separate lines.. stupid email
>
> iptables -A INPUT -m mark --mark 1
>
> iptables -A INPUT -m connmark --mark 2

I want to match packets with both a specific nfmark _and_ a specific
connmark, so I need both matches in one rule.

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

----------------------------------------------------------------
Visit us at the Hannover Messe in Germany
20 - 24 April 2009, Hall 9, Stand F54
----------------------------------------------------------------

Register Court: AG Charlottenburg, HRB 81603 Management Board: Dirk
Seewald, Chairman of the Supervisory Board: Volker Bibelhausen

INNOMINATE HAS MOVED. PLEASE NOTE THAT OUR BUSINESS CONTACT DATA HAS
CHANGED.
