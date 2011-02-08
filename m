From: Eric Leblond <eric@regit.org>
Subject: Re: Rationale behind MARK target only in mangle table
Date: Tue, 8 Feb 2011 10:27:26 +0100
Message-ID: <20110208092726.GM6524@ks28632.kimsufi.com>
References: <4D510649.9020309@linux.vnet.ibm.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4D510649.9020309@linux.vnet.ibm.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Srinivasa T N <seenutn@linux.vnet.ibm.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi,

On Tuesday, 2011 February  8 at 14:30:57 +0530, Srinivasa T N wrote:
> Hi All,
> 	I have not gone through the old discussions (if there was one on
> this topic).
> 	I wanted to know the rationale behind allowing MARK target only in
> the mangle table?

There is almost none and in recent kernel the limitation is not there
anymore. You can do marking in the filter tables:
	iptables -A OUTPUT -j MARK --set-mark 1

BR,
-- 
Eric Leblond <eric@regit.org>
