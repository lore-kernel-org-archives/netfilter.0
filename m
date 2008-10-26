From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: tool to search within cidr blocks
Date: Sun, 26 Oct 2008 14:08:31 -0500
Message-ID: <4904C02F.6020705@riverviewtech.net>
References: <004301c9347c$6ab0a3c0$4011eb40$@net> <48FFB233.1070706@riverviewtech.net> <006801c93551$1d93fa30$58bbee90$@net> <op.ujhwj8rhrtqp7s@chiyo.azt> <006901c93570$d080a1b0$7181e510$@net> <49013A78.3030509@riverviewtech.net> <007001c9358f$01d1c550$05754ff0$@net> <490156B0.2050905@riverviewtech.net> <007401c93627$38b8f640$aa2ae2c0$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <007401c93627$38b8f640$aa2ae2c0$@net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/24/2008 5:24 PM, Joey wrote:
> I think with all the times we loaded and unloaded our iptables 
> configs and using the type executed by command line, then through 
> iptables-save etc that we trashed iptables hence it was blocking IP's 
> we weren't expecting.  For right now I think the reboot did it....

Ok...  If you are comfortable with that, I guess that is ok.  I would 
suggest keeping an eye on things.  To me that type of failure is a 
symptom of an underlying bug.  However seeing as how we can't duplicate 
the problem we can't troubleshoot it, so it may have been the difference 
between a "-s" and a "-d" in a script that was accidentally created and 
subsequently corrected.  So it is hard to say.

Either way seeing that things are working as expected I'd say you are 
good to go.

> Thanks for all your help!

You are welcome.



Grant. . . .
