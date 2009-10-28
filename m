From: John Haxby <john.haxby@oracle.com>
Subject: Re: explanation of the syslog LEN and WINDOW entries
Date: Wed, 28 Oct 2009 15:35:25 +0000
Message-ID: <4AE864BD.5080508@oracle.com>
References: <b376a78e0910280653y6312fc63yb2d20414d76a1ce0@mail.gmail.com>	 <56378e320910280720q79cd3dma8eee31f3512a6c0@mail.gmail.com> <b376a78e0910280756h4ba10f1oea023c6b870fe0cb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <b376a78e0910280756h4ba10f1oea023c6b870fe0cb@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Jensen <jjensen@unyalli.com>
Cc: netfilter@vger.kernel.org

On 28/10/09 14:56, Jeff Jensen wrote:
> The boss wants to know how much bandwidth is used by the different
> app's we allow. I have some unique app's that run on unique port(s)
> and rules that log all packets. I set the --log-prefix= to something
> unique to that app and every day sort it out into individual files. I
> was hoping to aggregate all the entries to a total bandwidth out and
> it.
>    

I do this slightly differently.   I collect information on a per-IP 
address basis (this is all traffic flowing through a router) and within 
each table I have rows that match a particular port/protocol and then 
just -j RETURN.

Every hour I run "iptables -vxnL <table> -Z" for each table and then 
merge the counters into a database.  I have another process that 
periodically looks at the database and produces pretty graphs of the 
per-machine, per-protocol usage.  (Well, actually, I haven't done 
per-protocol yet, but I have the information needed.)

There's an accounting extension in xtables which would do the job 
better, but I haven't attempted to persuade the xtables on CentOS 5 :-)

jch
