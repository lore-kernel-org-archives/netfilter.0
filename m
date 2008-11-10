From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: DNAT to a specific interface?
Date: Mon, 10 Nov 2008 15:38:21 -0600
Message-ID: <4918A9CD.9020808@riverviewtech.net>
References: <gf9us7$pub$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <gf9us7$pub$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/10/08 12:34, news.gmane.org wrote:
> how can I tell it to use interface eth3?

Set up an IP rule to match either the source port or a mark set by 
IPTables watching for the source port.

With the IP rule in place you can use a different routing table that 
uses a different interface as the source for any traffic using that 
routing table.



Grant. . . .
