From: Brian S Julin <BJulin@clarku.edu>
Subject: RE: Do I need ipt_ROUTE to do this?
Date: Wed, 14 Nov 2007 18:45:08 -0500
Message-ID: <5A630F46702DD1498FFD48394B4A664C27DD5914@john.ad.clarku.edu>
References: <5A630F46702DD1498FFD48394B4A664C27DD5909@john.ad.clarku.edu>,<473B23AE.9010106@riverviewtech.net>,<5A630F46702DD1498FFD48394B4A664C27DD590E@john.ad.clarku.edu>
 <5A630F46702DD1498FFD48394B4A664C27DD5910@john.ad.clarku.edu>,<473B51B7.70200@riverviewtech.net>,<5A630F46702DD1498FFD48394B4A664C27DD5913@john.ad.clarku.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5A630F46702DD1498FFD48394B4A664C27DD5913@john.ad.clarku.edu>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: Brian S Julin <BJulin@clarku.edu>, Grant Taylor <gtaylor@riverviewtech.net>, Mail List - Netfilter <netfilter@vger.kernel.org>


I think I may have found a solution -- tc actions:

http://svn.planet-lab.org/browser/iproute2/branches/fedora/doc/actions/mirred-usage?rev=2820

...though I would still have to figure out how to assign a dst MAC address...

