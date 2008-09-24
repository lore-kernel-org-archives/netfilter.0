From: John Haxby <john.haxby@oracle.com>
Subject: Re: Portsweep
Date: Wed, 24 Sep 2008 08:59:20 +0100
Message-ID: <48D9F358.3020005@oracle.com>
References: <194384.45623.qm@web55301.mail.re4.yahoo.com> <48D9534B.4080602@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48D9534B.4080602@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Grant Taylor wrote:
> On 09/23/08 01:51, bahamin takhtaei wrote:
>> Do you know How to use iptables against Portsweep attacks?
>
> There use to be a Port Scan Detection (psd) match extension that would 
> help detecting this easier.  I.e. did it look like a system was 
> initiating a port scan, and if so, handle it accordingly (drop / 
> reject / tar pit / etc.).  I don't know what the current state of the 
> psd match is, so you will have to find out.
FWIW, my Netgear DG834N has this in a chain called DOS:

SCAN       all  --  anywhere             anywhere           psd weight-threshold: 21 delay-threshold: 300 lo-ports-weight: 3 hi-ports-weight: 1



Netgear make their source available so you could try looking there.

jch
