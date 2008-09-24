From: bahamin takhtaei <b_takhtaei@yahoo.com>
Subject: Re: Portsweep
Date: Wed, 24 Sep 2008 01:24:35 -0700 (PDT)
Message-ID: <9050.10781.qm@web55303.mail.re4.yahoo.com>
References: <48D9534B.4080602@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48D9534B.4080602@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>


Thanks for your attention,
but unfortunately psd match doesn't handle portsweep attacks.
It only handles portscan attacks; as you know in portscan an 
attacker scans many ports on a specific destination, but in 
portsweep attacker scans a few ports on many destinations.



--- On Tue, 9/23/08, Grant Taylor <gtaylor@riverviewtech.net> wrote:
From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Portsweep
To: "Mail List - Netfilter" <netfilter@vger.kernel.org>
Date: Tuesday, September 23, 2008, 4:36 PM

On 09/23/08 01:51, bahamin takhtaei wrote:
> Do you know How to use iptables against Portsweep attacks?

There use to be a Port Scan Detection (psd) match extension that would 
help detecting this easier.  I.e. did it look like a system was 
initiating a port scan, and if so, handle it accordingly (drop / reject 
/ tar pit / etc.).  I don't know what the current state of the psd match 
is, so you will have to find out.



Grant. . . .
--
To unsubscribe from this list: send the line "unsubscribe netfilter"
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html



      
