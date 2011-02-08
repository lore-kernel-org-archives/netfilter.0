From: Srinivasa T N <seenutn@linux.vnet.ibm.com>
Subject: Re: Rationale behind MARK target only in mangle table
Date: Tue, 08 Feb 2011 15:27:18 +0530
Message-ID: <4D51137E.5010702@linux.vnet.ibm.com>
References: <4D510649.9020309@linux.vnet.ibm.com> <20110208092726.GM6524@ks28632.kimsufi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110208092726.GM6524@ks28632.kimsufi.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On Tuesday 08 February 2011 02:57 PM, Eric Leblond wrote:
> Hi,
>
> On Tuesday, 2011 February  8 at 14:30:57 +0530, Srinivasa T N wrote:
>> Hi All,
>> 	I have not gone through the old discussions (if there was one on
>> this topic).
>> 	I wanted to know the rationale behind allowing MARK target only in
>> the mangle table?
>
> There is almost none and in recent kernel the limitation is not there
> anymore. You can do marking in the filter tables:
> 	iptables -A OUTPUT -j MARK --set-mark 1
>
Thanks.  I was on RHEL 6 (2.6.32) with iptables 1.4.7 and the manpage 
was mis-leading.

Regards,
Seenu.

