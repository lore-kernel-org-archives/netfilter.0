From: Federico Petronio <petronio@agro.uba.ar>
Subject: conn limit question (limit module or similar)
Date: Thu, 13 Nov 2003 12:11:18 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FB39F16.2010708@agro.uba.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello all...

I use for some time a module called 'limit' to limit the amount of 
connections per timeunit to my SMTP server.  But the limitations I found 
is that you need to write a rule that matches to apply the filter:

-A INPUT -s 0/0 -d 0/0 -m limit --limit 60/minute --limit-burst 45 -m 
tcp -p tcp --dport 25 --syn -j SMTPCHAINS

I mean... it is not possible to define something like:

"do no accept more than 60 connections per minute for ANY IP, and, if 
that limit is reach for some IP, do not limit the rest of connections"

since you can not write a rule for all the possible IPs. I found a (not 
so good) solution to this... I divided the IPs range in 8 groups:

-A SMTPCHAINS -s 0.0.0.0/0.0.0.7 -d 0/0 -m limit --limit 45/minute 
--limit-burst 20 -m tcp -p tcp --dport 25 --syn -j ACCEPT
-A SMTPCHAINS -s 0.0.0.1/0.0.0.7 -d 0/0 -m limit --limit 45/minute 
--limit-burst 20 -m tcp -p tcp --dport 25 --syn -j ACCEPT
-A SMTPCHAINS -s 0.0.0.2/0.0.0.7 -d 0/0 -m limit --limit 45/minute 
--limit-burst 20 -m tcp -p tcp --dport 25 --syn -j ACCEPT
-A SMTPCHAINS -s 0.0.0.3/0.0.0.7 -d 0/0 -m limit --limit 45/minute 
--limit-burst 20 -m tcp -p tcp --dport 25 --syn -j ACCEPT
-A SMTPCHAINS -s 0.0.0.4/0.0.0.7 -d 0/0 -m limit --limit 45/minute 
--limit-burst 20 -m tcp -p tcp --dport 25 --syn -j ACCEPT
-A SMTPCHAINS -s 0.0.0.5/0.0.0.7 -d 0/0 -m limit --limit 45/minute 
--limit-burst 20 -m tcp -p tcp --dport 25 --syn -j ACCEPT
-A SMTPCHAINS -s 0.0.0.6/0.0.0.7 -d 0/0 -m limit --limit 45/minute 
--limit-burst 20 -m tcp -p tcp --dport 25 --syn -j ACCEPT
-A SMTPCHAINS -s 0.0.0.7/0.0.0.7 -d 0/0 -m limit --limit 45/minute 
--limit-burst 20 -m tcp -p tcp --dport 25 --syn -j ACCEPT

but I stell want something better. I guess that using some kind of 
connection trucking to know the histoty of connections from each IP 
could be the solution.

The question is... Is there any module o reluset that achive that?

Thank you very much....
-- 

                                        Federico Petronio
                                        petronio@agro.uba.ar
                                        Linux User #129974

---
There are only 10 types of people in the world:
              Those who understand binary and those who don't.



