From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: problem in openning a port
Date: Thu, 12 May 2011 17:38:57 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105121737030.19920@obet.zrqbmnf.qr>
References: <713633.15807.qm@web111723.mail.gq1.yahoo.com> <1305214450.32402.77.camel@sjohnson.state.ar.us>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1305214450.32402.77.camel@sjohnson.state.ar.us>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Johnson <stephen.johnson@arkansas.gov>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, Mahmood Naderan <nt_mahmood@yahoo.com>

On Thursday 2011-05-12 17:34, Stephen Johnson wrote:

>On Thu, 2011-05-12 at 10:05 -0500, Mahmood Naderan wrote:
>> Hi,
>> beofore openning  a port, I checked which port is open:
>> 
>> Then I opened a port with
>> mahmood@client:~$ sudo iptables -A INPUT -p tcp -d 0/0 -s 0/0 --dport 4949 -j ACCEPT

Why do you specify redundant arguments like -s 0/0?
Secondly, the rule may be appended in a place where it is never reached, 
rendering it useless.

>> However netstat doen't show it is open:

And for the record, use modern tools like ss (ss -an; ss -alntp 
perhaps in this case).


PS: Wraths to those who strip the Cc list.
