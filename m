From: Robert White <rwhite@pobox.com>
Subject: Re: Configure conntrack and understand timestamp
Date: Mon, 13 Feb 2017 00:43:14 +0000
Message-ID: <35f4649f-825d-2a28-5a62-701cd03e9d28@pobox.com>
References: <!&!AAAAAAAAAAAYAAAAAAAAAOosgHnoPqdNlUO2DUrQ/DfCgAAAEAAAAFK7h3ZgWDNHt5MtE3gECVIBAAAAAA==@manfbraun.de>
 <f19d7a7e-d2b0-4bc4-7e26-d63c782a93db@plouf.fr.eu.org>
 <!&!AAAAAAAAAAAYAAAAAAAAAOosgHnoPqdNlUO2DUrQ/DfCgAAAEAAAAE1DcWUJ7P1AhRMlbZV5UewBAAAAAA==@manfbraun.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAOosgHnoPqdNlUO2DUrQ/DfCgAAAEAAAAE1DcWUJ7P1AhRMlbZV5UewBAAAAAA==@manfbraun.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: webman@manfbraun.de, 'Pascal Hambourg' <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

On 02/12/17 21:51, webman@manfbraun.de wrote:
> messages about this line:
> "options nf_conntrack acct=1 tstamp=1"

> systemd-modules-load[5938]: Failed to find module 'nf_conntrack acct=1
> tstamp=1'

I hope you didn't use the quotes. But that's the only way I can think of 
the system including the spaces and expressions in the module name.
