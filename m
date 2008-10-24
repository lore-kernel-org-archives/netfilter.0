From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: tool to search within cidr blocks
Date: Thu, 23 Oct 2008 22:01:12 -0500
Message-ID: <49013A78.3030509@riverviewtech.net>
References: <004301c9347c$6ab0a3c0$4011eb40$@net> <48FFB233.1070706@riverviewtech.net> <006801c93551$1d93fa30$58bbee90$@net> <op.ujhwj8rhrtqp7s@chiyo.azt> <006901c93570$d080a1b0$7181e510$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <006901c93570$d080a1b0$7181e510$@net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/23/2008 7:38 PM, Joey wrote:
> Great catch I totally missed that in my code that builds the save file.
> That has been corrected.
> http://web56.net/iptables-save.cfg
> 
> this is the result of iptables-save http://web56.net/iptables-save-output
> Thanks!

Forgive me if I think something /REALLY/ weird is going on.

I have looked through both your iptables-save.cfg and your 
iptables-save-output (which don't match each other) and I'm stumped. 
I've noticed that both your iptables-save.cfg and your 
iptables-save-output files have lines that appear to be in a different 
(alphabetical(?)) order than the packets passed through your kernel.

Please flush all your tables / chains to kernel defaults and then apply 
your config file and then provide an iptables-save output again.  Also, 
please provide the output of this command "iptables -t filter -L -n -v -x".

I /REALLY/ fell like there is something unknown to you that is outside 
of what you have presented to us.  I have no idea what it is.

Do you realize that you are jumping to your "fail2ban-postifx" chain to 
immediately RETURN to the chain that you jumped from?

Also, you are not using your "fail2ban-postfix-log" chain at all.




Grant. . . .
