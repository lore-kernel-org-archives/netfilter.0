From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Interesting message
Date: Fri, 05 Oct 2007 13:37:37 -0500
Message-ID: <47068471.5000403@riverviewtech.net>
References: <C32BD5C1.3419%jlay@slave-tothe-box.net>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <C32BD5C1.3419%jlay@slave-tothe-box.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/05/07 12:51, James Lay wrote:
> So I'm not sure how I managed to do this, but here it is:
> 
> sudo iptables -A FORWARD -s 10.0.0.0/8 -m string --string 
> "myspace.com" --algo bm -j DROP
> iptables: match `string' v1.3.6 (I'm v1.3.8).
> 
> I'm running kernel 2.6.21.7.  Is there something I'm missing to get 
> this to fly?  Thanks all.


I'm not sure but it looks like you have a kernel IPTables version vs 
IPTables module version mismatch.  Did you by chance upgrade your kernel 
or have any updates applied to your system?



Grant. . . .
