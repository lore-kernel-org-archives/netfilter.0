From: Guillaume Rembert <guillaume.rembert@euryecetelecom.com>
Subject: Re: Failed to compile =?utf-8?b?bGlibmV0ZmlsdGVyX3F1ZWV1?= 1.0.1 under Centos 6.2
Date: Thu, 30 Aug 2012 12:45:11 +0000 (UTC)
Message-ID: <loom.20120830T144217-112@post.gmane.org>
References: <BLU162-W1607A553582A18B27146E4F6830@phx.gbl> <20120116155809.GC16285@1984>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I had the same issue. Fixing this problem was done not by modifying the code as
you did, but by installing both: libnfnetlink AND libnfnetlink-devel.

Just add EPEL repository and execute:
yum install libnfnetlink*


