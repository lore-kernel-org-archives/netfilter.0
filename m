From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Portsweep
Date: Tue, 23 Sep 2008 15:36:27 -0500
Message-ID: <48D9534B.4080602@riverviewtech.net>
References: <194384.45623.qm@web55301.mail.re4.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <194384.45623.qm@web55301.mail.re4.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 09/23/08 01:51, bahamin takhtaei wrote:
> Do you know How to use iptables against Portsweep attacks?

There use to be a Port Scan Detection (psd) match extension that would 
help detecting this easier.  I.e. did it look like a system was 
initiating a port scan, and if so, handle it accordingly (drop / reject 
/ tar pit / etc.).  I don't know what the current state of the psd match 
is, so you will have to find out.



Grant. . . .
